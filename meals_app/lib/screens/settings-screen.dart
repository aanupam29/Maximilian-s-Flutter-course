import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final Map<String, bool> settings;

  SettingsScreen(
    this.settings,
  );

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Map<String, bool> settings;

  @override
  void initState() {
    super.initState();
    this.settings = widget.settings;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            'Adjust your settings!',
            style: Theme.of(context).textTheme.title,
          ),
          SwitchListTile(
            title: const Text('Is Gluten Free'),
            value: this.settings['isGlutenFree'],
            onChanged: (bool value) {
              setState(() {
                this.settings['isGlutenFree'] = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Is Lactose Free'),
            value: this.settings['isLactoseFree'],
            onChanged: (bool value) {
              setState(() {
                this.settings['isLactoseFree'] = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Is Vegan'),
            value: this.settings['isVegan'],
            onChanged: (bool value) {
              setState(() {
                this.settings['isVegan'] = value;
              });
            },
          ),
          SwitchListTile(
            title: const Text('Is Vegetarian'),
            value: this.settings['isVegetarian'],
            onChanged: (bool value) {
              setState(() {
                this.settings['isVegetarian'] = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
