// Packages
import 'package:flutter/material.dart';

// Widgets
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> currentFilters;

  final Function saveFilters;
  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      var currentValue, Function updateValue) {
    return SwitchListTile(
      value: currentValue,
      onChanged: updateValue,
      title: Text(title),
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  (newValue) => {
                    setState(() {
                      _glutenFree = newValue;
                    })
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include Lactose-free meals',
                  _lactoseFree,
                  (newValue) => {
                    setState(() {
                      _lactoseFree = newValue;
                    })
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals',
                  _vegetarian,
                  (newValue) => {
                    setState(() {
                      _vegetarian = newValue;
                    })
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include Vegan meals',
                  _vegan,
                  (newValue) => {
                    setState(() {
                      _vegan = newValue;
                    })
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
