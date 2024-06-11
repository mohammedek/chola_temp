import 'package:chola_first/constants/colors.dart';
import 'package:flutter/material.dart';

class OAgreementsPage extends StatelessWidget {
  final List<String> recentOAgreements = [
    "HE01100000054477",
    "HE01AAJ00000034292",
    "HE01100000058036",
    "HE016950000014351",
    "HE01AAJ00000034276",
    "HE01AAJ00000041667",
    "HE01AAA00000022384",
    "HE01AAA00000029217",
    "HE01AAA00000019579",
  ];

  OAgreementsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headerLayout(context),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 5,
                ),
                itemCount: recentOAgreements.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: kprimaryColor.withOpacity(0.1),
                    dense: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    title: Text(recentOAgreements[index]),
                    onTap: () {
                      // Handle agreement tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column headerLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "OAgreements",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: bold, color: ksecondaryColor),
        ),
        const Divider(
          color: kprimaryColor,
          thickness: 2,
        ),
        TextField(
          decoration: InputDecoration(
            hintText: 'Search OAgreements',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Text('Lists',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: bold)),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.menu),
          horizontalTitleGap: 0,
          title: const Text('LAP'),
          onTap: () {},
        ),
        const Divider(),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("All Lists"),
          onTap: () {},
        ),
        Divider(
          thickness: 8,
          color: Colors.grey.shade200,
        ),
        Container(
          color: whiteColor,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Recent OAgreements',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: bold)),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
