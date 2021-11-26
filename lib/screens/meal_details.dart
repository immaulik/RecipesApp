import 'package:flutter/material.dart';
import 'package:shop_app/dummy_data.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/meal-screen';
  final Function toggleFavorite;
  final Function _isMealFavorite;

  MealScreen(this.toggleFavorite, this._isMealFavorite);

  @override
  Widget build(BuildContext context) {
    Widget buildSectionTitle(String text) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        height: 150,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        width: 300,
        child: child,
      );
    }

    final mealId = ModalRoute.of(context)!.settings.arguments;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            // ignore: sized_box_for_whitespace
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                    child: Text(selectedMeal.ingredients[index]),
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    )),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildSectionTitle('Steps'),
            buildContainer(ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                      style: TextStyle(fontFamily: 'RobotoCondensed'),
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_isMealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
