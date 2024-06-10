import 'package:flutter/material.dart';

class BankingWidget extends StatefulWidget {
  const BankingWidget(String e, {super.key});

  @override
  State<BankingWidget> createState() => _BankingWidgetState();
}

class _BankingWidgetState extends State<BankingWidget> {
  DateTime? pickedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.90,
      width:MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  flex:3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      Text(
                        "* Account No",
                        style: TextStyle(fontSize: 14),
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Account No',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("* MICR No", style: TextStyle(fontSize: 14)),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'MICR No',
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("* Bank Name", style: TextStyle(fontSize: 14)),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Bank Name',
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Text("* Id", style: TextStyle(fontSize: 14)),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'ID',
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
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
                      const SizedBox(height: 102),
                      const Text(
                        "* IFSC Code",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'IFSC Code',
                          border: OutlineInputBorder(),
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "*Branch Name",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 6),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Branch Name',
                          hintStyle: TextStyle(fontSize: 14),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "* Instrument Date ",
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
                            decoration: const InputDecoration(
                              hintText: "Date",
                              hintStyle: TextStyle(fontSize: 14),
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.date_range),
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle fetch details action here
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.7,
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
