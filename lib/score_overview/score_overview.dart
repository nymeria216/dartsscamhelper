import 'package:dartsscamhelper/score_overview/result_table.dart';
import 'package:dartsscamhelper/score_overview/user_score_table.dart';
import 'package:flutter/material.dart';

var firstPlayerName = "Max";
var secondPlayerName = "Ann";

class ScoreOverviewPage extends StatefulWidget {
  const ScoreOverviewPage({Key? key}) : super(key: key);

  @override
  State<ScoreOverviewPage> createState() => _ScoreOverviewPageState();
}

class _ScoreOverviewPageState extends State<ScoreOverviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results Overview Page")),
      body: const ScoreTable(),
    );
  }
}

class ScoreTable extends StatefulWidget {
  const ScoreTable({super.key});
  @override
  State<StatefulWidget> createState() => _ScoreTable();
}

class _ScoreTable extends State<ScoreTable> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: UserTable(
            playerName: firstPlayerName,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: UserTable(
            playerName: secondPlayerName,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 50.0),
          child: BothUserTable(
            firstPlayerName: firstPlayerName,
            secondPlayerName: secondPlayerName,
          ),
        ),
      ],
    );
  }
}
