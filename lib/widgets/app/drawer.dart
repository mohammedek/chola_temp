import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/modules/vert_menu_list/app_layout.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
    required this.tabs,
  });

  final List<BottomTabData> tabs;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Stack(
              children: [
                const UserAccountsDrawerHeader(
                  accountName: Text("Username"),
                  accountEmail: Text("user@example.com"),
                  currentAccountPicture: CircleAvatar(
                    child: Text("U"),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.close,
                          color: whiteColor,
                        ))),
              ],
            ),
            for (BottomTabData tab
                in tabs.where((element) => element.title != "Menu"))
              ListTile(
                title: Text(tab.title),
                onTap: () {},
              ),
          ],
        ),
      ),
    );
  }
}
