import 'package:flutter/material.dart';
import 'package:foryori/models/ingredient.dart';
import 'package:provider/provider.dart';
import 'package:foryori/models/data.dart';


class AddIngredient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newIngredientTitle = "";

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
                'Add Ingredient',
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30.0,
                color: Color(0xff009688),
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newIngredientTitle = newText;
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                primary: Color(0xff009688),
              ),
              onPressed: () {
                Provider.of<IngredientData>(context, listen: false).addIngredient(newIngredientTitle);
                Navigator.pop(context); },
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
