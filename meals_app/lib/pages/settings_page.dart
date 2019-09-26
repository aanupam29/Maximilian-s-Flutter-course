import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final bool gluttenFree, lactoseFree, vegetarian, vegan;
  final Function onSwitchChange;

  SettingsPage({
    this.gluttenFree,
    this.lactoseFree,
    this.vegetarian,
    this.vegan,
    this.onSwitchChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20),
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Text(
            'Adjust your settings',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          SwitchListTile(
            title: const Text('Lights'),
            value: gluttenFree,
            onChanged: (bool value) {
              onSwitchChange('glutten', value);
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
        ],
      ),
    );
  }
}
