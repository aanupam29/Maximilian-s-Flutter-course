import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final Function changeDrawerPage;

  MainDrawer({this.changeDrawerPage});

  Widget _renderListTiles(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Meals',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          onTap: () {
            changeDrawerPage('tabs');
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            size: 26,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            'Settings',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          onTap: () {
            changeDrawerPage('settings');
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 120,
          width: double.infinity,
          padding: EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          color: Theme.of(context).accentColor,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Theme.of(context).primaryColor),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        _renderListTiles(context)
      ],
    );
  }
}
