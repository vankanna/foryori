import 'package:flutter/material.dart';

class IngredientTile extends StatelessWidget {
  final bool isChecked;
  final String ingredientTitle;
  final void Function(bool?)? checkboxCallback;
  final void Function()? longPressCallback;

  IngredientTile(
      {required this.isChecked,
        required this.ingredientTitle,
        required this.checkboxCallback,
        required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallback,
      title: Text(
        ingredientTitle,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
