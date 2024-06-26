import 'dart:io';

import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/modules/agreements/web/agreement_list.dart';
import 'package:chola_first/modules/batch/batch_list_screen.dart';
import 'package:chola_first/modules/challan/challan_list_screen.dart';
import 'package:chola_first/modules/reciptes/controllers.dart';
import 'package:chola_first/widgets/custom_text_feild.dart';
import 'package:chola_first/widgets/main_menu_header.dart';
import 'package:chola_first/widgets/web/banking_widget.dart';
import 'package:chola_first/widgets/web/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../widgets/web/cash_widget.dart';
import '../../widgets/web/draft_widget.dart';
import '../../widgets/web/payment_gateway_widget.dart';
import '../../widgets/web/pos_machine.dart';
import '../../widgets/web/r_t_g_s_widget.dart';
import '../eod/bank_form_screen.dart';

class WebView extends StatefulWidget {
  final int index;
  const WebView({super.key, this.index = 1});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  int _typeCurrentIndex = 0;
  int _selectedVertMenu = 0;
  bool isEOD = false;
  double _bal = 0.0;
  double _bal1 = 0.0;
  double _bal2 = 0.0;
  double _bal3 = 0.0;
  double _bal4 = 0.0;
  double _bal5 = 0.0;
  double _bal6 = 0.0;

  FormControllers formController = FormControllers();

  set selectedVetMenu(int value) => _selectedVertMenu = value;

  int get selectedVertMenu => _selectedVertMenu;

  List<Widget> tabWidgets = [
    const ChequeWidget(""),
    const CashWidget(),
    const DraftWidget(),
    const RTGSWidget(),
    const PosMachineWidget(),
    const PaymentGatewayWidget(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: menuList.length, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });
    _selectedVertMenu = widget.index;
  }

  late TabController tabController;
  Widget _buildSelectedWidget() {
    switch (_selectedVertMenu) {
      case 0:
      case 1:
        return const OAgreementsPageWeb();
      case 2:
      case 7:
        return dashboard(context);
      case 3:
        return const BatchListScreen();
      case 4:
        return const ChallanListScreen();
      case 5:
        return const BankFormScreen();
      default:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainMenuAppBar(
        height: ResponsiveSize().isWide(context) ? 110 : 150,
        title: TextField(
          decoration: InputDecoration(
            hintText: "Search..",
            hintStyle: TextStyle(color: Colors.grey.shade800),
            focusColor: Colors.grey.shade800,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey.shade800,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(04),
              borderSide: BorderSide(width: 3, color: Colors.grey.shade800),
            ),
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade800)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      color: Colors.grey.shade800,
                      size: 20,
                    )),
                Container(
                  color: Colors.grey,
                  width: 2,
                  height: MediaQuery.of(context).size.shortestSide * 0.03,
                  // thickness: 2,
                ),
                DropdownButton(
                  items: const [],
                  onChanged: (value) {},
                  underline: const SizedBox(),
                  icon: Icon(
                      color: Colors.grey.shade800, (Icons.arrow_drop_down)),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: () {},
              color: Colors.grey.shade800,
              icon: const Icon(
                Icons.add_box,
                // size: 30,
              )),
          IconButton(
              onPressed: () {},
              color: Colors.grey.shade800,
              icon: const Icon(
                Icons.cloud_circle_outlined,
                // size: 30,
              )),
          IconButton(
              onPressed: () {},
              color: Colors.grey.shade800,
              icon: const Icon(
                Icons.question_mark_rounded,
                // size: 30,
              )),
          IconButton(
              onPressed: () {},
              color: Colors.grey.shade800,
              icon: const Icon(
                Icons.settings_applications,
                // size: 30,
              )),
          IconButton(
              onPressed: () {},
              color: Colors.grey.shade800,
              icon: const Icon(
                Icons.notifications,
              )),
          IconButton(
              onPressed: () {},
              color: Colors.grey.shade800,
              icon: const Icon(
                CupertinoIcons.person_alt_circle,
              )),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.menu_rounded,
                        color: Colors.pink.shade800,
                      ),
                      onPressed: () {},
                    ),
                    Text(
                      'Collections Home',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBar(
                  controller: tabController,
                  labelPadding: EdgeInsets.symmetric(horizontal: 3),
                  labelStyle: TextStyle(color: blackColor),
                  isScrollable: true,
                  overlayColor: MaterialStateColor.resolveWith(
                      (states) => Colors.green.withOpacity(0.1)),

                  indicator: BoxDecoration(
                      border: Border(
                    top: BorderSide(
                      color: kprimaryColor, // Replace with your desired color
                      width: 1.0, // Replace with your desired width
                      style: BorderStyle.solid, // Optionally, specify the style
                    ),
                  )),

                  // indicatorColor: Colors.transparent,
                  onTap: (value) {
                    setState(() {
                      _selectedVertMenu = value;
                    });
                    if (value == 6) {
                      showCupertinoDialog(
                          context: context,
                          builder: (context) => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.70,
                                width: MediaQuery.of(context).size.width,
                                child: AlertDialog(
                                  backgroundColor: Colors.white,
                                  content: const ChalanPopup(),
                                  scrollable: true,
                                  actions: [
                                    Container(
                                      height: 2,
                                      color: Colors.black45,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.pink.shade800,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Submit',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )),
                                    )
                                  ],
                                ),
                              ));
                    } else if (value == 5) {
                      setState(() {
                        isEOD = true;
                      });
                    } else {
                      setState(() {
                        isEOD = false;
                      });
                    }
                  },
                  tabs: menuList
                      .map<Widget>((e) => Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 0),
                              child: Row(
                                children: [
                                  Tab(
                                    iconMargin: EdgeInsets.zero,
                                    icon: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          e.toString(),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black87,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        IconButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () {
                                              PopupMenuButton<int>(
                                                itemBuilder: (context) => [
                                                  // popupmenu item 1

                                                  PopupMenuItem(
                                                    value: 2,
                                                    // row has two child icon and text
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons
                                                            .chrome_reader_mode),
                                                        SizedBox(
                                                          // sized box with width 10
                                                          width: 10,
                                                        ),
                                                        Text("About")
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                                offset: Offset(0, 100),
                                                color: Colors.grey,
                                                elevation: 2,
                                              );
                                            },
                                            icon: menuList.indexOf(e) == 8
                                                ? Icon(Icons.arrow_drop_down,
                                                    color: Colors.pink.shade800,
                                                    size: 28)
                                                : Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    color: Colors.pink.shade800,
                                                    size: 28)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(child: _buildSelectedWidget())),
    );
  }

  Widget dashboard(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(6),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(04),
                color: Colors.grey.shade500,
                border: Border.all(color: Colors.white)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Card(
                    color: Colors.white,
                    child: IconButton(
                      constraints: const BoxConstraints(),
                      padding: const EdgeInsets.all(3),
                      onPressed: null,
                      icon: Icon(
                        Icons.note_alt_outlined,
                        color: Colors.pink.shade800,
                      ),
                    ),
                  ),
                  const Gap(12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "LAP Overdue Receipt",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Gap(6),
                      Text(
                        "HE01XBV0000000456",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Gap(6),
          Container(
            decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(04),
                  topLeft: Radius.circular(04),
                )),

            // width: MediaQuery.sizeOf(context).width * 0.7,
            child: Row(
              children: [
                const Gap(12),
                Card(
                  color: Colors.grey[450],
                  child: IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(3),
                    onPressed: null,
                    icon: Icon(
                      Icons.edit_document,
                      color: Colors.pink.shade800, // Colors.grey[450],
                    ),
                  ),
                ),
                const Gap(12),
                const Text(
                  "Agreement Info",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Colors.grey[450],
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            // width: MediaQuery.sizeOf(context).width * 0.7,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(04),
                  bottomLeft: Radius.circular(04),
                ),
                border: Border.all(color: Colors.grey[300]!)),

            child: const Column(
              children: [
                Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Agreement No",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(6),
                        Text("HE01XBV0000000456",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "CIF No",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(6),
                        Text("5369872",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Account Name",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(6),
                        Text("SANJAY PAL",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "EMI Amount",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(6),
                        Text("896325",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Mobile Number",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Gap(6),
                        Text("9874563215",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            )),
                      ],
                    ),
                  ],
                ),
                Gap(16),
              ],
            ),
          ),
          const Gap(6),
          CupertinoSegmentedControl<int>(
            padding: const EdgeInsets.all(8),
            children: {
              for (int index = 0; index < typeList.length; index++)
                index: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    typeList[index].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 6,
                  ),
                ),
            },
            groupValue: _typeCurrentIndex,
            onValueChanged: (int newIndex) {
              setState(() {
                _typeCurrentIndex = newIndex;
              });
            },
            borderColor: Colors.pink.shade800,
            selectedColor: Colors.pink.shade800,
            unselectedColor: Colors.white,
            pressedColor: Colors.pink.withOpacity(0.2),
          ),
          const Gap(6),
          _typeCurrentIndex == 1
              ? CustomTextField(
                  text: "MCR",
                  isReq: true,
                  isRemark: false,
                  width: MediaQuery.sizeOf(context).width * 0.6,
                )
              : const SizedBox.shrink(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                text: "Mobile No",
                width: MediaQuery.sizeOf(context).width * 0.3,
                isReq: true,
                suffixIcon: const Icon(
                  Icons.arrow_drop_down_sharp,
                  size: 20,
                ),
              ),
              CustomTextField(
                  text: "Amount Collected",
                  controller: formController.amountController,
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  onChanged: _onAmountCollectedChanged,
                  isReq: true),
              const Gap(6),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 1.1,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Gap(12),
                Expanded(
                  flex: 3,

                  /// This is the left widget
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 06.0, top: 0),
                        child: Row(
                          children: [
                            Text(
                              "*",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 12),
                            ),
                            Text(
                              "Payment method",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      CupertinoSegmentedControl<int>(
                        padding: const EdgeInsets.all(2),
                        children: {
                          for (int index = 0;
                              index < tabWidgets.length;
                              index++)
                            index: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 20),
                              child: Text(
                                tabBarView[index].toUpperCase(),
                                style: const TextStyle(
                                  fontSize: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                maxLines: 6,
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
                        children: tabWidgets,
                      )),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: MediaQuery.sizeOf(context).height * 0.11,
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
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.03,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink.shade800,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4))),
                                      onPressed: () {
                                        setState(() {});
                                        formController.amountController.clear();
                                        tableData[1][2] = 0.toString();
                                        tableData[2][2] = 0.toString();
                                        tableData[3][2] = 0.toString();
                                        tableData[4][2] = 0.toString();
                                        tableData[5][2] = 0.toString();
                                        tableData[6][2] = 0.toString();
                                        tableData[7][2] = 0.toString();
                                        tableData[8][1] = 0.toString();
                                        tableData[8][2] = 0.toString();
                                      },
                                      child: const Text(
                                        "Reset",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                Text(
                                  "Agreement No:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                ),
                                Text("HE028I2PNFJN20379729",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 12,
                                        )),
                              ],
                            )
                          ],
                        ),
                      ),
                      const Gap(6),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                        ),
                        child: Table(
                          border: TableBorder.all(color: Colors.transparent),
                          children: List<TableRow>.generate(
                            tableData.length,
                            (rowIndex) => TableRow(
                              children: List<Widget>.generate(
                                tableData[rowIndex].length,
                                (colIndex) {
                                  // Determine if the cell should be editable
                                  bool isEditable =
                                      tableData[rowIndex][0] != 'Total' &&
                                          tableData[rowIndex][0] != 'Item' &&
                                          colIndex == 2 &&
                                          tableData[rowIndex][0] !=
                                              'Add Other Changes';

                                  return Container(
                                    height: 45,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        bottom: BorderSide(color: Colors.black),
                                        right: colIndex ==
                                                tableData[rowIndex].length - 1
                                            ? BorderSide(
                                                color: Colors.transparent)
                                            : BorderSide(color: Colors.black),
                                      ),
                                    ),
                                    child: isEditable
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextFormField(
                                              controller: TextEditingController(
                                                  text: tableData[rowIndex]
                                                      [colIndex]),
                                              onChanged: (value) {
                                                // Update tableData with the new value
                                                tableData[rowIndex][colIndex] =
                                                    value;
                                              },
                                              decoration: const InputDecoration(
                                                border: OutlineInputBorder(),
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                              ),
                                            ),
                                          )
                                        : Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              tableData[rowIndex][colIndex],
                                              style: TextStyle(
                                                fontWeight: tableData[rowIndex]
                                                            [0] ==
                                                        'Total'
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
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
        ],
      ),
    );
  }

  void _onAmountCollectedChanged(String val) {
    setState(() {});

    var cellValue = tableData[1][1];
    var cellValue1 = tableData[2][1];
    var cellValue2 = tableData[3][1];
    var cellValue3 = tableData[4][1];
    var cellValue4 = tableData[5][1];
    var cellValue5 = tableData[6][1];

    var numericCellValue = double.tryParse(cellValue) ?? 0.0;
    var numericCellValue1 = double.tryParse(cellValue1) ?? 0.0;
    var numericCellValue2 = double.tryParse(cellValue2) ?? 0.0;
    var numericCellValue3 = double.tryParse(cellValue3) ?? 0.0;
    var numericCellValue4 = double.tryParse(cellValue4) ?? 0.0;
    var numericCellValue5 = double.tryParse(cellValue5) ?? 0.0;

    var numericVal = double.tryParse(val) ?? 0.0;

    if (numericCellValue < numericVal) {
      tableData[1][2] = cellValue;

      setState(() {
        _bal = numericVal - numericCellValue;
      });
    } else {
      _bal = 0.0;
      _bal1 = 0.0;
      _bal2 = 0.0;
      _bal3 = 0.0;
      _bal4 = 0.0;
      _bal5 = 0.0;
      _bal6 = 0.0;

      tableData[1][2] = val;
      setState(() {});
    }

    if (numericCellValue1 > _bal) {
      _bal1 = numericCellValue1 - _bal;
      tableData[2][2] = _bal.toString();
      setState(() {});
    } else {
      tableData[2][2] = cellValue1;
      setState(() {
        _bal2 = _bal - _bal1;
      });
    }

    if (_bal < _bal1 && _bal < _bal2) {
    } else {
      tableData[3][2] = _bal2.toString();
      setState(() {});
    }
    if (numericCellValue2 < _bal2) {
      setState(() {});
      tableData[3][2] = tableData[3][1];
      _bal3 = _bal2 - numericCellValue2;
      tableData[4][2] = _bal3.toString();
    } else {
      tableData[4][2] = _bal3.toString();
    }
    if (numericCellValue3 < _bal3) {
      setState(() {});
      tableData[4][2] = numericCellValue3.toString();
      _bal4 = _bal3 - numericCellValue3;
      tableData[5][2] = _bal4.toString();
    } else {
      tableData[5][2] = _bal4.toString();
    }
    if (numericCellValue4 < _bal4) {
      setState(() {});
      tableData[5][2] = numericCellValue4.toString();
      _bal5 = _bal4 - numericCellValue4;
      tableData[6][2] = _bal5.toString();
    } else {
      tableData[6][2] = _bal5.toString();
    }
    if (numericCellValue5 < _bal5) {
      setState(() {});
      tableData[6][2] = numericCellValue5.toString();
      _bal6 = _bal5 - numericCellValue5;
      tableData[7][2] = _bal6.toString();
    } else {
      tableData[7][2] = _bal6.toString();
    }
    tableData[8][2] = val;
    var actualBal = numericVal - _bal6;
    tableData[8][1] = actualBal.toString();

    setState(() {});
  }
}
