import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl.dart';

import '../custom_text_feild.dart';

class DraftWidget extends StatefulWidget {
  const DraftWidget({super.key});

  @override
  State<DraftWidget> createState() => _DraftWidgetState();
}

class _DraftWidgetState extends State<DraftWidget> {
  DateTime? pickedDate;
  final TextEditingController _dateController = TextEditingController();
  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.90,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(16),
                      const CustomTextField(
                        text: " MICR No",
                      ),
                      const Gap(16),
                      const CustomTextField(text: "Bank Name", isGrey: true),
                      const Gap(16),
                      const CustomTextField(
                        text: "Instrument No.",
                        isReq: true,
                      ),
                      const Gap(10),
                      const Text("* Instrument Image"),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height / 16,
                        width: MediaQuery.sizeOf(context).shortestSide * 0.40,
                        child: DottedBorder(
                          color: Colors.black26,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){},
                                child: Container(
                                  height: MediaQuery.sizeOf(context).height / 18,
                                  width:MediaQuery.sizeOf(context).shortestSide * 0.20,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black87),
                                    borderRadius: BorderRadius.circular(04),
                                  ),
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Icon(
                                        Icons.file_upload_outlined,
                                        color: Colors.pink,
                                        size: 18,
                                      ),
                                      Text("Upload Files",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: Colors.pink,
                                      ),)

                                    ],
                                  ),
                                ),
                              ),
                              const Text("Or drop files"),
                              const Gap(0),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(16),
                      const CustomTextField(
                        text: "IFSC Code",
                        isReq: false,
                        isGrey: false,
                      ),
                      const Gap(16),
                      const CustomTextField(
                        text: "Branch Name",
                        isReq: false,
                        isGrey: true,
                      ),
                      const Gap(16),
                      const Text(
                        "Instrument Date",
                        style: TextStyle(fontSize: 14),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            initialDate: pickedDate ?? DateTime.now(),
                            context: context,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (picked != null && picked != pickedDate) {
                            setState(() {
                              pickedDate = picked;
                              _dateController.text =
                              "${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}";
                            });
                          }
                        },
                        child: AbsorbPointer(
                          child: TextField(
                            controller: _dateController,
                            onChanged: (value) {
                              setState(() {
                                value = pickedDate.toString();
                              });
                            },
                            decoration: InputDecoration(
                              hintText:formattedDate,
                              hintStyle: const TextStyle(fontSize: 14),
                              border: const OutlineInputBorder(),
                              suffixIcon: const Icon(Icons.date_range),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(26),
                      ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade800,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          "Fetch Details",
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Enter Remarks"
                ),
                SizedBox(
                  // width: MediaQuery.of(context).size.width / 1.7,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                    ),
                  ),
                ),
                const Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink.shade800,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Cancel",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const Gap(10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: null,
                      child: const Text(
                        "Preview",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
