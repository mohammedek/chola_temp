import 'dart:ui';

import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/widgets/web/banking_widget.dart';
import 'package:chola_first/widgets/web/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

import '../../constants/styles.dart';
import '../eod/bank_form_screen.dart';

class NewChallanScreen extends StatefulWidget {
  const NewChallanScreen({super.key});

  @override
  State<NewChallanScreen> createState() => _NewChallanScreenState();
}

class _NewChallanScreenState extends State<NewChallanScreen> {
  late TabController _tabController;
  final int _currentIndex = 0;
  final int _typeCurrentIndex = 0;
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
              Expanded(child: challanModule(context))
            ],
          )),
    );
  }

  Widget challanModule(BuildContext context) {
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
                  "Batch Challaning",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Gap(16),
            //Challan Details
            Row(
              children: [
                challanDetails(),
              ],
            ),
            const Gap(26),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink.shade800,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4))),
                  onPressed: () {},
                  child: const Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const Gap(26),
          ],
        ),
      ),
    );
  }

  Widget challanDetails() {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Challan Number",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const Gap(6),
          Flexible(
            //  width: MediaQuery.of(context).size.width * 0.5,
            child: TextFormField(
              cursorColor: Colors.blue,
              readOnly: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                hintText: 'CH-003695',
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                errorMaxLines: 2,
              ),
            ),
          ),
          const Gap(12),
          const Text(
            "Physical Challan No",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const Gap(6),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: TextFormField(
              cursorColor: Colors.blue,
              readOnly: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                hintText: '',
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                errorMaxLines: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
