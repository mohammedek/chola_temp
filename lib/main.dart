import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/core/theme.dart';
import 'package:chola_first/modules/eod/bank_form_screen.dart';
import 'package:chola_first/modules/reciptes/mobile_view.dart';
import 'package:chola_first/modules/reciptes/web_view.dart';
import 'package:chola_first/modules/vert_menu_list/app_layout.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:universal_platform/universal_platform.dart';
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
      theme: kIsWeb ? WebTheme.themeData : AppTheme.themeData,
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
  final int _currentIndex = 0;
  final int _selectedVertMenu = 1;

  DateTime? pickedDate;

  final TextEditingController _dateController = TextEditingController();

  bool isEOD = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabBarView.length, vsync: this);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      if(UniversalPlatform.isWeb) {
        return
          const WebView() ;
    } else if(UniversalPlatform.isMobile) {
      return const MobileView();
    }
      return
      UniversalPlatform.isAndroid ?
       const  MobileView() : const  WebView();
  }
}
