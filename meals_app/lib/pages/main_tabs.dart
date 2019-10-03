import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/favorites_page.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class MainTabs extends StatefulWidget {
  final Function changeTitle;
  final Map<String, bool> settings;
  final List<Meal> favoriteMeals;

  MainTabs({this.changeTitle, this.settings, this.favoriteMeals});

  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
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
                favoriteMeals: widget.favoriteMeals,
              ),
              FavoritesPage(),
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
