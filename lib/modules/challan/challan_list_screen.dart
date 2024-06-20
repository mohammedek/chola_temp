import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/modules/batch/batch_list_screen.dart';
import 'package:chola_first/modules/batch/batch_screen.dart';
import 'package:chola_first/modules/challan/challan_screen.dart';
import 'package:chola_first/widgets/web/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class ChallanListScreen extends StatefulWidget {
  const ChallanListScreen({super.key});

  @override
  _ChallanListScreenState createState() => _ChallanListScreenState();
}

class _ChallanListScreenState extends State<ChallanListScreen> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  late TabController _tabController;
  final int _currentIndex = 0;
  final int _typeCurrentIndex = 0;
  int _selectedVertMenu = 1;
  bool isEOD = false;

  final List<Map<String, dynamic>> _data = [
    for (int i = 0; i < 10; i++)
      {
        'Agreement Number': 'HE01DEI00000045245',
        'CIF ID': '9609101',
        'Customer': '7 CABALLO ENTERPRISES LLP',
        'DPD': 36,
        'EMI': '1,40,590.00',
        'Total EMI OD Amount': '2,81,190.00',
        'NPA': 'Regular',
        'Vertical': 'LAP',
        'Branch': 'DELHI FIVE A HE',
        'Created Date': '08/11/2023, 7:27 PM',
      },
    {
      'Agreement Number': 'HE01DEI00000025224',
      'CIF ID': '9609101',
      'Customer': '7 CABALLO ENTERPRISES LLP',
      'DPD': 36,
      'EMI': '3,70,399.00',
      'Total EMI OD Amount': '7,40,796.00',
      'NPA': 'Regular',
      'Vertical': 'LAP',
      'Branch': 'DELHI FIVE A HE',
      'Created Date': '08/11/2023, 7:28 PM',
    },
  ];

  final List<String> challanList = [
    "CH-23658",
    "CH-23645",
    "CH-23655",
    "CH-23664",
    "CH-23667",
    "CH-23690",
    "CH-23678",
    "CH-23600",
    "CH-23645",
    "CH-23612",
    "CH-23611",
    "CH-23643",
    "CH-23634",
  ];

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField,
      int columnIndex, bool ascending) {
    _data.sort((a, b) {
      if (!ascending) {
        final Map<String, dynamic> c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

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
                                                      4) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const BatchListScreen()),
                                                    );
                                                  }

                                                  if (menuList.indexOf(e) ==
                                                      5) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ChallanListScreen()),
                                                    );
                                                  }
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
              Expanded(child: challanListUI(context, challanList))
            ],
          )),
    );
  }

  Expanded challanListUI(BuildContext context, List recentOAgreements) {
    return Expanded(
      child: recentOAgreements.isEmpty
          ? const SizedBox()
          : Column(
              children: [
                const Divider(
                  height: 0,
                ),
                Container(
                  color: ksecondaryColor.withOpacity(0.2),
                  child: ListTile(
                    dense: true,
                    leading: const SizedBox.shrink(),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    title: SizedBox(
                      height: 30,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //  mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                padding: EdgeInsets.zero,
                                isExpanded: true,
                                hint: Text('OChallans',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: bold)),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: blackColor,
                                ),
                                items: const [
                                  // DropdownMenuItem(child: Text("data"))
                                ],
                                onChanged: (value) {},
                              )),
                            ),
                            const VerticalDivider(
                              thickness: 2,
                            ),
                            const Gap(25)
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => const Divider(
                      height: 0,
                    ),
                    itemCount: recentOAgreements.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        title: Text(
                          recentOAgreements[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.blue.shade900),
                        ),
                        leading: Text("${index + 1}"),
                        trailing: SizedBox(
                          width: 25,
                          height: 25,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 2,
                            margin: EdgeInsets.zero,
                            shadowColor: Colors.grey,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: blackColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const ChallanScreen()));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
