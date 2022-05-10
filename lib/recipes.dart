import 'package:flutter/material.dart';

class Ingredient {
  String name = '';
  String measurmentType = '';
  double amount = 0;
  Ingredient(String name, String measurmentType, double amount) {
    this.name = name;
    this.measurmentType = measurmentType;
    this.amount = amount;
  }
}

class Recipe {
  String title = '';
  List<Ingredient> ingredients = [];
  Recipe(String title, List<Ingredient> ingredients) {
    this.title = title;
    this.ingredients = ingredients;
  }
}

extension on List<Ingredient> {
  void addIngredient(
      {required String name,
      required String measurmentType,
      required double amount}) {
    if (isNotEmpty) {
      try {
        var ingredient = firstWhere((i) => i.name == name);
        ingredient.amount += amount;
      } catch (e) {
        add(Ingredient(name, measurmentType, amount));
      }
    } else {
      add(Ingredient(name, measurmentType, amount));
    }
  }
}

Ingredient oneCupRice = Ingredient("rice", "cups", 1);
Ingredient oneSeaweedSheet = Ingredient("seaweed", "sheet", 1);
Ingredient fourHundredGramsRiceNoodle = Ingredient("rice noodle", "grams", 400);
Ingredient oneOnion = Ingredient("onion", "onion/s", 1);
Ingredient oneGarlicClove = Ingredient("garlic", "clove/s", 1);
Ingredient sixGarlicClove = Ingredient("garlic", "clove/s", 6);
Ingredient onePoundPorkBelly = Ingredient("porkbelly", 'pounds', 1);
Ingredient oneTeaspoonGochujang = Ingredient('gochujang', "teaspoon/s", 1);

Recipe kimbap =
    Recipe("kimbap", [oneCupRice, oneSeaweedSheet, fourHundredGramsRiceNoodle]);
Recipe bossam =
    Recipe("bossam", [oneCupRice, oneOnion, sixGarlicClove, onePoundPorkBelly]);
Recipe bokkumbap = Recipe("bokkumbap", [
  oneCupRice,
  oneOnion,
  sixGarlicClove,
  onePoundPorkBelly,
  oneTeaspoonGochujang
]);

class Recipes extends StatefulWidget {
  @override
  RecipesState createState() => RecipesState();
}

class RecipesState extends State<Recipes> {
  List<Recipe> _recipeList = [kimbap, bossam, bokkumbap];
  List<Recipe> _savedRecipes = [];
  List<Ingredient> _totalIngredients = <Ingredient>[];

  Widget _buildList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemCount: _recipeList.length,
      itemBuilder: (BuildContext context, index) {
        return _buildRow(_recipeList[index]);
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }

  Widget _buildRow(recipe) {
    final alreadySaved = _savedRecipes.contains(recipe);

    return ListTile(
        title: Text(recipe.title, style: TextStyle(fontSize: 18.0)),
        trailing: Icon(
            alreadySaved ? Icons.add_circle : Icons.add_circle_outline,
            color: alreadySaved ? Colors.purple[800] : null),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _savedRecipes.remove(recipe);
            } else {
              _savedRecipes.add(recipe);
            }
          });
        });
  }

  RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

  void _makeIngredientList() {
    _savedRecipes.forEach((Recipe recipe) {
      recipe.ingredients.forEach((Ingredient ingredient) {
        _totalIngredients.addIngredient(
            name: ingredient.name,
            measurmentType: ingredient.measurmentType,
            amount: ingredient.amount);
      });
    });
  }

  void _pushSaved() {
    _makeIngredientList();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles =
          _totalIngredients.map((Ingredient ingredient) {
        return ListTile(
            title: Text(
                ingredient.amount.toString().replaceAll(regex, '') +
                    " " +
                    ingredient.measurmentType +
                    " " +
                    ingredient.name,
                style: TextStyle(fontSize: 16.0)));
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();
      _totalIngredients = <Ingredient>[];
      return Scaffold(
          appBar: AppBar(title: Text('Ingredients Needed')),
          body: ListView(children: divided));
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipes'),
          backgroundColor: Colors.purple[800],
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
          ],
        ),
        body: _buildList());
  }
}
