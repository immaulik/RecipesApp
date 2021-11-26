import 'package:flutter/material.dart';
import 'package:shop_app/Models/meal.dart';
import 'package:shop_app/widgets/meal_items.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  List<Meal> availableMeal;

  CategoryMealScreen(this.availableMeal);

  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late String categoryTitle;
  late List<Meal> _displayMeal;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  void removeMeal(String mealId) {
    setState(() {
      _displayMeal.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArg =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      categoryTitle = routeArg['title'].toString();
      final categoryId = routeArg['id'];
      _displayMeal = widget.availableMeal.where((element) {
        return element.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(categoryTitle.toString()),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return MealItem(
                id: _displayMeal[index].id,
                title: _displayMeal[index].title,
                imageUrl: _displayMeal[index].imageUrl,
                duration: _displayMeal[index].duration,
                complexity: _displayMeal[index].complexity,
                affordability: _displayMeal[index].affordability);
          },
          itemCount: _displayMeal.length,
        ));
  }
}
