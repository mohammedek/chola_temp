import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int _currentIndex = 0;
  final TextEditingController _dateController = TextEditingController();
  DateTime? pickedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: Container(
        color: Colors.white, // Background color for the bottom sheet
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.add_box, size: 29),
                    Text('Add Box'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, size: 29),
                    Text('Home'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.search, size: 29),
                    Text('Search'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.notifications, size: 29),
                    Text('Notifications'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.settings, size: 29),
                    Text('Settings'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle, size: 29),
                    Text('Account'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite, size: 29),
                    Text('Favorite'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.message, size: 29),
                    Text('Message'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.camera, size: 29),
                    Text('Camera'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.shopping_cart, size: 29),
                    Text('Cart'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.map, size: 29),
                    Text('Map'),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Handle button press
                },
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.help, size: 29),
                    Text('Help'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey.shade100,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 8,
            backgroundColor: Colors.blueGrey,
            child: Icon(
              Icons.person,
              size: 24,
              color: Colors.white,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.blueAccent,
          ),
          Gap(6),
          Icon(
            Icons.notifications,
            color: Colors.blueAccent,
          ),
          Gap(2),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.blue,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  children: [
                    /// header widget
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 60,
                      color: Colors.grey,
                      child: const Row(
                        children: [
                          Icon(Icons.chrome_reader_mode_rounded),
                          Gap(20),
                          Text(
                            "Agreement Info",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text("jbdjbjsbjdf"),
                            Text("jbdjbjsbjdf"),
                            Text("jbdjbjsbjdf"),
                            Text("jbdjbjsbjdf"),
                          ],
                        ),
                        Column(
                          children: [
                            Text("jbdjbjsbjdf"),
                            Text("jbdjbjsbjdf"),
                            Text("jbdjbjsbjdf"),
                            Text("jbdjbjsbjdf"),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Text(
                "*Payment Method",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.04,
                width: ResponsiveSize().width(context),
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(4),
                  borderColor: Colors.grey,
                  selectedBorderColor: Colors.blue.shade800,
                  fillColor: Colors.blue.shade900,
                  selectedColor: Colors.white,
                  color: Colors.black,
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white, fontSize: 14),
                  isSelected: List.generate(tabBarMobileView.length,
                      (index) => _currentIndex == index),
                  onPressed: (int newIndex) {
                    setState(() {
                      _currentIndex = newIndex;
                    });
                  },
                  children: [
                    for (int index = 0;
                        index < tabBarMobileView.length;
                        index++)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          tabBarMobileView[index].toUpperCase(),
                          // maxLines: 4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextWithTextField(
                                  text: "Account No", isReq: true),
                              buildTextWithTextField(
                                  text: "MICR No", isReq: true),
                              buildTextWithTextField(
                                  text: "Bank Name", isReq: false),
                              buildTextWithTextField(
                                  text: "Instrument No.", isReq: true),
                              buildTextWithTextField(
                                  text: "Instrument No.", isReq: true),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(
                                height: 68,
                              ),
                              buildTextWithTextField(
                                  text: "IFSC Code", isReq: true),
                              const Gap(6),
                              buildTextWithTextField(
                                  text: "Branch Name",
                                  isReq: false,
                                  isGrey: true),
                              const Gap(6),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "*",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 12,
                                            color: Colors.red.shade400),
                                  ),
                                  Text(
                                    "Instrument Date",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                            fontSize: 14,
                                            color: Colors.black87),
                                  ),
                                ],
                              ),
                              const Gap(4),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.44,
                                height: 40,
                                child: GestureDetector(
                                  onTap: () async {
                                    DateTime? picked = await showDatePicker(
                                      initialDate: pickedDate ?? DateTime.now(),
                                      context: context,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );
                                    if (picked != null &&
                                        picked != pickedDate) {
                                      setState(() {
                                        pickedDate = picked;
                                        _dateController.text =
                                            "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
                                      });
                                    }
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
                                        hintText: "Date",
                                        hintStyle: TextStyle(fontSize: 14),
                                        border: OutlineInputBorder(),
                                        suffixIcon: Icon(Icons.date_range),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Gap(18),
                              AppButton(text: "Fetch Details", onPress: () {})
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: buildTextWithTextField(
                            text: "Enter Remarks",
                            isReq: false,
                            isRemark: true)),
                  ]),
            ),
            tableView(context),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                    onPressed: () {},
                    child: const Text(
                      "Preview",
                      style: TextStyle(color: Colors.white),
                    )),
                const Gap(10),
              ],
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }

  SizedBox tableView(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.66,
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Card(
          elevation: 4,
          color: Colors.grey.shade200,
          surfaceTintColor: Colors.blue.shade50,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Column(
              children: [
                const Gap(6),
                Container(
                  padding: const EdgeInsets.all(8),
                  height: MediaQuery.sizeOf(context).height * 0.095,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balance to be allocated :",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16),
                      ),
                      Text(
                        "0",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.red.shade800),
                      ),
                      const Gap(2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.03,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue.shade800,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4))),
                                onPressed: () {},
                                child: const Text(
                                  "Reset",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          Text(
                            "Agreement No:",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const Text("HE028I2PNFJN20379729"),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  child: Table(
                    border: TableBorder.all(color: Colors.transparent),
                    children: [
                      // Table Header Row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.blue.shade800,
                        ),
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black),
                                left: BorderSide(color: Colors.black),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "Item",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black),
                                left:
                                    BorderSide(color: Colors.black, width: 0.2),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "Overdue",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  color: Colors.transparent,
                                ),
                                left: BorderSide(color: Colors.black12),
                              ),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "Actuals",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      // Table Data Rows
                      ...List<TableRow>.generate(
                        tableData.length - 1,
                        (rowIndex) => TableRow(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.transparent)),
                          children: List<Widget>.generate(
                            tableData[rowIndex + 1].length,
                            (colIndex) {
                              return Container(
                                height: 57,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: const BorderSide(
                                            color: Colors.black12),
                                        right: tableData[rowIndex + 1][0] ==
                                                'Add Other Changes'
                                            ? const BorderSide(
                                                color: Colors.transparent)
                                            : const BorderSide(
                                                color: Colors.black12))),
                                child: tableData[rowIndex + 1][colIndex]
                                        .isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                tableData[rowIndex + 1]
                                                    [colIndex],
                                                style: TextStyle(
                                                  fontWeight:
                                                      tableData[rowIndex + 1]
                                                                  [0] ==
                                                              'Total'
                                                          ? FontWeight.bold
                                                          : FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 30,
                                        child: tableData[rowIndex + 1][0] ==
                                                'Add Other Changes'
                                            ? null
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: TextFormField(
                                                  initialValue: '0',
                                                  onChanged: (value) {
                                                    setState(() {
                                                      tableData[rowIndex + 1]
                                                          [colIndex] = value;
                                                    });
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 10,
                                                            horizontal: 10),
                                                  ),
                                                ),
                                              ),
                                      ),
                              );
                            },
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
      ),
    );
  }

  buildTextWithTextField(
      {String text = "",
      bool isReq = false,
      bool isGrey = false,
      bool isRemark = false}) {
    return Column(
      crossAxisAlignment:
          isRemark ? CrossAxisAlignment.stretch : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isReq
                ? Text(
                    "*",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 12, color: Colors.red.shade400),
                  )
                : const SizedBox.shrink(),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
        const Gap(6),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.44,
          height: MediaQuery.sizeOf(context).height * 0.04,
          child: TextField(
            cursorColor: Colors.blue,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
                hintText: text,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey)),
                fillColor: isGrey ? Colors.grey : Colors.transparent,
                hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                      color: isGrey ? Colors.white : Colors.grey,
                    ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(color: Colors.grey))),
          ),
        ),
        const Gap(6),
      ],
    );
  }
}
