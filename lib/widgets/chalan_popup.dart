import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ChalanPopup extends StatefulWidget {
  const ChalanPopup({super.key});

  @override
  _ChalanPopupState createState() => _ChalanPopupState();
}


class _ChalanPopupState extends State<ChalanPopup> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 1.2,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Select an option',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                child: RadioListTile(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  contentPadding: const EdgeInsets.all(0),
                  dense: false,
                  title: const Text('Part_Payment_Tenure Reduction'),
                  value: 1,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 40,
                child: RadioListTile(
                  contentPadding: const EdgeInsets.all(0),
                  dense: false,
                  title: const Text('Part_Payment_EMI Reduction'),
                  value: 2,
                  groupValue: selectedValue,
                  onChanged: (int? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  },
                ),
              ),
              const SizedBox(height: 16),
              const Text("* Part Payment Amount"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '100000',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text("* Part Payment Charges in Percentage(Applicable)"),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '5',
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: '5',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Part Payment Charges in Percentage(Actual)"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: '4',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Justification"),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'OK',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Upload Consent Letter Image"),
              DottedBorder(
                borderType: BorderType.Rect,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.upload,
                          color: Colors.pink.shade800,
                        ),
                        label: Text(
                          'Upload Files',
                          style: TextStyle(
                            color: Colors.pink.shade800,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text('Or'),
                      const SizedBox(
                        width: 8,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'drop Files',
                            style: TextStyle(
                              color: Colors.pink.shade800,
                            ),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text('Screenshot (6).png'),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade800,
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Customer Consent Letter',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
