import 'package:flutter/material.dart';
import 'package:foryori/screens/tasks_screen.dart';
import 'package:provider/provider.dart';
import 'package:foryori/models/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => IngredientData(),
      child: MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}