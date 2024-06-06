import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BankFormScreen extends StatefulWidget {

  BankFormScreen({super.key});

  @override
  State<BankFormScreen> createState() => _BankFormScreenState();
}

class _BankFormScreenState extends State<BankFormScreen> {
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
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.blue.shade800,
            height: 56,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.save_as_sharp),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("EOD DCR",style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  Text("Recipt",style: TextStyle(
                      color: Colors.white,
                      fontSize: 14
                  ),),
                ],
              )
            ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child:Column(
                  children: [

                  ],
                )
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
                        builder: (context) => Container(
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
                    return showCupertinoDialog(context: context, builder: (context) =>
                        SizedBox (
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: BankFormScreen()),
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
              const Text('Select an option',style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: RadioListTile(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  contentPadding: EdgeInsets.all(0),
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
              const SizedBox(height: 16),
              const Text("* Part Payment Amount"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '100000',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 16),
              const Text("Part Payment Charges in Percentage(Actual)"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '4',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Justification"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'OK',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
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
