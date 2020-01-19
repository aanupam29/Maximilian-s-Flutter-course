import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories-screen.dart';
import 'package:meals_app/screens/favorites-screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> with TickerProviderStateMixin {
  final List<String> screensTitles = ['Categories', 'Favorites'];
  int selectedScreenIndex = 0;

  TabController _tabController;

  void _handleTabChange() {
    setState(() {
      this.selectedScreenIndex = _tabController.index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);

    _tabController.addListener(_handleTabChange);
  }

  String _getTitle() {
    return this.screensTitles[selectedScreenIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this._getTitle()),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: TabBarView(
              controller: this._tabController,
              children: <Widget>[CategoriesScreen(), FavoritesScreen()],
            ),
          ),
          Container(
            color: Theme.of(context).primaryColor,
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
    );
  }
}
