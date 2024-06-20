import 'package:chola_first/constants/styles.dart';
import 'package:chola_first/modules/agreements/web/agreement_details.dart';
import 'package:chola_first/modules/agreements/web/select_receipt_type.dart';
import 'package:flutter/material.dart';

class AgreementsTable extends StatefulWidget {
  const AgreementsTable({super.key});

  @override
  _AgreementsTableState createState() => _AgreementsTableState();
}

class _AgreementsTableState extends State<AgreementsTable> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  final List<Map<String, dynamic>> _data = [
    for (int i = 0; i < 10; i++)
      {
        'Agreement Number': 'HE01DEI00000045245',
        'CIF ID': '9609101',
        'Customer': '7 CABALLO ENTERPRISES LLP',
        'DPD': 36,
        'EMI': '1,40,590.00',
        'Total EMI OD Amount': '2,81,190.00',
        'NPA': 'Regular',
        'Vertical': 'LAP',
        'Branch': 'DELHI FIVE A HE',
        'Created Date': '08/11/2023, 7:27 PM',
      },
    {
      'Agreement Number': 'HE01DEI00000025224',
      'CIF ID': '9609101',
      'Customer': '7 CABALLO ENTERPRISES LLP',
      'DPD': 36,
      'EMI': '3,70,399.00',
      'Total EMI OD Amount': '7,40,796.00',
      'NPA': 'Regular',
      'Vertical': 'LAP',
      'Branch': 'DELHI FIVE A HE',
      'Created Date': '08/11/2023, 7:28 PM',
    },
  ];

  void _sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField,
      int columnIndex, bool ascending) {
    _data.sort((a, b) {
      if (!ascending) {
        final Map<String, dynamic> c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  navigate() => Navigator.push(
      context, MaterialPageRoute(builder: (_) => const OAgreementDetails()));

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            showBottomBorder: true,
            decoration: BoxDecoration(color: ksecondaryColor.withOpacity(0.2)),
            dataTextStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontSize: 12, fontWeight: medium),
            columns: [
              const DataColumn(
                label: Text(''),
              ),
              DataColumn(
                label: const Text('Agreement Number'),
                onSort: (int columnIndex, bool ascending) => _sort<String>(
                    (d) => d['Agreement Number'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('CIF ID'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>((d) => d['CIF ID'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Customer'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>((d) => d['Customer'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('DPD'),
                numeric: true,
                onSort: (int columnIndex, bool ascending) =>
                    _sort<int>((d) => d['DPD'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('EMI'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>((d) => d['EMI'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Total EMI OD Amount'),
                onSort: (int columnIndex, bool ascending) => _sort<String>(
                    (d) => d['Total EMI OD Amount'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('NPA'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>((d) => d['NPA'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Vertical'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>((d) => d['Vertical'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Branch'),
                onSort: (int columnIndex, bool ascending) =>
                    _sort<String>((d) => d['Branch'], columnIndex, ascending),
              ),
              DataColumn(
                label: const Text('Created Date'),
                onSort: (int columnIndex, bool ascending) => _sort<String>(
                    (d) => d['Created Date'], columnIndex, ascending),
              ),
            ],
            rows: _data.map((data) {
              return DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                    (Set<MaterialState> states) {
                      return whiteColor; // Use default value for the rest
                    },
                  ),
                  cells: [
                    DataCell(Text(
                      (_data.indexOf(data) + 1).toString(),
                    )),
                    DataCell(
                        onTap: navigate,
                        Text(
                          data['Agreement Number'],
                          style: const TextStyle(color: blueColor),
                        )),
                    DataCell(Text(data['CIF ID'])),
                    DataCell(
                        onTap: navigate,
                        Text(
                          data['Customer'],
                          style: const TextStyle(color: blueColor),
                        )),
                    DataCell(Text(data['DPD'].toString())),
                    DataCell(Text(data['EMI'])),
                    DataCell(Text(data['Total EMI OD Amount'])),
                    DataCell(Text(data['NPA'])),
                    DataCell(Text(data['Vertical'])),
                    DataCell(
                        onTap: navigate,
                        Text(
                          data['Branch'],
                          style: const TextStyle(color: blueColor),
                        )),
                    DataCell(Text(data['Created Date'])),
                  ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
