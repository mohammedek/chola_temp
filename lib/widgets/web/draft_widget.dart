import 'package:chola_first/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../file_upload_widget.dart';

class DraftWidget extends StatefulWidget {
  const DraftWidget({Key? key}) : super(key: key);

  @override
  _DraftWidgetState createState() => _DraftWidgetState();
}

class _DraftWidgetState extends State<DraftWidget> {
  DateTime? pickedDate;
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<PlatformFile>? _selectedFiles;
  bool _isFetchingDetails = false;

  void _handleFilesSelected(List<PlatformFile> files) {
    // Handle the selected files
    setState(() {
      _selectedFiles = files;
    });
    print('Selected files: ${files.map((file) => file.name).join(', ')}');
  }

  void _fetchDetails() async {
    if (_selectedFiles == null || _selectedFiles!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload at least one file')),
      );
      return;
    }

    setState(() {
      _isFetchingDetails = true;
    });

    await Future.delayed(
        const Duration(seconds: 2)); // Simulate fetching details

    setState(() {
      _isFetchingDetails = false;
    });

    // Proceed with other operations after fetching details
  }

  void _showPreviewDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.sizeOf(context).width ,
          child: AlertDialog(
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // const Gap(10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink.shade800,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.zero,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration:  BoxDecoration(
                    color: Colors.blue.shade900,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurple,
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.white,
                        ),
                      ),
                      const Gap(8),
                      const Text(
                        'Receipt Review',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Receipt Type',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(': LAP_Overdue', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const Gap(8),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Total Amount',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(': 100', style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const Gap(8),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Payment Mode',
                            ),
                          ),
                          Expanded(
                            child: Text(': CASH'),
                          ),
                        ],
                      ),
                      const Gap(8),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'PAN Number',
                            ),
                          ),
                          Expanded(
                            child: Text(': AFCHDIBF'),
                          ),
                        ],
                      ),
                      const Gap(16),
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: Colors.blue.shade900,
                        child: const Row(
                          children: [
                            Icon(
                              Icons.description,
                              color: Colors.white,
                            ),
                            Gap(8),
                            Expanded(
                              child: Text(
                                'Agreement Number - DGGDBJHUHBNDJK',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Gap(16),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'EMI',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(': 288'),
                          ),
                        ],
                      ),
                      const Gap(16),
                      const Row(
                        children: [
                          Expanded(
                            child: Text(
                              'AFC',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(': 300'),
                          ),
                        ],
                      ),
                      const Gap(16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        height: MediaQuery
            .of(context)
            .size
            .height * 0.90,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const CustomTextField(
                            text: "MICR No",
                          ),
                          const SizedBox(height: 16),
                          const CustomTextField(
                            text: "Bank Name",
                            isGrey: true,
                          ),
                          const SizedBox(height: 16),
                          const CustomTextField(
                            text: "Instrument No.",
                            isReq: true,
                          ),
                          const SizedBox(height: 16),
                          FileUploadWidget(
                            label: "* Instrument Image",
                            onFilesSelected: _handleFilesSelected,
                          ),

                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const CustomTextField(
                            text: "IFSC Code",
                            isReq: false,
                            isGrey: false,
                          ),
                          const SizedBox(height: 16),
                          const CustomTextField(
                            text: "Branch Name",
                            isReq: false,
                            isGrey: true,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            "* Instrument Date",
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
                                  "${pickedDate!.day}/${pickedDate!
                                      .month}/${pickedDate!.year}";
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: TextFormField(
                                controller: _dateController,
                                onChanged: (value) {
                                  setState(() {
                                    value = pickedDate.toString();
                                  });
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Date is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText:
                                  DateFormat('dd/MM/yyyy').format(DateTime.now()),
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
                          const SizedBox(height: 26),
                          // ElevatedButton(
                          //   onPressed: _fetchDetails,
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: _selectedFiles == null ||
                          //         _selectedFiles!.isEmpty
                          //         ? Colors.grey.shade100
                          //         : Colors.pink.shade800,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(6),
                          //     ),
                          //   ),
                          //   child: _isFetchingDetails
                          //       ? const SizedBox(
                          //     width: 16,
                          //     height: 16,
                          //     child: CircularProgressIndicator(
                          //       color: Colors.white,
                          //       strokeWidth: 2.0,
                          //     ),
                          //   )
                          //       : Text(
                          //     "Fetch Details",
                          //     style: TextStyle(
                          //       color: _selectedFiles == null ||
                          //           _selectedFiles!.isEmpty
                          //           ? Colors.grey.shade400
                          //           : Colors.white,
                          //       fontSize: 14,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter Remarks"),
                    SizedBox(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.7,
                      child: TextFormField(
                        maxLines: 2,
                        decoration: InputDecoration(
                          hintText: "Enter Reason",
                          hintStyle: Theme
                              .of(context)
                              .textTheme
                              .labelSmall,
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
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _showPreviewDialog();
                            }
                          },
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
        ),
      ),
    );
  }
}