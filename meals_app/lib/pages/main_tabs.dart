import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/favorites_page.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class MainTabs extends StatefulWidget {
  @override
  _MainTabsState createState() => _MainTabsState();
}

class _MainTabsState extends State<MainTabs>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  String title;

  @override
  void initState() {
    super.initState();
    title = 'Categories';
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.index == 0) {
      setState(() {
        title = 'Categories';
      });
    } else {
      setState(() {
        title = 'Favorites';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                CategoriesPage(),
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
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
    );
  }
}
