import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OAgreementsScreen(),
//     );
//   }
// }

class OAgreementsScreen extends StatelessWidget {
  final List<String> recentOAgreements = [
    'HE01JGI00000054481',
    'ML01MSH00000020451',
    'HL25MDA000085661',
    'HL25SVG000076617',
    'HL05TUL000027124'
  ];

  OAgreementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OAgreements'),
        actions: [
          TextButton(
            onPressed: () {
              // Add your new agreement action here
            },
            child: const Text(
              'New',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search OAgreements',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Lists'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('All'),
                  onTap: () {
                    // Add your navigation to All lists here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.list),
                  title: const Text('LAP'),
                  onTap: () {
                    // Add your navigation to LAP lists here
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          const ListTile(
            title: Text('Recent OAgreements'),
          ),
          ...recentOAgreements.map((agreement) => ListTile(
                title: Text(agreement),
                onTap: () {
                  // Add your action on tapping each agreement here
                },
              )),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_books),
            label: 'OAgreements',
            backgroundColor: Colors.pink.shade800,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.receipt),
            label: 'OReceipts',
            backgroundColor: Colors.pink.shade800,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.archive),
            label: 'OBatches',
            backgroundColor: Colors.pink.shade800,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.description),
            label: 'OChallans',
            backgroundColor: Colors.pink.shade800,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu),
            label: 'Menu',
            backgroundColor: Colors.pink.shade800,
          ),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Handle bottom navigation bar item taps
        },
      ),
    );
  }
}
