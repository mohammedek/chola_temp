import 'package:chola_first/constants/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BankFormScreen extends StatefulWidget {
  const BankFormScreen({super.key});

  @override
  State<BankFormScreen> createState() => _BankFormScreenState();
}

class _BankFormScreenState extends State<BankFormScreen> {
  final fiveHundController = TextEditingController();
  final twoHundController = TextEditingController();
  final oneHundController = TextEditingController();
  final fiftyController = TextEditingController();
  final twentyController = TextEditingController();
  final tenController = TextEditingController();
  final fiveController = TextEditingController();
  final twoController = TextEditingController();
  final oneController = TextEditingController();
  final fiveHundAmtController = TextEditingController();
  final twoHundAmtController = TextEditingController();
  final oneHundAmtController = TextEditingController();
  final fiftyAmtController = TextEditingController();
  final twentyAmtController = TextEditingController();
  final tenAmtController = TextEditingController();
  final fiveAmtController = TextEditingController();
  final twoAmtController = TextEditingController();
  final oneAmtController = TextEditingController();
  final totalAmtController = TextEditingController(text: '0');
  final _remarksController = TextEditingController();
  List denominations = [];

  List<String> menuList = [
    'Collections Home',
    'OAgrements',
    'ORMR Report',
    'OReceipts',
    'OBatches',
    'OChallans',
    'OEOD DCR',
    'OApprovels',
    'OAllocations',
    'More'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    denominations = [
      {
        "cur": 500,
        "notes": fiveHundController,
        "amount": fiveHundAmtController,
      },
      {
        "cur": 200,
        "notes": twoHundController,
        "amount": twoHundAmtController,
      },
      {
        "cur": 100,
        "notes": oneHundController,
        "amount": oneHundAmtController,
      },
      {
        "cur": 50,
        "notes": fiftyController,
        "amount": fiftyAmtController,
      },
      {
        "cur": 20,
        "notes": twentyController,
        "amount": twentyAmtController,
      },
      {
        "cur": 10,
        "notes": tenController,
        "amount": tenAmtController,
      },
      {
        "cur": 5,
        "notes": fiveController,
        "amount": fiveAmtController,
      },
      {
        "cur": 2,
        "notes": twoController,
        "amount": twoAmtController,
      },
      {
        "cur": 1,
        "notes": oneController,
        "amount": oneAmtController,
      },
      'Total Amount',
      'Excess'
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              dense: true,
              tileColor: ksecondaryColor,
              leading: Card(
                color: Theme.of(context).primaryColor,
                child: const IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.all(3),
                  onPressed: null,
                  icon: Icon(
                    Icons.note_alt_outlined,
                    color: whiteColor,
                  ),
                ),
              ),
              title: const Text(
                "EOD DCR",
                style: TextStyle(fontSize: 16, color: whiteColor),
              ),
              subtitle: const Text(
                "Receipt",
                style: TextStyle(color: whiteColor),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: topLeftMenus(),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text(
                                  "Total Cash (As per system): 3000",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: ksecondaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const Text.rich(TextSpan(
                                    text: "* ",
                                    style: TextStyle(color: Colors.red),
                                    children: [
                                      TextSpan(
                                        text: "Enter Remarks",
                                        style: TextStyle(color: Colors.black87),
                                      )
                                    ])),
                                const SizedBox(
                                  height: 3,
                                ),
                                TextFormField(
                                  controller: _remarksController,
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  decoration: const InputDecoration()
                                      .copyWith(isDense: false),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed:
                                            _remarksController.text.isEmpty
                                                ? null
                                                : () {},
                                        child: const Text("Save")),
                                    const SizedBox()
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.only(right: 30),
                              height: 30,
                              child: Row(
                                children: [
                                  dateText(),
                                  const Spacer(),
                                  branchText(),
                                  const Spacer(
                                    flex: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height / 1.65,
                            child: Card(
                              elevation: 10,
                              color: kprimaryColor.withOpacity(0.05),
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10),
                                          Expanded(
                                            child: ListView.separated(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              separatorBuilder:
                                                  (context, index) {
                                                return const SizedBox(
                                                  height: 8,
                                                );
                                              },
                                              itemCount: denominations.length,
                                              itemBuilder: (context, index) {
                                                return Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          if (index == 0)
                                                            const SizedBox(
                                                              height: 35,
                                                              child: Text(
                                                                'Denominations',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14,
                                                                    color:
                                                                        ksecondaryColor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                            ),
                                                          denominations[index]
                                                                  is String
                                                              ? Text(
                                                                  denominations[
                                                                      index],
                                                                  style: const TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                )
                                                              : Text(
                                                                  '${denominations[index]['cur']}   X',
                                                                  style: const TextStyle(
                                                                      fontSize:
                                                                          14),
                                                                ),
                                                        ],
                                                      ),
                                                    ),
                                                    if (denominations[index]
                                                        is Map)
                                                      const SizedBox(width: 20),
                                                    Expanded(
                                                      flex: denominations[index]
                                                              is Map
                                                          ? 1
                                                          : 2,
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                                denominations[
                                                                            index]
                                                                        is Map
                                                                    ? 0
                                                                    : 6),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (index == 0)
                                                              const SizedBox(
                                                                height: 35,
                                                                child: Text(
                                                                  'Notes',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color:
                                                                          ksecondaryColor,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            SizedBox(
                                                              width: denominations[
                                                                          index]
                                                                      is String
                                                                  ? double
                                                                      .infinity
                                                                  : 150,
                                                              child: denominations[
                                                                          index]
                                                                      is String
                                                                  ? denominations[
                                                                              index] ==
                                                                          "Excess"
                                                                      ? const Center(
                                                                          child:
                                                                              Text('1122'))
                                                                      : TextFormField(
                                                                          enabled:
                                                                              false,
                                                                          style: const TextStyle(
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.bold),
                                                                          controller:
                                                                              totalAmtController,
                                                                        )
                                                                  : TextFormField(
                                                                      controller:
                                                                          denominations[index]
                                                                              [
                                                                              'notes'],
                                                                      onChanged:
                                                                          (value) =>
                                                                              setState(() {
                                                                        if (value
                                                                            .isEmpty) {
                                                                          denominations[index]['amount']
                                                                              .clear();
                                                                          var denomination = denominations
                                                                              .whereType<Map>()
                                                                              .toList();
                                                                          int total =
                                                                              0;
                                                                          for (Map den
                                                                              in denomination) {
                                                                            total =
                                                                                total + int.parse(den['amount'].text.isEmpty ? "0" : den['amount'].text);
                                                                          }

                                                                          totalAmtController.text =
                                                                              total.toString();
                                                                        } else if (denominations[index]
                                                                            is Map) {
                                                                          denominations[index]['amount'].text =
                                                                              (denominations[index]['cur'] * int.parse(denominations[index]['notes'].text)).toString();
                                                                          var denomination = denominations
                                                                              .whereType<Map>()
                                                                              .toList();
                                                                          int total =
                                                                              0;
                                                                          for (Map den
                                                                              in denomination) {
                                                                            total =
                                                                                total + int.parse(den['amount'].text.isEmpty ? "0" : den['amount'].text);
                                                                          }

                                                                          totalAmtController.text =
                                                                              total.toString();
                                                                        }
                                                                      }),
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              14),
                                                                      decoration:
                                                                          const InputDecoration(
                                                                        // border:
                                                                        //     OutlineInputBorder(),
                                                                        hintText:
                                                                            '0',
                                                                      ),
                                                                      keyboardType:
                                                                          TextInputType
                                                                              .number,
                                                                      inputFormatters: <TextInputFormatter>[
                                                                        FilteringTextInputFormatter
                                                                            .digitsOnly
                                                                      ],
                                                                    ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            denominations[index]
                                                                    is Map
                                                                ? 20
                                                                : 4),
                                                    if (denominations[index]
                                                        is Map)
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            if (index == 0)
                                                              const SizedBox(
                                                                height: 35,
                                                                child: Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topLeft,
                                                                  child: Text(
                                                                    'Amount',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        color:
                                                                            ksecondaryColor,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                    '=   '),
                                                                SizedBox(
                                                                  width: 150,
                                                                  child:
                                                                      TextFormField(
                                                                    enabled:
                                                                        false,
                                                                    controller:
                                                                        denominations[index]
                                                                            [
                                                                            'amount'],
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          14,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                    decoration:
                                                                        const InputDecoration(
                                                                      // border:
                                                                      //     OutlineInputBorder(),
                                                                      hintText:
                                                                          '0',
                                                                    ),
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .number,
                                                                    inputFormatters: <TextInputFormatter>[
                                                                      FilteringTextInputFormatter
                                                                          .digitsOnly
                                                                    ],
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
                                          const SizedBox(height: 10),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  topLeftMenus() {
    return const Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Opening Balance",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ksecondaryColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("12222"),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Inflow",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ksecondaryColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("1"),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Outflow",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: ksecondaryColor,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text("123"),
          ],
        ),
        Spacer(
          flex: 1,
        ),
      ],
    );
  }

  Text branchText() {
    return const Text.rich(
      TextSpan(
          text: 'Branch: ',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: 'CHENNAI ONE HE',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            )
          ]),
    );
  }

  Widget buildHomeListView() {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: menuList
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      menuList.indexOf(e) == 0
                          ? const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.0),
                              child: Icon(Icons.menu_rounded),
                            )
                          : const SizedBox.shrink(),
                      Text(
                        e.toString(),
                        style: TextStyle(
                          fontSize: menuList.indexOf(e) == 0 ? 20 : 14,
                          color: Colors.black54,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      menuList.indexOf(e) == 0
                          ? const SizedBox()
                          : InkWell(
                              child: menuList.indexOf(e) == 9
                                  ? const Icon(Icons.arrow_drop_down, size: 28)
                                  : const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      size: 28),
                              onTap: () async {
                                if (menuList.indexOf(e) == 7) {
                                  return showCupertinoDialog(
                                      context: context,
                                      builder: (context) => SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.70,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: AlertDialog(
                                              backgroundColor: Colors.white,
                                              content: challanPopup(),
                                              scrollable: true,
                                              actions: [
                                                Container(
                                                  height: 2,
                                                  color: Colors.black45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: ElevatedButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor: Colors
                                                            .pink.shade800,
                                                      ),
                                                      onPressed: () {},
                                                      child: const Text(
                                                        'Submit',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ));
                                } else if (menuList.indexOf(e) == 6) {
                                  return showCupertinoDialog(
                                    context: context,
                                    builder: (context) => SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: const BankFormScreen()),
                                  );
                                }
                              },
                            ),
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }

  Widget challanPopup() {
    int selectedValue = 1;
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select an option',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: RadioListTile(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  contentPadding: const EdgeInsets.all(0),
                  dense: false,
                  title: const Text('Part_Payment_Tenure Reduction'),
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: false,
                  title: const Text('Part_Payment_EMI Reduction'),
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 14),
              const Text("* Part Payment Amount"),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '100000',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              const Text("* Part Payment Charges in Percentage(Applicable)"),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '5',
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: '5',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              const Text("Part Payment Charges in Percentage(Actual)"),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: '4',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              const Text("Justification"),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'OK',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              const Text("Upload Consent Letter Image"),
              DottedBorder(
                borderType: BorderType.Rect,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.upload,
                          color: Colors.pink.shade800,
                        ),
                        label: Text(
                          'Upload Files',
                          style: TextStyle(
                            color: Colors.pink.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Or'),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'drop Files',
                            style: TextStyle(
                              color: Colors.pink.shade800,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('Screenshot (6).png'),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade800,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Customer Consent Letter',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Text dateText() {
    return const Text.rich(
      TextSpan(
          text: 'Date: ',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: '2024-04-22',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            )
          ]),
    );
  }
}
