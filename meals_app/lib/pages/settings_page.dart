import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
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
  _SettingsPageState createState() =>
      _SettingsPageState(localGluttenFree: gluttenFree);
}

class _SettingsPageState extends State<SettingsPage> {
  bool localGluttenFree, localLactoseFree, localVegetarian, localVegan;

  _SettingsPageState({
    this.localGluttenFree,
    this.localLactoseFree,
    this.localVegetarian,
    this.localVegan,
  });

  void onChangeSwitch(String variable, bool value) {
    switch (variable) {
      case 'glutten':
        setState(() {
          localGluttenFree = value;
        });
        break;
      case 'lactose':
        setState(() {
          localLactoseFree = value;
        });
        break;
      case 'vegetarian':
        setState(() {
          localVegetarian = value;
        });
        break;
      case 'vegan':
        setState(() {
          localVegan = value;
        });
        break;
      default:
    }
  }

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
            value: localGluttenFree,
            onChanged: (bool value) {
              onChangeSwitch('glutten', value);
              widget.onSwitchChange('glutten', value);
            },
          ),
        ],
      ),
    );
  }
}
