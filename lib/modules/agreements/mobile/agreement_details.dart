import 'package:flutter/material.dart';

class OAgreementDetail extends StatelessWidget {
  const OAgreementDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton('OContact Recordings'),
                _buildActionButton('New Receipt'),
                _buildActionButton('Customer Pay'),
                _buildActionButton('More'),
              ],
            ),
            const SizedBox(height: 20),
            const ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 3),
              title: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: null, icon: Icon(Icons.book)),
                  Text(
                    'HE01100000058036',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onTap: null,
            ),
            _buildListTile('Basic Details'),
            _buildListTile('Financial Details'),
            _buildListTile('Non - Financial Details'),
            _buildListTile('Repayment schedule'),
            _buildListTile('Allocation History'),
            _buildListTile('Related Agreement'),
            _buildListTile('Related Quick Links'),
            const SizedBox(height: 20),
            const Text(
              'Delinquency string',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 200,
              child: _buildGraph(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(String text) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text),
    );
  }

  Widget _buildListTile(String title) {
    return ListTile(
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    );
  }

  Widget _buildGraph() {
    return Container(
      color: Colors.grey[200],
      child: const Center(
        child: Text('Graph Placeholder'),
      ),
    );
  }
}
