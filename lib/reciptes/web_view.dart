import 'package:chola_first/widgets/banking_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../eod/bank_form_screen.dart';
import '../model/name_lists.dart';
import '../widgets/recipte_widget.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  late TabController _tabController;
  int _currentIndex = 0;
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
                          width:MediaQuery.of(context).size.width  * 0.5,
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
                    child: RecipteWidget(),
                  ),
                  Container(
                    height: 4,
                    color: Colors.grey,
                  ),
                ],
              ),
              Expanded(
                child: _selectedVertMenu == 1
                    ? dashboard(context)
                    : const BankFormScreen(),
              )
            ],
          )),
    );
  }

  SingleChildScrollView dashboard(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isEOD == false
              ? SingleChildScrollView(
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
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
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
