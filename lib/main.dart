import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/core/theme.dart';
import 'package:chola_first/eod/bank_form_screen.dart';
import 'package:chola_first/reciptes/mobile_view.dart';
import 'package:chola_first/reciptes/web_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;

import 'model/name_lists.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chola Collections',
      theme: AppTheme.themeData,
      home: const CholaInitial(),
    );
  }
}

class CholaInitial extends StatefulWidget {
  const CholaInitial({super.key});

  @override
  State<CholaInitial> createState() => _CholaInitialState();
}

class _CholaInitialState extends State<CholaInitial>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentIndex     = 0;
  final int _selectedVertMenu = 1;

        DateTime? pickedDate;

  final TextEditingController _dateController = TextEditingController();

  bool isEOD = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabBarView.length, vsync: this);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      if (ResponsiveSize().isWide(context)) {
        return const WebView();
      } else {
        return const MobileView();
      }
    } else {
      if (ResponsiveSize().isWide(context) || kIsWeb) {
        return const WebView();
      } else {
        return const MobileView();
      }
    }
  }
}
