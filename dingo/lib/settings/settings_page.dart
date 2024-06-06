import 'package:dingo/settings/icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: ListView(
        padding: EdgeInsets.all(24),
        children: [
          SettingsGroup(
            title: 'GENERAL',
            children: <Widget>[
              buildLogout(),
              buildDeleteAccount(),
            ],
          )
        ],
      ),
    ),
  );

  Widget buildLogout() => SimpleSettingsTile(
    title: 'Logout',
    subtitle: '',
    leading: IconWidget(
      icon: Icons.logout,
      color: Colors.blue,
    ),
    onTap: () => Utils.showSnackBar(
      context, 'Clicked Logout'
    ),
  );

  Widget buildDeleteAccount() => SimpleSettingsTile(
    title: 'Delete Account',
    subtitle: '',
    leading: IconWidget(
      icon: Icons.delete,
      color: Colors.pink,
    ),
    onTap: () => Utils.showSnackBar(
      context, 'Clicked Delete Account'
    ),
  );
}
