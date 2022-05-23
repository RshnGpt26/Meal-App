// Packages
import 'package:flutter/material.dart';

// Screens
import './categories_screen.dart';
import './favorites_screen.dart';

// Models
import '../models/meal.dart';

// Widget
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
    _pages = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': favoritesScreen(widget.favoriteMeals), 'title': 'Favourites'},
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // For Tabs on top
    // return DefaultTabController(
    //   length: 2,
    //   // initialIndex: 0, 0 is default value, We can use 1 in 2 tabs case
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('Meals'),
    //       bottom: TabBar(
    //         tabs: <Widget>[
    //           Tab(icon: Icon(Icons.category), text: 'Category',),
    //           Tab(icon: Icon(Icons.star), text: 'Favorites',),
    //         ],
    //       ),
    //     ),
    //     drawer: MainDrawer(),
    //     body: TabBarView(children: <Widget>[
    //       CategoriesScreen(),
    //       favoritesScreen(),
    //     ],),
    //   ),
    // );

    // For Tabs on bottom
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, // flutter will automatically provide the index to _selectPage
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context)
                .primaryColor, // Write this line only if writes this line before in BottomNavigationBar => type: BottomNavigationBarType.shifting,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context)
                .primaryColor, // Write this line only if writes this line before in BottomNavigationBar => type: BottomNavigationBarType.shifting,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
