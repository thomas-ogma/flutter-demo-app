import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/TodoProvider.dart';
import '../dialogs/Todo/AddTodo.dart';
import '../dialogs/Todo/EditTodo.dart';

class TodoScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void _showEditDialog(BuildContext context, TodoProvider todoProvider, String todoId) {
    final todo = todoProvider.getTodoById(todoId);
    showDialog(
      context: context,
      builder: (context) => EditTodoDialog(todo: todo),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        actions: [
          if (todoProvider.selectedTodos.length == 1)
            IconButton(
              onPressed: () {
                final String selectedTodoId = todoProvider.selectedTodos.first;
                _showEditDialog(context, todoProvider, selectedTodoId);
              },
              icon: Icon(Icons.edit),
            ),
          if (todoProvider.selectedTodos.length >= 1)
            IconButton(
              onPressed: () => todoProvider.deleteSelectedTodos(),
              icon: Icon(Icons.delete),
            ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                final isSelected = todoProvider.isSelected(todo.id);
                final backgroundColor = todo.completed
                    ? Color.fromRGBO(144, 238, 144, 1)
                    : Color.fromRGBO(173, 216, 230, 1);

                return ListTile(
                  tileColor: backgroundColor,
                  title: Text(todo.title ?? ''),
                  subtitle: Text(todo.description ?? ''),
                  trailing: Checkbox(
                    value: isSelected,
                    onChanged: (_) =>
                        todoProvider.toggleTodoSelection(todo.id),
                  ),
                  onTap: () => todoProvider.toggleTodoSelection(todo.id),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AddTodoDialog(),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
