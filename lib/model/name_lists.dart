import 'package:chola_first/modules/reciptes/controllers.dart';

List<String> menuList = [
  'OAgrements',
  'ORMR Report',
  'OReceipts',
  'OBatches',
  'OChallans',
  'OEOD DCR',
  'OApprovels',
  'OAllocations',
  'More'
];
FormControllers formControllers = FormControllers();
List<String> tabBarView = [
  "Cheque",
  "Cash",
  "Draft",
  "RTGS",
  "POS Machine",
  "Payment Gateway"
];
List<String> typeList = [
  "CUSTOMER",
  "REMITTER",
];
List<String> agreementList = [
  "OContract Recordings",
  "New Receipt",
  "Customer Pay",
];

List<String> tabBarMobileView = ["Cash", "Cheque", "Draft", "Payment Gateway"];
List<String> customerRemiter = ["Customer", "Remiter"];

List<List<String>> tableData = [
  ["Item", "Overdue", "Actuals"],
  ["EMI", "1470104", ""],
  ["AFC", "23879", ""],
  ["CBC", "0", ""],
  ["FVC", "0", ""],
  ["Advance EMI", "0", ""],
  ["DRT/Legal/Others", "0", ""],
  ["Add Other Changes", "", ""],
  ["Total", "0", "0"],
];
