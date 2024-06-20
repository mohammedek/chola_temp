import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/modules/reciptes/web_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SelectReceiptType extends StatefulWidget {
  const SelectReceiptType({super.key});

  @override
  State<SelectReceiptType> createState() => _SelectReceiptTypeState();
}

class _SelectReceiptTypeState extends State<SelectReceiptType> {
  List<String> receiptTypes = [
    'LAP_Foreclosure',
    'LAP_Overdue',
    'LAP_Part Payment EMI Reduction',
    'LAP_Part Payment Tenure Reduction',
    'LAP_Settlement'
  ];
  String? selectedReceiptType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryColor.withOpacity(0.1),
      body: Card(
        elevation: 8,
        shadowColor: greyColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.all(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              headerLayout(context),
              const Gap(10),
              ListTile(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(child: Text('Receipt Type')),
                    Expanded(
                      flex: 2,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: greyColor)),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                            dropdownColor: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(20),
                            isExpanded: true,
                            hint: Text(
                              "Select Receipt Type",
                              style: Theme.of(context).textTheme.titleSmall!,
                            ),
                            focusColor: whiteColor,
                            value: selectedReceiptType,
                            items: receiptTypes.map((String receipt) {
                              return DropdownMenuItem<String>(
                                value: receipt,
                                child: Text(
                                  receipt,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        fontWeight: medium,
                                      ),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedReceiptType = value;
                              });
                            },
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(child: Text('Receipt Sub-Type')),
                    Expanded(
                      flex: 2,
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: const BorderSide(color: greyColor)),
                        elevation: 10,
                        child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          isExpanded: true,
                          hint: Text(
                            "Select Receipt Sub-Type",
                            style: Theme.of(context).textTheme.titleSmall!,
                          ),
                          items: const [
                            // DropdownMenuItem(child: Text("data"))
                          ],
                          onChanged: (value) {},
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text("Cancel")),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const WebView(
                                      index: 2,
                                    )));
                      },
                      child: const Text("Continue"))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  headerLayout(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: ksecondaryColor,
      contentPadding:
          const EdgeInsets.symmetric().copyWith(top: 8, bottom: 8, left: 8),
      leading: Card(
        margin: const EdgeInsets.all(3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.book,
            color: ksecondaryColor,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Receipt Types",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: bold, color: whiteColor),
          ),
          const Gap(5),
          Text(
            "Select a Receipt Type",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontWeight: medium, color: whiteColor),
          )
        ],
      ),
    );
  }
}
