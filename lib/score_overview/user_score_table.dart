import 'package:flutter/material.dart';

class UserTable extends StatefulWidget {
  const UserTable({Key? key, required this.playerName}) : super(key: key);
  final String playerName;

  // UserTable(this.playerName, {super.key})

  @override
  State<UserTable> createState() => _UserTable();
}

class _UserTable extends State<UserTable> {
  // late String playerName = this.playerName;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(
          margin: const EdgeInsets.only(bottom: 20.0),
          child: const Text(
            'Player Score',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )),
      DataTable(
        columns: [
          const DataColumn(
              label: Text('Throw',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
          DataColumn(
              label: Text(widget.playerName,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
        ],
        rows: const [
          DataRow(cells: [
            DataCell(Text('0')),
            DataCell(Text('501')),
          ]),
          DataRow(cells: [
            DataCell(Text('1')),
            DataCell(Text('501')),
          ]),
          DataRow(cells: [
            DataCell(Text('2')),
            DataCell(Text('485')),
          ]),
          DataRow(cells: [
            DataCell(Text('3')),
            DataCell(Text('435')),
          ]),
          DataRow(cells: [
            DataCell(Text('4')),
            DataCell(Text('398')),
          ]),
        ],
      ),
    ]);
  }
}
