// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:shop_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;

  FilterScreen(this.currentFilters, this.saveFilters);

  final Map<String, dynamic> currentFilters;

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactorFree = false;
  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactorFree = widget.currentFilters['lactose'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
              onPressed: () {
                final selectedMaps = {
                  'gluten': _glutenFree,
                  'lactose': _lactorFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                print('gluten : ' + _glutenFree.toString());
                print('lactose : ' + _lactorFree.toString());
                print('vegan : ' + _vegan.toString());
                print('vegetarian : ' + _vegetarian.toString());
                widget.saveFilters(selectedMaps);
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              SwitchListTile(
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _glutenFree,
                subtitle: Text('Only Include GLuten-Free Meals.'),
                onChanged: (value) => setState(() {
                  _glutenFree = value;
                }),
              ),
              SwitchListTile(
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _vegetarian,
                subtitle: Text('Only Include Vegetarian Meals.'),
                onChanged: (value) => setState(() {
                  _vegetarian = value;
                }),
              ),
              SwitchListTile(
                title: Text(
                  'Lactose-Free',
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _lactorFree,
                subtitle: Text('Only Include Lactose-Free Meals.'),
                onChanged: (value) => setState(() {
                  _lactorFree = value;
                }),
              ),
              SwitchListTile(
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.headline6,
                ),
                value: _vegan,
                subtitle: Text('Only Include Vegan Meals.'),
                onChanged: (value) => setState(() {
                  _vegan = value;
                }),
              )
            ],
          )),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
