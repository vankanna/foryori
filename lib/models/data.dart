import 'package:flutter/foundation.dart';
import 'package:foryori/models/ingredient.dart';
import 'dart:collection';

class IngredientData extends ChangeNotifier {
  final List<Ingredient> _ingredients = [
    Ingredient(name: 'milk'),
    Ingredient(name: 'eggs'),
    Ingredient(name: 'bread'),
  ];

  UnmodifiableListView<Ingredient> get ingredients {
    return UnmodifiableListView(_ingredients);
  }

  int get ingredientCount {
    return _ingredients.length;
  }

  void addIngredient(String newIngredientTitle) {
    final ingredient = Ingredient(name: newIngredientTitle);
    _ingredients.add(ingredient);
    notifyListeners();
  }

  void updateIngredient(Ingredient ingredient) {
    ingredient.toggleDone();
    notifyListeners();
  }

  void deleteIngredient(Ingredient ingredient) {
    _ingredients.remove(ingredient);
    notifyListeners();
  }
}
