import 'package:chola_first/core/responsive.dart';
import 'package:chola_first/core/theme.dart';
import 'package:chola_first/eod/bank_form_screen.dart';
import 'package:chola_first/reciptes/mobile_view.dart';
import 'package:chola_first/reciptes/web_view.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      theme: ThemeData(
        cardTheme: CardTheme(
            surfaceTintColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            shadowColor: Colors.transparent),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.transparent,
            // background: Colors.white,
            primary: Colors.pink.shade800,
            secondary: Colors.blue.shade800),
        inputDecorationTheme: InputDecorationTheme(
          alignLabelWithHint: true,
          fillColor: Colors.white,
          filled: true,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        useMaterial3: false,
      ),
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
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (ResponsiveSize().isWide(context)) {
      return const WebView();
    } else {
      return const MobileView();
    }
  }
}
