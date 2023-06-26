import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/TodoProvider.dart';
import './screens/TodoScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TodoScreen(),
      ),
    );
  }
}
