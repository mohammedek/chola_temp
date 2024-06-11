import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/modules/agreements/mobile/agreement_list.dart';
import 'package:chola_first/widgets/app/drawer.dart';
import 'package:flutter/material.dart';

class BottomTabData {
  final Widget icon;
  final String title;
  const BottomTabData({
    required this.icon,
    required this.title,
  });
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index) {
    if (index == 4) {
      _scaffoldKey.currentState?.openEndDrawer();
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  List<BottomTabData> tabs = [
    const BottomTabData(icon: Icon(Icons.book), title: 'OAgreement'),
    const BottomTabData(icon: Icon(Icons.receipt), title: 'OReceipts'),
    const BottomTabData(icon: Icon(Icons.backpack_outlined), title: 'OBatches'),
    const BottomTabData(
        icon: Icon(Icons.backpack_outlined), title: 'OChallans'),
    const BottomTabData(icon: Icon(Icons.menu), title: 'Menu'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: AppDrawer(tabs: tabs),
      body: _buildBody(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          for (BottomTabData tab in tabs)
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
          backgroundColor: Colors.green,
        );
    }
  }
}
