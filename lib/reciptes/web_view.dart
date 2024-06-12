import 'package:chola_first/widgets/banking_widget.dart';
import 'package:chola_first/widgets/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/colors.dart';
import '../eod/bank_form_screen.dart';
import '../model/name_lists.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late TabController _tabController;
  int _currentIndex = 0;
  int _typeCurrentIndex = 0;
  int _selectedVertMenu = 1;
  bool isEOD = false;
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    // width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.04
                            // width: 200,
                            ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 40,
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
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.08),
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
                            onPressed: () {},
                            icon: const Icon(Icons.more_vert)),
                      ],
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
                                          _selectedVertMenu =
                                              menuList.indexOf(e);
                                        });
                                      }
                                    }),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        menuList.indexOf(e) == 0
                                            ? const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2.0),
                                                child:Icon(Icons.menu_sharp)
                                              )
                                            : const SizedBox.shrink(),
                                        Text(
                                          e.toString(),
                                          style: TextStyle(
                                            fontSize: menuList.indexOf(e) == 0
                                                ? 20
                                                : 14,
                                            color: Colors.black54,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        menuList.indexOf(e) == 0
                                            ? const SizedBox()
                                            : InkWell(
                                                child: menuList.indexOf(e) == 9
                                                    ? const Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 28)
                                                    : const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        size: 28),
                                                onTap: () async {
                                                  if (menuList.indexOf(e) ==
                                                      7) {
                                                    return showCupertinoDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                SizedBox(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.70,
                                                                  width: MediaQuery.of(
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
                                                                        height:
                                                                            2,
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
                                                                              backgroundColor: Colors.pink.shade800,
                                                                            ),
                                                                            onPressed: () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child: const Text(
                                                                              'Submit',
                                                                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                                                            )),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ));
                                                  } else if (menuList
                                                          .indexOf(e) ==
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
                  Container(
                    height: 4,
                    color: Colors.grey,
                  ),
                ],
              ),
              Expanded(child: dashboard(context))
            ],
          )),
    );
  }

  SingleChildScrollView dashboard(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(6),
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[400]!)),
            child: ListTile(
              dense: true,
              tileColor: Colors.grey[300],
              leading: Card(
                color: Colors.deepPurple.shade900,
                child: const IconButton(
                  constraints: BoxConstraints(),
                  padding: EdgeInsets.all(3),
                  onPressed: null,
                  icon: Icon(
                    Icons.note_alt_outlined,
                    color: kWhiteColor,
                  ),
                ),
              ),
              title: Text(
                "LAP Overdue Receipt",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.deepPurple.shade900,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "HE01XBV0000000456",
                style: TextStyle(
                    color: Colors.deepPurple.shade900,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Gap(6),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: ListTile(
              dense: true,
              tileColor: Colors.grey[300],
              leading: Card(
                color: Colors.grey[450],
                child: IconButton(
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(3),
                  onPressed: null,
                  icon: Icon(
                    Icons.edit_document,
                    color: Colors.grey[450],
                  ),
                ),
              ),
              title: Text(
                "Agreement Info",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[450],
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.7,
            height: 80,
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey[300]!)),
            child: Column(
              children: [
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Agreement No",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(4),
                        Text("HE01XBV0000000456",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500])),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "CIF No",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(4),
                        Text("5369872",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500])),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Account Name",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(4),
                        Text("SANJAY PAL",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500])),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "EMI Amount",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(4),
                        Text("896325",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500])),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Mobile Number",
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.bold),
                        ),
                        const Gap(4),
                        Text("9874563215",
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[500])),
                      ],
                    ),
                  ],
                ),
                const Gap(6),
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
          isEOD == false
              ? SingleChildScrollView(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 1.1,
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Gap(6),
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              CupertinoSegmentedControl<int>(
                                padding: const EdgeInsets.all(8),
                                children: {
                                  for (int index = 0;
                                      index < tabBarView.length;
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
                                    children: tabBarView
                                        .map((e) => BankingWidget(e))
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
                                  border: TableBorder.all(
                                      color: Colors.transparent),
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
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                fontWeight: tableData[rowIndex]
                                                                            [
                                                                            0] ==
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
                                                            child:
                                                                TextFormField(
                                                              initialValue:
                                                                  0.toString(),
                                                              onChanged:
                                                                  (value) {
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
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height * 1.8,
                  width: double.infinity,
                  child: const BankFormScreen()),
        ],
      ),
    );
  }
}


