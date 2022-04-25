import 'package:flutter/material.dart';
import 'package:foryori/widgets/ingredients_list.dart';
import 'package:foryori/screens/add_ingredient.dart';
import 'package:provider/provider.dart';
import 'package:foryori/models/data.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff009688),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff009688),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child:Container(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddIngredient(),
                )
              )
          );
        },
        child: const Icon(Icons.add),
        ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding:
              EdgeInsets.only(top: 60.0, left: 30.0, right: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Color(0xff009688),
                      ),
                      backgroundColor: Colors.white,
                      radius: 30.0
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Recipe1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  // Text(
                  //   '12 ingredients',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 18,
                  //   ),
                  // ),

                ],
              )
          ) ,
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )) ,
              child: IngredientsList(),
            ),
          ),
        ],
      ),
    );
  }
}





