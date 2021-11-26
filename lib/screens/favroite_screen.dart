import 'package:flutter/material.dart';
import 'package:shop_app/Models/meal.dart';
import 'package:shop_app/widgets/meal_items.dart';

class FavroiteScreen extends StatelessWidget {
  List<Meal> favoriteMeal;
  FavroiteScreen(this.favoriteMeal);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeal.isEmpty) {
      return const Center(
        child: Text('You have no favorite yet - start adding now!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
              id: favoriteMeal[index].id,
              title: favoriteMeal[index].title,
              imageUrl: favoriteMeal[index].imageUrl,
              duration: favoriteMeal[index].duration,
              complexity: favoriteMeal[index].complexity,
              affordability: favoriteMeal[index].affordability);
        },
        itemCount: favoriteMeal.length,
      );
    }
  }
}
