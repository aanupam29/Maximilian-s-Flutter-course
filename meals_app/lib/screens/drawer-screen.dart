import 'package:flutter/material.dart';
import 'package:meals_app/screens/settings-screen.dart';
import 'package:meals_app/screens/tabs-screen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  List<String> favoritedMealsIds = [];
  String title = 'Categories';
  Widget selectedScreen;

  void onToggleFavorite(String id) {
    setState(() {
      if (this.favoritedMealsIds.contains(id)) {
        this.favoritedMealsIds.remove(id);
      } else {
        this.favoritedMealsIds.add(id);
      }
    });
  }

  initState() {
    super.initState();
    this.selectedScreen =
        TabsScreen(this.favoritedMealsIds, this.onToggleFavorite);
  }

  void onChangeSelectedScreen(Widget widget) {
    setState(() {
      this.selectedScreen = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: this.selectedScreen,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Navigate through the app!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Theme.of(context).primaryColor,
              ),
              selected: true,
              onTap: () {
                this.onChangeSelectedScreen(
                    TabsScreen(this.favoritedMealsIds, this.onToggleFavorite));
                Navigator.of(context).pop();
              },
              title: Text('Home'),
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColor,
              ),
              selected: true,
              onTap: () {
                this.onChangeSelectedScreen(SettingsScreen());
                Navigator.of(context).pop();
              },
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
