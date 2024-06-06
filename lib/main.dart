import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chola Collections',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        useMaterial3: true,
      ),
      home: const CholaInitial(),
    );
  }
}

class CholaInitial extends StatefulWidget {
  const CholaInitial({super.key});

  @override
  State<CholaInitial> createState() => _CholaInitialState();
}

class _CholaInitialState extends State<CholaInitial>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

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

  List<String> tabBarView = [
    "Cheque",
    "Draft",
    "RTGS",
    "POS Machine",
    "Payment Gateway"
  ];

  List<List<String>> tableData = [
    ["EMI", "1470104", ""],
    ["AFC", "23879", ""],
    ["CBC", "0", ""],
    ["FVC", "0", ""],
    ["Advance EMI", "0", ""],
    ["DRT/Legal/Others", "0", ""],
    ["Add Other Changes", "", ""],
    ["Total", "0", "0"],
  ];

  DateTimeRange? pickedDate;

  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabBarView.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Sandbox: preprod02 | Log out",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    const Icon(Icons.cloud, color: Colors.blue, size: 36),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search..",
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(width: 3),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.08),
                    Container(
                      height: 35,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            topLeft: Radius.circular(8),
                          ),
                          border: Border.all(color: Colors.black45)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.star,
                                size: 20,
                                color: Colors.grey,
                              )),
                          const VerticalDivider(color: Colors.black45),
                          DropdownButton(
                            items: const [],
                            onChanged: (value) {},
                            underline: const SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_box,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.cloud_circle_outlined,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.question_mark_rounded,
                          size: 30,
                        )),
                    IconButton(
                        onPressed: () {}, icon: const Icon(Icons.more_vert)),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
                child: buildHomeListView(),
              ),
              Container(
                height: 4,
                color: Colors.grey,
              ),
              SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 1.1,
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,

                        /// This is the left widget
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 20.0, top: 0),
                              child: Text(
                                "Payment method",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            CupertinoSegmentedControl<int>(
                              children: {
                                for (int index = 0;
                                    index < tabBarView.length;
                                    index++)
                                  index: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6, horizontal: 10),
                                    child: Text(
                                      tabBarView[index].toUpperCase(),
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                              },
                              groupValue: _currentIndex,
                              onValueChanged: (int newIndex) {
                                setState(() {
                                  _currentIndex = newIndex;
                                });
                              },
                              borderColor: Colors.pink.shade800,
                              selectedColor: Colors.pink.shade800,
                              unselectedColor: Colors.white,
                              pressedColor: Colors.pink.withOpacity(0.2),
                            ),
                            Expanded(
                              child: IndexedStack(
                                  index: _currentIndex,
                                  children: tabBarView
                                      .map((e) => buildBankingModel(e))
                                      .toList()),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black)),
                              child: Table(
                                border:
                                    TableBorder.all(color: Colors.transparent),
                                children: List<TableRow>.generate(
                                  tableData.length,
                                  (rowIndex) => TableRow(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.transparent)),
                                    children: List<Widget>.generate(
                                      tableData[rowIndex].length,
                                      (colIndex) {
                                        return Container(
                                          height: 45,
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: const BorderSide(
                                                      color: Colors.black),
                                                  right: tableData[rowIndex]
                                                              [0] ==
                                                          'Add Other Changes'
                                                      ? const BorderSide(
                                                          color: Colors
                                                              .transparent)
                                                      : const BorderSide(
                                                          color:
                                                              Colors.black))),
                                          child: tableData[rowIndex][colIndex]
                                                  .isNotEmpty
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: SizedBox(
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          tableData[rowIndex]
                                                              [colIndex],
                                                          style: TextStyle(
                                                              fontWeight: tableData[
                                                                              rowIndex]
                                                                          [0] ==
                                                                      'Total'
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 30,
                                                  child: tableData[rowIndex]
                                                              [0] ==
                                                          'Add Other Changes'
                                                      ? null
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: TextFormField(
                                                            initialValue:
                                                                0.toString(),
                                                            onChanged: (value) {
                                                              setState(() {
                                                                tableData[rowIndex]
                                                                        [
                                                                        colIndex] =
                                                                    value;
                                                              });
                                                            },
                                                            decoration:
                                                                const InputDecoration(
                                                              border:
                                                                  OutlineInputBorder(),
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      vertical:
                                                                          10,
                                                                      horizontal:
                                                                          10),
                                                            ),
                                                          ),
                                                        ),
                                                ),
                                        );
                                      },
                                    ),
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
      ),
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
                                  return showDialog(
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
              const Text('Select an option'),
              const SizedBox(
                height: 10,
              ),
              RadioListTile(
                title: const Text('Part_Payment_Tenure Reduction'),
                value: 1,
                groupValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
              ),
              RadioListTile(
                title: const Text('Part_Payment_EMI Reduction'),
                value: 2,
                groupValue: selectedValue,
                onChanged: (int? value) {
                  setState(() {
                    selectedValue = value!;
                  });
                },
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

  Widget buildBankingModel(String method) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Text("* Account No"),
                    TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Account No',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("* MICR No"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'MICR No',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("* Bank Name"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Bank Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text("* Id"),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'ID',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 102), // Adjust the height as needed
                    const Text("* IFSC Code"),
                    const SizedBox(height: 6),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: ' IFSC Code',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("*Branch Name"),
                    const SizedBox(height: 6),
                    const TextField(
                      decoration: InputDecoration(
                        hintText: 'Branch Name',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text("* Instrument Date "),
                    GestureDetector(
                      onTap: () async {
                        DateTimeRange? picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        setState(() {
                          picked = pickedDate;
                        });
                      },
                      child: AbsorbPointer(
                        child: TextField(
                          controller: _dateController,
                          onChanged: (value) {
                            setState(() {
                              value = pickedDate.toString();
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: "Date time",
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.date_range),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // Handle fetch details action here
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                      child: const Text(
                        "Fetch Details",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.7,
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4))),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          )),
                      onPressed: () {},
                      child: const Text(
                        "Preview",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
