import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calorie_counter_model.dart';

class CalorieCounterWidget extends StatefulWidget {
  const CalorieCounterWidget({Key? key}) : super(key: key);

  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounterWidget> {
  List<FoodItem> _foodItems = [];

  void _addFoodItem(String name, int calories) {
    setState(() {
      _foodItems.add(FoodItem(name, calories));
    });
  }

  void _deleteFoodItem(int index) {
    setState(() {
      _foodItems.removeAt(index);
    });
  }

  int _calculateTotalCalories() {
    int totalCalories = 0;

    for (FoodItem foodItem in _foodItems) {
      totalCalories += foodItem.calories;
    }

    return totalCalories;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calorie Counter'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'Food Item',
            ),
            onSubmitted: (String value) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Add Calories'),
                    content: TextField(
                      decoration: InputDecoration(
                        labelText: 'Calories',
                      ),
                      keyboardType: TextInputType.number,
                      onSubmitted: (String value) {
                        _addFoodItem(value, int.parse(value));
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              );
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _foodItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_foodItems[index].name),
                  subtitle: Text('${_foodItems[index].calories} calories'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteFoodItem(index);
                    },
                  ),
                );
              },
            ),
          ),
          Text(
            'Total Calories: ${_calculateTotalCalories()}',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}
