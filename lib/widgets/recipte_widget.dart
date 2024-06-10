import 'package:chola_first/widgets/chalan_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/name_lists.dart';

class RecipteWidget extends StatefulWidget {
  const RecipteWidget({super.key});

  @override
  State<RecipteWidget> createState() => _RecipteWidgetState();
}

class _RecipteWidgetState extends State<RecipteWidget> {

  int _selectedVertMenu = 1;


  DateTime? pickedDate;


  bool isEOD = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: menuList
          .map((e) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: InkWell(
          onTap: () => setState(() {
            if (menuList.indexOf(e) != 0) {
              setState(() {
                _selectedVertMenu = menuList.indexOf(e);
              });
            }
          }),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              menuList.indexOf(e) == 0
                  ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.0),
                child: Icon(Icons.menu_rounded),
              )
                  : const SizedBox.shrink(),
              Text(
                e.toString(),
                style: TextStyle(
                  fontSize: menuList.indexOf(e) == 0 ? 20 : 14,
                  color: Colors.black54,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              menuList.indexOf(e) == 0
                  ? const SizedBox()
                  : InkWell(
                child: menuList.indexOf(e) == 9
                    ? const Icon(Icons.arrow_drop_down, size: 28)
                    : const Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 28),
                onTap: () async {
                  if (menuList.indexOf(e) == 7) {
                    return showCupertinoDialog(
                        context: context,
                        builder: (context) => SizedBox(
                          height: MediaQuery.of(context)
                              .size
                              .height *
                              0.70,
                          width: MediaQuery.of(context)
                              .size
                              .width,
                          child: AlertDialog(
                            backgroundColor: Colors.white,
                            content: const ChalanPopup(),
                            scrollable: true,
                            actions: [
                              Container(
                                height: 2,
                                color: Colors.black45,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(
                                    top: 8.0),
                                child: ElevatedButton(
                                    style: ElevatedButton
                                        .styleFrom(
                                      backgroundColor: Colors
                                          .pink.shade800,
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    )),
                              )
                            ],
                          ),
                        ));
                  } else if (menuList.indexOf(e) == 6) {
                    setState(() {
                      isEOD = true;
                    });
                  } else {
                    setState(() {
                      isEOD = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ))
          .toList(),
    );
  }
}
