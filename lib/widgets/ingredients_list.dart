// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:foryori/widgets/ingredient_tile.dart';
import 'package:flutter/material.dart';
import 'package:foryori/widgets/ingredient_tile.dart';
import 'package:foryori/models/data.dart';
import 'package:provider/provider.dart';

class IngredientsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<IngredientData>(
      builder: (context, ingredientData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final ingredient = ingredientData.ingredients[index];
            return IngredientTile(
              ingredientTitle: ingredient.name,
              isChecked: ingredient.isDone,
              checkboxCallback: (checkboxState) {
                ingredientData.updateIngredient(ingredient);
              },
              longPressCallback: () {
                ingredientData.deleteIngredient(ingredient);
              },
            );
          },
          itemCount: ingredientData.ingredientCount,
        );
      },
    );
  }
}