import 'package:flutter/material.dart';
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
  String title = 'Categories';
  List<String> favoriteMeals = [];
  Map<String, bool> settings = {
    "glutenFree": false,
    "lactoseFree": false,
    "vegetarian": false,
    "vegan": false
  };

  @override
  void initState() {
    super.initState();
    currentScreen = MainTabs(
      changeTitle: this.changePageTitle,
      settings: settings,
      favoriteMeals: favoriteMeals,
    );
  }

  void changePageTitle(String title) {
    setState(() {
      this.title = title;
    });
  }

  void onChangeSwitch(String variable, bool value) {
    switch (variable) {
      case 'gluten':
        setState(() {
          settings['glutenFree'] = value;
        });
        break;
      case 'lactose':
        setState(() {
          settings['lactoseFree'] = value;
        });
        break;
      case 'vegetarian':
        setState(() {
          settings['vegetarian'] = value;
        });
        break;
      case 'vegan':
        setState(() {
          settings['vegan'] = value;
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
          settings: this.settings,
          favoriteMeals: favoriteMeals,
        );
        changePageTitle('Categories');
        break;
      case 'settings':
        currentScreen = SettingsPage(
          settings: this.settings,
          onSwitchChange: this.onChangeSwitch,
        );
        changePageTitle('Settings');
        break;
      default:
        currentScreen = SettingsPage(
          settings: this.settings,
          onSwitchChange: this.onChangeSwitch,
        );
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
