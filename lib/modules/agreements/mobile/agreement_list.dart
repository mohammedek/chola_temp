import 'package:chola_first/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OAgreementsPage extends StatefulWidget {
  const OAgreementsPage({super.key});

  @override
  State<OAgreementsPage> createState() => _OAgreementsPageState();
}

class _OAgreementsPageState extends State<OAgreementsPage> {
  final searchController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
  List<String> filteredOAgreements = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            headerLayout(context),
            if (searchController.text.isEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                ],
              ),
            recentAgreements(
                context,
                recentOAgreements
                    .where((element) => element
                        .toLowerCase()
                        .startsWith(searchController.text.toLowerCase()))
                    .toList())
          ],
        ),
      ),
    );
  }

  Expanded recentAgreements(BuildContext context, List recentOAgreements) {
    return Expanded(
      child: Column(
        children: [
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
        if (recentOAgreements.isNotEmpty)
          Form(
            key: _formKey,
            child: TextFormField(
              controller: searchController,
              onChanged: (value) => setState(() {
                if (value.isNotEmpty) {
                  if (recentOAgreements.any((element) => (element
                      .toLowerCase()
                      .startsWith(value.toLowerCase())))) {
                    _formKey.currentState!.validate();

                    filteredOAgreements = recentOAgreements
                        .where((element) => element
                            .toLowerCase()
                            .startsWith(value.toLowerCase()))
                        .toList();
                  } else {
                    _formKey.currentState!.validate();
                  }
                }
              }),
              validator: (value) {
                if (!recentOAgreements.any((element) =>
                    (element.toLowerCase().startsWith(value!.toLowerCase())))) {
                  return "Not Found";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Search OAgreements',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
