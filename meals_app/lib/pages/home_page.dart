import 'package:flutter/material.dart';
import 'package:meals_app/pages/categories_page.dart';
import 'package:meals_app/pages/favorites_page.dart';
import 'package:meals_app/pages/main_tabs.dart';
import 'package:meals_app/pages/settings_page.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Widget currentScreen;
  String title;
  bool gluttenFree, lactoseFree, vegetarian, vegan;

  @override
  void initState() {
    super.initState();
    title = 'Categories';
    gluttenFree = lactoseFree = vegetarian = vegan = true;

    currentScreen = MainTabs(
      changeTitle: this.changePageTitle,
    );
  }

  void changePageTitle(String title) {
    setState(() {
      this.title = title;
    });
  }

  void onChangeSwitch(String variable, bool value) {
    switch (variable) {
      case 'glutten':
        setState(() {
          gluttenFree = value;
        });
        break;
      case 'lactose':
        setState(() {
          lactoseFree = value;
        });
        break;
      case 'vegetarian':
        setState(() {
          vegetarian = value;
        });
        break;
      case 'vegan':
        setState(() {
          vegan = value;
        });
        break;
      default:
    }
  }

  void changeDrawerPage(String route) {
    switch (route) {
      case 'tabs':
        currentScreen = MainTabs(
          changeTitle: this.changePageTitle,
        );
        changePageTitle('Categories');
        break;
      case 'settings':
        currentScreen = SettingsPage(
          gluttenFree: this.gluttenFree,
          lactoseFree: this.lactoseFree,
          vegan: this.vegan,
          vegetarian: this.vegetarian,
          onSwitchChange: this.onChangeSwitch,
        );
        changePageTitle('Settings');
        break;
      default:
        currentScreen = SettingsPage();
        changePageTitle('Categories');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: currentScreen,
      drawer: Drawer(
        child: MainDrawer(
          changeDrawerPage: this.changeDrawerPage,
        ),
      ),
    );
  }
}
