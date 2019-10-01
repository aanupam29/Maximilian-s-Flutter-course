import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  final Map<String, bool> settings;

  final Function onSwitchChange;

  SettingsPage({
    this.settings,
    this.onSwitchChange,
  });

  @override
  _SettingsPageState createState() =>
      _SettingsPageState(localSettings: settings);
}

class _SettingsPageState extends State<SettingsPage> {
  Map<String, bool> localSettings;

  _SettingsPageState({
    this.localSettings,
  });

  void onChangeSwitch(String variable, bool value) {
    switch (variable) {
      case 'gluten':
        setState(() {
          localSettings['glutenFree'] = value;
        });
        break;
      case 'lactose':
        setState(() {
          localSettings['lactoseFree'] = value;
        });
        break;
      case 'vegetarian':
        setState(() {
          localSettings['vegetarian'] = value;
        });
        break;
      case 'vegan':
        setState(() {
          localSettings['vegan'] = value;
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
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 4),
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
              title: const Text('Gluten-free'),
              subtitle: const Text('Only include gluten-free meals'),
              value: localSettings['glutenFree'],
              onChanged: (bool value) {
                onChangeSwitch('gluten', value);
                widget.onSwitchChange('gluten', value);
              },
            ),
            SwitchListTile(
              title: const Text('Lactose-free'),
              subtitle: const Text('Only include lactose-free meals'),
              value: localSettings['lactoseFree'],
              onChanged: (bool value) {
                onChangeSwitch('lactose', value);
                widget.onSwitchChange('lactose', value);
              },
            ),
            SwitchListTile(
              title: const Text('Vegetarian'),
              subtitle: const Text('Only include vegetarian meals'),
              value: localSettings['vegetarian'],
              onChanged: (bool value) {
                onChangeSwitch('vegetarian', value);
                widget.onSwitchChange('vegetarian', value);
              },
            ),
            SwitchListTile(
              title: const Text('Vegan'),
              subtitle: const Text('Only include vegan meals'),
              value: localSettings['vegan'],
              onChanged: (bool value) {
                onChangeSwitch('vegan', value);
                widget.onSwitchChange('vegan', value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
