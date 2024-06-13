import 'package:chola_first/widgets/custom_text_feild.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CashWidget extends StatefulWidget {
  const CashWidget({super.key});

  @override
  State<CashWidget> createState() => _CashWidgetState();
}

class _CashWidgetState extends State<CashWidget> {

  DateTime? pickedDate;
  final TextEditingController _dateController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.90,
      width:MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Gap(16),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.14,
                  child: CustomTextField(text: 'Pan No',isGrey: true)),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("PAN Image"),
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

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Enter Remarks"),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
                  child: TextFormField(
                    maxLines: 2,
                    decoration: InputDecoration(
                      hintText: "Enter Reason",
                      hintStyle: Theme.of(context).textTheme.labelSmall,
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
                const SizedBox(height: 10),
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
                    const SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pinkAccent.shade100,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {},
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
