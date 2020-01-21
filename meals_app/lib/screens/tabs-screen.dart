import 'package:flutter/material.dart';
import 'package:meals_app/screens/categories-screen.dart';
import 'package:meals_app/screens/favorites-screen.dart';

class TabsScreen extends StatefulWidget {
  List<String> favoritedMealsIds;
  final Function onToggleFavorite;
  final Function onChangeTitle;

  TabsScreen(this.favoritedMealsIds, this.onToggleFavorite, this.onChangeTitle);

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
      this.widget.onChangeTitle(this._getTitle());
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
    return Column(
      children: <Widget>[
        Expanded(
          child: TabBarView(
            controller: this._tabController,
            children: <Widget>[
              CategoriesScreen(
                  this.widget.favoritedMealsIds, this.widget.onToggleFavorite),
              FavoritesScreen(
                  this.widget.favoritedMealsIds, this.widget.onToggleFavorite)
            ],
          ),
        ),
        Container(
          color: Theme.of(context).primaryColor,
          child: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: 'Categories',
                icon: Icon(Icons.category),
              ),
              Tab(
                text: 'Favorites',
                icon: Icon(Icons.star),
              ),
            ],
          ),
        )
      ],
    );
  }
}
