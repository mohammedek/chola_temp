import 'package:flutter/material.dart';

class FormControllers {
  final TextEditingController mobileNoController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController MICRController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController instrumentController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController branchController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  void dispose() {
    mobileNoController.dispose();
    amountController.dispose();
    accountController.dispose();
    MICRController.dispose();
    bankController.dispose();
    instrumentController.dispose();
    ifscController.dispose();
    branchController.dispose();
    remarksController.dispose();
    dateController.dispose();
  }
}
