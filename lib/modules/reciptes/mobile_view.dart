import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/widgets/custom_button.dart';
import 'package:chola_first/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  int _currentIndex = 0;
  int _remitIndex = 0;
  final TextEditingController _dateController = TextEditingController();
  DateTime? pickedDate;
  final _formKey = GlobalKey<FormState>();
  final _intialValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      bottomNavigationBar: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          elevation: 5,
          type: BottomNavigationBarType.fixed,
          enableFeedback: true,
          fixedColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          backgroundColor: Colors.white70,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode_sharp),
              label: "OAgrements",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode_outlined),
              label: "OReports",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.receipt_long),
              label: "ORecipets",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_box),
              label: "OBatches",
            ),
          ]),
      appBar: AppBar(
        elevation: 4,
        shadowColor: Colors.grey.shade100,
        backgroundColor: Colors.white,
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  tileColor: Colors.grey[300],
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey),
                  ),
                  leading: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.blueAccent.shade700,
                      ),
                      child: const Icon(
                        Icons.save_as,
                        size: 35,
                        color: Colors.white,
                      )),
                  title: const Text(
                    "LAP_Overdue Receipt",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    "HE01U4IU35UU994896899",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              const Gap(2),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // color: Colors.pink,
                  // height: MediaQuery.of(context).size.height * 0.,
                  child: Column(
                    children: [
                      /// header widget
                      Container(
                        padding: const EdgeInsets.only(left: 18),
                        // height: MediaQuery.of(context).size.height * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          border: Border(
                              left: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              top: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              right: BorderSide(
                                color: Colors.grey.shade400,
                              ),
                              bottom: const BorderSide(
                                color: Colors.transparent,
                              )),
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.chrome_reader_mode_rounded),
                            Gap(20),
                            Text(
                              "Agreement Info",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height * 0.18,
                        decoration: const BoxDecoration(
                            border: Border(
                          bottom: BorderSide(color: Colors.grey),
                          left: BorderSide(color: Colors.grey),
                          right: BorderSide(color: Colors.grey),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Gap(8),
                                Text(
                                  "Agreement No",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(4),
                                const Text("HE01XBV0000000456",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                const Gap(8),
                                Text(
                                  "Account Name",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(4),
                                const Text("RAJESH SHARMA",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                const Gap(8),
                                Text(
                                  "Mobile Number",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(4),
                                const Text("9988835535",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                const Gap(6),
                              ],
                            ),
                            Column(
                              children: [
                                const Gap(8),
                                Text(
                                  "CIF ID",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(8),
                                const Text("8464277",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                const Gap(8),
                                Text(
                                  "EMI Amount",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[500],
                                      fontWeight: FontWeight.bold),
                                ),
                                const Gap(4),
                                const Text("99486",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                              ],
                            ),
                            const Gap(20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
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
                  isSelected: List.generate(
                      customerRemiter.length, (index) => _remitIndex == index),
                  onPressed: (int newIndex) {
                    setState(() {
                      _remitIndex = newIndex;
                    });
                  },
                  children: [
                    for (int index = 0; index < customerRemiter.length; index++)
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          customerRemiter[index].toUpperCase(),
                          // maxLines: 4,
                          textAlign: TextAlign.center,
                        ),
                      ),
                  ],
                ),
              ),
              _remitIndex == 1
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: CustomTextField(
                          text: "MCR", isReq: true, isRemark: true))
                  : const SizedBox(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextField(text: "Mobile No", isReq: true),
                    CustomTextField(text: "Amount Collected", isReq: true),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextField(
                                    text: "Account No", isReq: true),
                                CustomTextField(text: "MICR No", isReq: true),
                                CustomTextField(
                                    text: "Bank Name", isReq: false),
                                CustomTextField(
                                    text: "Instrument No.", isReq: true),
                                CustomTextField(
                                    text: "Instrument No.", isReq: true),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  height: 68,
                                ),
                                const CustomTextField(
                                    text: "IFSC Code", isReq: true),
                                const Gap(6),
                                const CustomTextField(
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.44,
                                  height: 40,
                                  child: GestureDetector(
                                    onTap: () async {
                                      DateTime? picked = await showDatePicker(
                                        initialDate:
                                            pickedDate ?? DateTime.now(),
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
                                      child: TextFormField(
                                        controller: _dateController,
                                        decoration: const InputDecoration(
                                          hintText: "Date",
                                          hintStyle: TextStyle(fontSize: 14),
                                          border: OutlineInputBorder(),
                                          suffixIcon: Icon(Icons.date_range),
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Date is required';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(18),
                                AppButton(
                                    text: "Fetch Details",
                                    onPress: () {
                                      if (_formKey.currentState?.validate() ?? false) {
                                        ScaffoldMessenger.of(context)
                                            .showMaterialBanner(
                                                const MaterialBanner(
                                                    content: Text("Not filled"),
                                                    actions: []));
                                      }
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: CustomTextField(
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
      ),
    );
  }

  SizedBox tableView(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
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
                  height: MediaQuery.sizeOf(context).height * 0.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Balance to be allocated :",
                        style: Theme.of(context).textTheme.titleMedium,
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
                            // height: MediaQuery.sizeOf(context).height * 0.03,
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
                          const Gap(4),
                          Text(
                            "Agreement No:",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "HE028I2PNFJN203797",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(overflow: TextOverflow.ellipsis),
                          ),
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
                                                  key: Key(
                                                      'textfield_${rowIndex}_$colIndex'),
                                                  maxLengthEnforcement:
                                                      MaxLengthEnforcement
                                                          .enforced,
                                                  maxLength: 30,
                                                  initialValue:
                                                      tableData[rowIndex + 1]
                                                              [colIndex] ??
                                                          '0',
                                                  onSaved: (value) {
                                                    setState(() {
                                                      tableData[rowIndex + 1]
                                                          [colIndex] = value!;
                                                    });
                                                  },
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                  decoration:
                                                      const InputDecoration(
                                                    counterText: "",
                                                    isDense: true,
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
}
