import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../custom_text_feild.dart';

class PosMachineWidget extends StatefulWidget {
  const PosMachineWidget({super.key});

  @override
  _PosMachineState createState() => _PosMachineState();
}

class _PosMachineState extends State<PosMachineWidget> {
  DateTime? pickedDate;
  final TextEditingController _dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<PlatformFile>? _selectedFiles;

  String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

  void _handleFilesSelected(List<PlatformFile> files) {
    setState(() {
      _selectedFiles = files;
    });
    print('Selected files: ${files.map((file) => file.name).join(', ')}');
  }

  void _fetchDetails() {
    if (_selectedFiles == null || _selectedFiles!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please upload at least one file')),
      );
      return;
    }

    // Proceed with other operations after fetching details
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Details fetched successfully')),
    );
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
      child: SingleChildScrollView(
        child: SizedBox(
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
                          const Text(
                            "* Chola Bank",
                            style: TextStyle(fontSize: 14),
                          ),
                           TextFormField(
                            keyboardType: TextInputType.text,
                            enabled: false,
                            decoration: const InputDecoration(
                              hintText: 'Select Bank',
                              border: OutlineInputBorder(),
                              hintStyle: TextStyle(fontSize: 14),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 10,
                              ),
                              suffixIcon: Icon(Icons.arrow_drop_down_outlined),
                              suffixIconColor: Colors.grey,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Select a bank';
                              }
                              return null;
                            },
                          ),
                          const Gap(16),
                          const CustomTextField(
                            text: "TXN ID/RRN",
                            isReq: true,
                          ),
                          const Gap(10),
                          const Text("Txn/Ref Slip Upload"),
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
                                    onTap: () async {
                                      FilePickerResult? result = await FilePicker.platform.pickFiles(
                                        allowMultiple: false,
                                      );
                                      if (result != null) {
                                        _handleFilesSelected(result.files);
                                      }
                                    },
                                    child: Container(
                                      height: MediaQuery.sizeOf(context).height / 18,
                                      width: MediaQuery.sizeOf(context).shortestSide * 0.20,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black87),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const Icon(
                                            Icons.file_upload_outlined,
                                            color: Colors.pink,
                                            size: 18,
                                          ),
                                          Text(
                                            "Upload Files",
                                            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                              color: Colors.pink,
                                            ),
                                          ),
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
                            text: "Account No",
                            isReq: false,
                            isGrey: true,
                          ),
                          const Gap(16),
                          const Text(
                            "* Value Date",
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
                              child: TextFormField(
                                controller: _dateController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Date is required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: formattedDate,
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
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                _fetchDetails();
                              }
                            },
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
                padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter Remarks"),
                    SizedBox(
                      child: TextFormField(
                        expands: false,
                        maxLines: 2,
                        dragStartBehavior: DragStartBehavior.down,
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.streetAddress,
                        decoration: InputDecoration(
                          hintText: "Enter Reason",
                          hintStyle: Theme.of(context).textTheme.labelSmall,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 20,
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
