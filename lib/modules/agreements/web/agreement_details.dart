import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/model/name_lists.dart';
import 'package:chola_first/modules/agreements/web/select_receipt_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OAgreementDetails extends StatefulWidget {
  const OAgreementDetails({super.key});

  @override
  State<OAgreementDetails> createState() => _OAgreementDetailsState();
}

class _OAgreementDetailsState extends State<OAgreementDetails> {
  List tabList = [
    'Basic Details',
    'Financial Details',
    'Non - Financial Details',
    'ORepayment Schedule',
    'More',
  ];
  int _typeCurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget headerRow(String title, String value) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Flex(
          direction: !ResponsiveSize().isWide(context)
              ? Axis.horizontal
              : Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$title:',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(
              height: 3,
            ),
            Text(value),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        backgroundColor: ksecondaryColor.withOpacity(0.1),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Card(
                          margin: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          color: ksecondaryColor.withOpacity(0.1),
                          child: headerLayout(context),
                        ),
                        const Divider(
                          height: 0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Flex(
                            direction: ResponsiveSize().isWide(context)
                                ? Axis.horizontal
                                : Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              headerRow('CIF ID', '4220969'),
                              headerRow('Customer Name', 'AAKRITI ARORA'),
                              headerRow('DPD', '373'),
                              headerRow('EMI Amount', '26,859'),
                              headerRow('Total EMI OD Amount', '349,164'),
                              headerRow('Total Charges OD', '24,475'),
                              headerRow('OD + POS', '529,413.00'),
                              headerRow('GA Value', ''),
                              headerRow('NPA Stage', 'Regular'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 40,
                            child: TabBar(
                              isScrollable: true,
                              labelStyle: const TextStyle(fontWeight: bold),
                              labelColor: blackColor,
                              unselectedLabelColor: greyColor,
                              tabs: tabList
                                  .map((e) => Tab(
                                          child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            e,
                                          ),
                                          e == "More"
                                              ? const Icon(
                                                  Icons.keyboard_arrow_down)
                                              : const SizedBox()
                                        ],
                                      )))
                                  .toList(),
                            ),
                          ),
                          ListTile(
                            tileColor: ksecondaryColor.withOpacity(0.1),
                            leading: const Icon(Icons.keyboard_arrow_down),
                            title: const Text("Information"),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 1.5,
                            child: TabBarView(children: [
                              buildBasicDetailsCard(),
                            ]),
                          )
                        ],
                      )),
                )

                // Add other sections as needed
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column headerLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          tileColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          leading: Card(
            color: ksecondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.book,
                color: whiteColor,
              ),
            ),
          ),
          title: Text(
            "OAgreements",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: bold, color: ksecondaryColor),
          ),
          trailing: CupertinoSegmentedControl<int>(
            padding: const EdgeInsets.all(8),
            children: {
              for (int index = 0; index < agreementList.length; index++)
                index: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: Text(
                    agreementList[index],
                  ),
                ),
            },
            groupValue: _typeCurrentIndex,
            onValueChanged: (int newIndex) {
              setState(() {
                _typeCurrentIndex = newIndex;
              });

              if (newIndex == 1) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const SelectReceiptType()));
              }
            },
            borderColor: Colors.pink.shade800,
            selectedColor: Colors.pink.shade800,
            unselectedColor: Colors.white,
            pressedColor: Colors.pink.withOpacity(0.2),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              "HE02SRH00000006085",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: bold,
                  ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBasicDetailsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          child: Wrap(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailRow('Agreement No', 'HE02SRH00000006085'),
              detailRow('Customer', 'AAKRITI ARORA'),
              detailRow('CIF ID', '4220969'),
              detailRow('Mobile Number', '7017337412'),
              detailRow('Branch', 'SAHARANPUR HE'),
              detailRow('MB DPD', ''),
              detailRow('Product_Description', 'HE02'),
              detailRow('Disbursed Amount', '8,00,000.00'),
              detailRow('Agreement Date', '05/04/2024'),
              detailRow('Agreement Status', 'A'),
              detailRow('Disable Cash', ' '),
              detailRow('DPD', '373'),
              detailRow('Stage', 'Regular'),
              detailRow('EMI Amount', '26,859.00'),
              detailRow('Next EMI DueDate', '05/04/2024'),
              detailRow('Last Payment Amount', '0.00'),
              detailRow('Tenure', '48'),
              detailRow('Flag Status', ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0).copyWith(right: 20),
      child: SizedBox(
        width: ResponsiveSize().isWide(context)
            ? MediaQuery.of(context).size.width / 2.5
            : null,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: ResponsiveSize().isWide(context)
                  ? MediaQuery.of(context).size.width / 3.8
                  : null,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, color: blackColor))),
                  const Spacer(),
                  Expanded(
                    child: Text(
                      value,
                      maxLines: 1,
                      style: const TextStyle(color: blackColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
