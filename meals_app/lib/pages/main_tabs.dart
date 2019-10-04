import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/favorites_page.dart';

class MainTabs extends StatefulWidget {
  final Function changeTitle;
  final Map<String, bool> settings;

  MainTabs({this.changeTitle, this.settings});

  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Meal> rootFavoriteMeals = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void addFavoriteMealToRoot(Meal meal) {
    setState(() {
      if (rootFavoriteMeals.contains(meal)) {
        rootFavoriteMeals.removeAt(rootFavoriteMeals.indexOf(meal));
      } else {
        rootFavoriteMeals.add(meal);
      }
      print(rootFavoriteMeals);
    });
  }

  void _handleTabChange() {
    if (_tabController.index == 0) {
      setState(() {
        widget.changeTitle('Categories');
      });
    } else {
      setState(() {
        widget.changeTitle('Favorites');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              CategoriesPage(
                settings: widget.settings,
                rootFavoriteMeals: rootFavoriteMeals,
                addFavoriteMealToRoot: addFavoriteMealToRoot,
              ),
              FavoritesPage(
                previouslyFavoritedMeals: rootFavoriteMeals,
              ),
            ],
          ),
        ),
        Container(
          color: Colors.indigoAccent,
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
              ),
              Tab(
                icon: Icon(Icons.star),
              ),
            ],
          ),
        )
      ],
    );
  }
}
