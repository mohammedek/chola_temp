import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BankFormScreen extends StatelessWidget {
  final List denominations = [
    500,
    200,
    100,
    50,
    20,
    10,
    5,
    2,
    1,
    'Total Amount',
    'Excess'
  ];

  BankFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (index == 0)
                                            const SizedBox(
                                              height: 50,
                                              child: Text(
                                                'Denominations',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          denominations[index] is String
                                              ? Text(
                                                  denominations[index],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
                                                )
                                              : Text(
                                                  denominations[index] is String
                                                      ? denominations[index]
                                                      : '${denominations[index]} x',
                                                  style: const TextStyle(
                                                      fontSize: 16),
                                                ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      flex: denominations[index] is int ? 1 : 2,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (index == 0)
                                            const SizedBox(
                                              height: 50,
                                              child: Text(
                                                'Notes',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          SizedBox(
                                            width:
                                                denominations[index] is String
                                                    ? 410
                                                    : 150,
                                            child: denominations[index] ==
                                                    "Excess"
                                                ? const Center(
                                                    child: Text('1122'))
                                                : const TextField(
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      hintText: '0',
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    if (denominations[index] is int)
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            if (index == 0)
                                              const SizedBox(
                                                height: 50,
                                                child: Align(
                                                  alignment: Alignment.topLeft,
                                                  child: Text(
                                                    'Amount',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            const Row(
                                              children: [
                                                Text('=   '),
                                                SizedBox(
                                                  width: 150,
                                                  child: TextField(
                                                    decoration: InputDecoration(
                                                      border:
                                                          OutlineInputBorder(),
                                                      hintText: '0',
                                                    ),
                                                    keyboardType:
                                                        TextInputType.number,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text branchText() {
    return const Text.rich(
      TextSpan(
          text: 'Branch: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: 'CHENNAI ONE HE',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            )
          ]),
    );
  }

  Text dateText() {
    return const Text.rich(
      TextSpan(
          text: 'Date: ',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: '2024-04-22',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            )
          ]),
    );
  }
}
