import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/modules/agreements/web/select_receipt_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class OAgreementsPageWeb extends StatefulWidget {
  const OAgreementsPageWeb({super.key});

  @override
  State<OAgreementsPageWeb> createState() => _OAgreementsPageWebState();
}

class _OAgreementsPageWebState extends State<OAgreementsPageWeb> {
  final searchController = TextEditingController();
  final _searchformKey = GlobalKey<FormState>();
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

  bool searchValidation(element) =>
      element.toLowerCase().startsWith(searchController.text.toLowerCase()) ||
      element.toLowerCase().contains(searchController.text.toLowerCase());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ksecondaryColor.withOpacity(0.1),
      body: Padding(
        padding: EdgeInsets.all(ResponsiveSize().isWide(context) ? 8.0 : 0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              headerLayout(context),
              Container(
                color: kprimaryColor,
                height: ResponsiveSize().isWide(context)
                    ? !recentOAgreements.any(searchValidation)
                        ? 100
                        : 70
                    : !recentOAgreements.any(searchValidation)
                        ? 150
                        : 120,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Flex(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  direction: ResponsiveSize().isWide(context)
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text.rich(
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: whiteColor),
                            const TextSpan(text: "80+ ", children: [
                              TextSpan(text: "items", children: []),
                              TextSpan(
                                  text: "  • Updated a few seconds ago",
                                  children: []),
                            ])),
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Form(
                              key: _searchformKey,
                              child: TextFormField(
                                controller: searchController,
                                onChanged: (value) => setState(() {
                                  if (_searchformKey.currentState!.validate()) {
                                    filteredOAgreements = recentOAgreements
                                        .where(searchValidation)
                                        .toList();
                                  }
                                }),
                                validator: (value) {
                                  if (!recentOAgreements
                                      .any(searchValidation)) {
                                    return "Not Found";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: 'Search OAgreements',
                                  errorStyle:
                                      const TextStyle(color: whiteColor),
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: ResponsiveSize().isWide(context) ? 1 : 2,
                            child: SizedBox(
                              height:
                                  ResponsiveSize().isWide(context) ? 45 : 100,
                              child: Flex(
                                direction:

                                    //  ResponsiveSize().isWide(context)
                                    //     ?
                                    Axis.horizontal,
                                // : Axis.vertical,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        padding: EdgeInsets.zero,
                                        hint: const Icon(
                                          Icons.settings,
                                          color: blackColor,
                                        ),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: blackColor,
                                        ),
                                        items: const [
                                          // DropdownMenuItem(child: Text("data"))
                                        ],
                                        onChanged: (value) {},
                                      )),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                        padding: EdgeInsets.zero,
                                        hint: const Icon(
                                          Icons.calendar_month,
                                          color: blackColor,
                                        ),
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down,
                                          color: blackColor,
                                        ),
                                        items: const [
                                          // DropdownMenuItem(child: Text("data"))
                                        ],
                                        onChanged: (value) {},
                                      )),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.refresh,
                                        color: blackColor,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: const IntrinsicHeight(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Icon(
                                              CupertinoIcons.chart_pie_fill,
                                              color: blackColor,
                                            ),
                                            VerticalDivider(
                                              thickness: 2,
                                            ),
                                            Icon(
                                              Icons.filter_alt_rounded,
                                              color: blackColor,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              recentAgreements(
                  context, recentOAgreements.where(searchValidation).toList())
            ],
          ),
        ),
      ),
    );
  }

  Expanded recentAgreements(BuildContext context, List recentOAgreements) {
    return Expanded(
      child: recentOAgreements.isEmpty
          ? const SizedBox()
          : Column(
              children: [
                const Gap(10),
                const Divider(
                  height: 0,
                ),
                Container(
                  color: ksecondaryColor.withOpacity(0.2),
                  child: ListTile(
                    dense: true,
                    leading: const SizedBox.shrink(),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                    title: SizedBox(
                      height: 30,
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                padding: EdgeInsets.zero,
                                isExpanded: true,
                                hint: Text('Agreement Number',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: bold)),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: blackColor,
                                ),
                                items: const [
                                  // DropdownMenuItem(child: Text("data"))
                                ],
                                onChanged: (value) {},
                              )),
                            ),
                            const VerticalDivider(
                              thickness: 2,
                            ),
                            const Gap(25)
                          ],
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    separatorBuilder: (context, index) => const Divider(
                      height: 0,
                    ),
                    itemCount: recentOAgreements.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        title: Text(
                          recentOAgreements[index],
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: ksecondaryColor),
                        ),
                        leading: Text("${index + 1}"),
                        trailing: SizedBox(
                          width: 25,
                          height: 25,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                side: const BorderSide(color: lightGreyColor),
                                borderRadius: BorderRadius.circular(5)),
                            elevation: 2,
                            margin: EdgeInsets.zero,
                            shadowColor: Colors.grey,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: blackColor,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const SelectReceiptType()));
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
        ListTile(
          leading: Card(
            color: ksecondaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.book,
                color: whiteColor,
              ),
            ),
          ),
          title: Text(
            "OAgreements",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: bold, color: ksecondaryColor),
          ),
          subtitle: Row(
            children: [
              DropdownButtonHideUnderline(
                  child: DropdownButton(
                hint: Text(
                  "Recently Viewed ",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: bold,
                      ),
                ),
                icon: SizedBox(
                  width: 30,
                  height: 30,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(color: lightGreyColor),
                        borderRadius: BorderRadius.circular(5)),
                    elevation: 2,
                    margin: EdgeInsets.zero,
                    shadowColor: Colors.grey,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: blackColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                items: const [
                  // DropdownMenuItem(child: Text("data"))
                ],
                onChanged: (value) {},
              )),
              const Gap(16),
              SizedBox(
                width: 32,
                height: 30,
                child: Card(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: lightGreyColor),
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 2,
                  margin: EdgeInsets.zero,
                  shadowColor: Colors.grey,
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.pin_fill,
                        color: kprimaryColor,
                        size: 15,
                      )),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
