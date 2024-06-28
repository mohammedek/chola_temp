import 'package:chola_first/core/responsive.dart';
import 'package:flutter/material.dart';

class MainMenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  // ignore: overridden_fields
  final Key? key;
  final double height;
  final Widget? title;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  const MainMenuAppBar({
    this.key,
    required this.title,
    required this.height,
    required this.actions,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      excludeHeaderSemantics: true,
      title: !ResponsiveSize().isWide(context)
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
                title!,
              ],
            )
          : title,
      backgroundColor: Colors.white,
      actions: ResponsiveSize().isWide(context) ? actions : null,
      bottom: bottom,
    );
  }
}
