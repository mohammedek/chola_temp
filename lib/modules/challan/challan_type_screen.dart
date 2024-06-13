import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/widgets/web/banking_widget.dart';
import 'package:chola_first/widgets/web/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../constants/styles.dart';
import '../eod/bank_form_screen.dart';

class ChallanTypeScreen extends StatefulWidget {
  const ChallanTypeScreen({super.key});

  @override
  State<ChallanTypeScreen> createState() => _ChallanTypeScreenState();
}

class _ChallanTypeScreenState extends State<ChallanTypeScreen> {
  late TabController _tabController;
  final int _currentIndex = 0;
  final int _typeCurrentIndex = 0;
  int _selectedVertMenu = 1;
  bool isEOD = false;
  bool checkedValue = false;
  bool isSelectAll = false;
  bool isSelect = false;
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
                              hintStyle: TextStyle(color: Colors.pink.shade800),
                              focusColor: Colors.pink.shade800,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.pink.shade800,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    width: 3, color: Colors.pink.shade800),
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
                              border: Border.all(color: Colors.pink.shade800)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.star,
                                      size: 20, color: Colors.pink.shade800)),
                              VerticalDivider(color: Colors.pink.shade800),
                              DropdownButton(
                                items: const [],
                                onChanged: (value) {},
                                underline: const SizedBox(),
                                icon: Icon(
                                    color: Colors.pink.shade800,
                                    (Icons.arrow_drop_down)),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            color: Colors.pink.shade800,
                            icon: const Icon(
                              Icons.add_box,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            color: Colors.pink.shade800,
                            icon: const Icon(
                              Icons.cloud_circle_outlined,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            color: Colors.pink.shade800,
                            icon: const Icon(
                              Icons.question_mark_rounded,
                              size: 30,
                            )),
                        IconButton(
                            onPressed: () {},
                            color: Colors.pink.shade800,
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
                                            ? Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                            fontSize: menuList.indexOf(e) == 0
                                                ? 20
                                                : 14,
                                            color: Colors.pink.shade800,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        menuList.indexOf(e) == 0
                                            ? const SizedBox()
                                            : InkWell(
                                                child: menuList.indexOf(e) == 9
                                                    ? Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Colors
                                                            .pink.shade800,
                                                        size: 28)
                                                    : Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color: Colors
                                                            .pink.shade800,
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
                  // Container(
                  //   height: 4,
                  //   color: Colors.grey,
                  // ),
                ],
              ),
              Expanded(child: challanTypeModule(context))
            ],
          )),
    );
  }

  Widget challanTypeModule(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        color: whiteColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(6),
            Container(
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  border: Border.all(color: Colors.blue.shade900)),
              child: ListTile(
                dense: true,
                tileColor: Colors.blue.shade900,
                leading: Card(
                  color: Colors.white,
                  child: IconButton(
                    constraints: const BoxConstraints(),
                    padding: const EdgeInsets.all(3),
                    onPressed: null,
                    icon: Icon(
                      Icons.batch_prediction,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                title: const Text(
                  "New Challan",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "Cash Challaning",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Gap(10),
            Row(
              children: [
                const Text(
                  "Total Amount :",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                const Gap(4),
                const Text(
                  "100",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade800,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                const Gap(16)
              ],
            ),
            const Gap(5),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 45,
                        height: 45,
                        child: Checkbox(
                            value: isSelectAll,
                            onChanged: (val) {
                              print(val);
                              isSelectAll = val!;

                              setState(() {});
                            }),
                      ),
                      const Text(
                        "Select All",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      Text(
                        "Total Selected Receipts Amount : ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Gap(4),
                      Text(
                        "100",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Row(
                    children: [
                      Text(
                        "Total Unselected Receipts Amount : ",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                      Gap(4),
                      Text(
                        "0",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Gap(6),
            SizedBox(
              // width: MediaQuery.of(context).size.width * 0.9,
              height: 210,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
                childAspectRatio: 0.5,
                padding: const EdgeInsets.all(8),
                crossAxisCount: 1,
                children: <Widget>[
                  challanTypeCard(typeTitle: 'Cash'),
                ],
              ),
            ),
            const Gap(26),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      onPressed: () {},
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      )),
                  const Gap(16),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4))),
                      onPressed: () {},
                      child: const Text(
                        "Bank Deposit",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
            const Gap(26),
          ],
        ),
      ),
    );
  }

  Widget challanTypeCard({
    required String typeTitle,
  }) {
    return Container(
      //width: 400, //MediaQuery.sizeOf(context).width * 0.9,
      height: 120, //MediaQuery.sizeOf(context).height * 0.2,
      padding: const EdgeInsets.all(08),
      decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(
                3.0,
                3.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 1.0,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: Checkbox(
                        value: isSelect,
                        onChanged: (val) {
                          //print(val);
                          isSelect = val!;

                          setState(() {});
                        }),
                  ),
                  const Text(
                    "B-0232542",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  const Gap(16),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 08, vertical: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.yellow.shade800,
                    ),
                    child: const Text(
                      "Agreement",
                      style: TextStyle(
                          fontSize: 14,
                          color: whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
          const Gap(2),
          const Divider(
            color: Colors.black54,
          ),
          // const Gap(4),
          // const Text(
          //   'Cash | No of Receipts : 1',
          //   style: TextStyle(
          //     fontSize: 12,
          //     color: Colors.black45,
          //   ),
          // ),
          const Gap(6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.receipt,
                color: Colors.black87,
              ),
              Gap(4),
              Text(
                'Cash | No of Receipts : 1',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Gap(6),
          Row(
            children: [
              Text(
                "Amount :",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold),
              ),
              const Gap(4),
              Text(
                "100",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue.shade900,
                    fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green.shade800,
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  color: whiteColor,
                ),
              )
            ],
          ),
          const Gap(6)
        ],
      ),
    );
  }
}
