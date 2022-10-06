import 'package:flutter/material.dart';

class BothUserTable extends StatefulWidget {
  const BothUserTable(
      {Key? key, required this.firstPlayerName, required this.secondPlayerName})
      : super(key: key);
  final String firstPlayerName;
  final String secondPlayerName;
  @override
  State<BothUserTable> createState() => _BothUserTable();
}

class _BothUserTable extends State<BothUserTable> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: const Text(
            'Players-Score',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
      DataTable(
        columns: [
          const DataColumn(
              label: Text('Throw',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text(widget.firstPlayerName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text(widget.secondPlayerName,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('0')),
            DataCell(Text('501')),
            DataCell(Text('501')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('501')),
            DataCell(Text('483')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('485')),
            DataCell(Text('450')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('435')),
            DataCell(Text('443')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('398')),
            DataCell(Text('401')),
          ]),
        ],
      ),
    ]);
  }
}
