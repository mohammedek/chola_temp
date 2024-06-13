import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PaymentGatewayWidget extends StatefulWidget {
  const PaymentGatewayWidget({super.key});

  @override
  _PaymentGatewayWidgetState createState() => _PaymentGatewayWidgetState();
}

class _PaymentGatewayWidgetState extends State<PaymentGatewayWidget> {


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
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Container(
                 width: MediaQuery.sizeOf(context).width * 0.15,
                 height: MediaQuery.sizeOf(context).width * 0.03,
                 decoration:BoxDecoration(
                   border: Border.all(color: Colors.black),
                // image: const DecorationImage(image: AssetImage("assets/images/razor_pay_image.png"))
            ),
                 child: Image.asset("assets/images/razor_pay_image.png",fit: BoxFit.fitWidth,),
               ),
                // const Gap(16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    )
                  ),
                    onPressed: (){}, child: Text(
                  "Scan QR",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white
                  ))),
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
