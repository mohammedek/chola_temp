import 'package:flutter/material.dart';

class BankFormScreen extends StatelessWidget {
  final List<int> denominations = [500, 200, 100, 50, 20, 10, 5, 2, 1];

  BankFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text(
                  'Date: 2024-04-22',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  'Branch: CHENNAI ONE HE',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8,
                  );
                },
                itemCount: denominations.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          if (index == 0)
                            const Text(
                              'Denominations',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          Text(
                            '${denominations[index]} x',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          if (index == 0)
                            const Text(
                              'Notes',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          const SizedBox(
                            width: 150,
                            height: 44,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '0',
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 20),
                      Column(
                        children: [
                          if (index == 0)
                            const Text(
                              'Amount',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          const Row(
                            children: [
                              Text('=   '),
                              SizedBox(
                                width: 150,
                                height: 44,
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '0',
                                  ),
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  'Total Amount',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  '0',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Text(
                  'Excess',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  '1333',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
