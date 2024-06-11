import 'package:chola_first/constants/colors.dart';
import 'package:chola_first/view/agreements/mobile/agreement_list.dart';
import 'package:flutter/material.dart';

class TabData {
  final Widget icon;
  final String title;
  const TabData({
    required this.icon,
    required this.title,
  });
}

class NonPersistentBottomNav extends StatefulWidget {
  const NonPersistentBottomNav({super.key});

  @override
  State<NonPersistentBottomNav> createState() => _NonPersistentBottomNavState();
}

class _NonPersistentBottomNavState extends State<NonPersistentBottomNav> {
  int _currentIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  List tabs = [
    const TabData(icon: Icon(Icons.book), title: 'OAgreement'),
    const TabData(icon: Icon(Icons.report), title: 'ORMR Report'),
    const TabData(icon: Icon(Icons.receipt), title: 'OReceipts'),
    const TabData(icon: Icon(Icons.backpack_outlined), title: 'OBatches'),
    const TabData(icon: Icon(Icons.menu), title: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text("Username"),
              accountEmail: Text("user@example.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("U"),
              ),
            ),
            ListTile(
              title: const Text("OAgreements"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("ORMR Report"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("OReceipts"),
              onTap: () {},
            ),
            ListTile(
              title: const Text("OBatches"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _buildBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          for (TabData tab in tabs)
            BottomNavigationBarItem(
              icon: tab.icon,
              label: tab.title,
            ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: kprimaryColor,
        unselectedItemColor: kprimaryColor.withOpacity(0.4),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        return OAgreementsPage();
      case 1:
        return const Scaffold(
          backgroundColor: Colors.red,
        );
      case 2:
        return const Scaffold(
          backgroundColor: Colors.blue,
        );
      default:
        return const Scaffold(
          backgroundColor: Colors.orange,
        );
    }
  }
}
