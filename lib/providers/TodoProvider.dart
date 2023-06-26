import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

import '../models/TodoModel.dart';

class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];
  List<String> _selectedTodos = [];

  List<Todo> get todos => _todos;

  List<String> get selectedTodos => _selectedTodos;

  void addTodo({
    required String title,
    required String description,
    required bool completed,
  }) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      completed: completed,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  void updateTodo({
    required String id,
    required String title,
    required String description,
    required bool completed,
  }) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      _todos[index] = Todo(
        id: id,
        title: title,
        description: description,
        completed: completed,
      );
      notifyListeners();
    }
  }

  void deleteTodoById(String id) {
    _todos.removeWhere((todo) => todo.id == id);
    if (_selectedTodos.contains(id)) {
      _selectedTodos.remove(id);
    }
    notifyListeners();
  }

  void toggleTodoCompletion(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final updatedTodo = _todos[index].copyWith(completed: !_todos[index].completed);
      _todos[index] = updatedTodo;
      notifyListeners();
    }
  }

  void toggleTodoSelection(String id) {
    if (_selectedTodos.contains(id)) {
      _selectedTodos.remove(id);
    } else {
      _selectedTodos.add(id);
    }
    notifyListeners();
  }

  void deleteSelectedTodos() {
    _todos.removeWhere((todo) => _selectedTodos.contains(todo.id));
    clearSelectedTodos();
    notifyListeners();
  }

  void clearSelectedTodos() {
    _selectedTodos.clear();
  }

  bool isSelected(String id) {
    return _selectedTodos.contains(id);
  }

  Todo getTodoById(String id) {
    final index = _todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      return _todos[index];
    }
    throw Exception('Todo not found with id: $id');
  }
}
