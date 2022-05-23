// Packages
import 'package:flutter/material.dart';

// Models
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class favoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  favoritesScreen(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            complexity: favoriteMeals[index].complexity,
            affordability: favoriteMeals[index].affordability,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
