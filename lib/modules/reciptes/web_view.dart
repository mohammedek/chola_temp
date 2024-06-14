import 'dart:io';

import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/modules/agreements/web/agreement_list.dart';
import 'package:chola_first/modules/batch/batch_list_screen.dart';
import 'package:chola_first/modules/challan/challan_list_screen.dart';
import 'package:chola_first/modules/reciptes/controllers.dart';
import 'package:chola_first/widgets/custom_text_feild.dart';
import 'package:chola_first/widgets/web/banking_widget.dart';
import 'package:chola_first/widgets/web/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../constants/styles.dart';
import '../../widgets/web/cash_widget.dart';
import '../../widgets/web/draft_widget.dart';
import '../../widgets/web/payment_gateway_widget.dart';
import '../../widgets/web/pos_machine.dart';
import '../../widgets/web/r_t_g_s_widget.dart';
import '../eod/bank_form_screen.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  // late TabController _tabController;
  int _currentIndex = 0;
  int _typeCurrentIndex = 0;
  int _selectedVertMenu = 1;
  bool isEOD = false;

  FormControllers formController = FormControllers();

  // void _onAmountCollectedChanged(String value) {
  //   if (value.isEmpty) return;
  //   double amountCollected = double.tryParse(value) ?? 0.0;
  //
  //   setState(() {
  //     for (var row in tableData) {
  //       double overdueAmount = double.tryParse(row[1]) ?? 0.0;
  //       if (amountCollected >= overdueAmount) {
  //         row[2] = amountCollected.toString();
  //         print(row[2]);
  //         break;
  //       }
  //     }
  //   });
  // }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: InkWell(
          onTap: () {
            showCupertinoDialog(
                context: context,
                builder: (context) => CupertinoAlertDialog(
                      title: const Text("Do you want to logout ?"),
                      content: const Text(
                          "By clicking Yes you will be logged out from the application"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              exit(0);
                            },
                            child: const Text("Yes")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No")),
                      ],
                    ));
          },
          child: const Text(
            "Sandbox: preprod02 | Log out",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Scrollbar(
                thickness: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      /// leading
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.04
                          // width: 200,
                          ),

                      /// title
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: 40,
                        child: TextField(
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
                              borderSide: BorderSide(
                                  width: 3, color: Colors.grey.shade800),
                            ),
                          ),
                        ),
                      ),

                      /// space btw tite and actions
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06),

                      /// specific container
                      Container(
                        // height:MediaQuery.of(context).size.width * 0.03,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                            border: Border.all(color: Colors.grey.shade800)),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.star,
                                    color: Colors.grey.shade800)),
                            Container(
                              color: Colors.grey,
                              width: 2,
                              height: MediaQuery.of(context).size.shortestSide *
                                  0.03,
                              // thickness: 2,
                            ),
                            DropdownButton(
                              items: const [],
                              onChanged: (value) {},
                              underline: const SizedBox(),
                              icon: Icon(
                                  color: Colors.grey.shade800,
                                  (Icons.arrow_drop_down)),
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
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          color: Colors.grey.shade800,
                          icon: const Icon(
                            CupertinoIcons.person_alt_circle,
                            size: 30,
                          )),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: menuList
                        .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: InkWell(
                                onTap: () => setState(() {
                                  if (menuList.indexOf(e) != 0) {
                                    setState(() {
                                      _selectedVertMenu = menuList.indexOf(e);
                                    });
                                  }
                                }),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    menuList.indexOf(e) == 0
                                        ? Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            child: Icon(
                                              Icons.menu_rounded,
                                              color: Colors.pink.shade800,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    Text(
                                      e.toString(),
                                      style: TextStyle(
                                        fontSize:
                                            menuList.indexOf(e) == 0 ? 20 : 14,
                                        color: Colors.black87,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    menuList.indexOf(e) == 0
                                        ? const SizedBox()
                                        : InkWell(
                                            child: menuList.indexOf(e) == 9
                                                ? Icon(Icons.arrow_drop_down,
                                                    color: Colors.pink.shade800,
                                                    size: 28)
                                                : Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    color: Colors.pink.shade800,
                                                    size: 28),
                                            onTap: () async {
                                              if (menuList.indexOf(e) == 7) {
                                                return showCupertinoDialog(
                                                    context: context,
                                                    builder:
                                                        (context) => SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.70,
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child:
                                                                  AlertDialog(
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                content:
                                                                    const ChalanPopup(),
                                                                scrollable:
                                                                    true,
                                                                actions: [
                                                                  Container(
                                                                    height: 2,
                                                                    color: Colors
                                                                        .black45,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        top:
                                                                            8.0),
                                                                    child: ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors
                                                                              .pink
                                                                              .shade800,
                                                                        ),
                                                                        onPressed: () {
                                                                          Navigator.pop(
                                                                              context);
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
                                              } else if (menuList.indexOf(e) ==
                                                  6) {
                                                setState(() {
                                                  isEOD = true;
                                                });
                                              } else {
                                                setState(() {
                                                  isEOD = false;
                                                });
                                              }
                                            },
                                          ),
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  )),
              Expanded(
                  child: _selectedVertMenu == 0
                      ? dashboard(context)
                      : _selectedVertMenu == 1
                          ? const OAgreementsPageWeb()
                          : _selectedVertMenu == 2
                              ? dashboard(context)
                              : _selectedVertMenu == 3
                                  ? dashboard(context)
                                  : _selectedVertMenu == 4
                                      ? const BatchListScreen()
                                      : _selectedVertMenu == 5
                                          ? const ChallanListScreen()
                                          : _selectedVertMenu == 6
                                              ? const BankFormScreen()
                                              : _selectedVertMenu == 7
                                                  ? dashboard(context)
                                                  : _selectedVertMenu == 8
                                                      ? dashboard(context)
                                                      : const SizedBox())
            ],
          )),
    );
  }

  Widget dashboard(BuildContext context) {
    return isEOD == false
        ? SingleChildScrollView(
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
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
                        // onChanged: _onAmountCollectedChanged,
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.03,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Colors.pink.shade800,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4))),
                                            onPressed: () {},
                                            child: const Text(
                                              "Reset",
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                                            controller: colIndex ==
                                                                        2 &&
                                                                    tableData[rowIndex]
                                                                            [
                                                                            0] !=
                                                                        "Total"
                                                                ? formControllers
                                                                    .amountController
                                                                : TextEditingController(),
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
              ],
            ),
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height * 1.8,
            width: double.infinity,
            child: const BankFormScreen());
  }
}
