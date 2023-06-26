import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/TodoProvider.dart';

class AddTodoDialog extends StatefulWidget {
  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<AddTodoDialog> {
  bool _completed = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return AlertDialog(
      title: Text('Add Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text('Completed'),
              Switch(
                value: _completed,
                onChanged: (value) {
                  setState(() {
                    _completed = value;
                  });
                },
              ),
            ],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final title = _titleController.text;
            final description = _descriptionController.text;

            if (title.isNotEmpty && description.isNotEmpty) {
              todoProvider.addTodo(
                title: title,
                description: description,
                completed: _completed,
              );
            }

            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
