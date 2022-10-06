import 'package:dartsscamhelper/doFlutter.dart';
import 'package:flutter/material.dart';

class HomePageFlutter extends StatelessWidget {
  const HomePageFlutter ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // pushes a new page about the current one
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
            return const DoFlutterPage();
          }));
        },
        child: const Text('Just doing something new'))
    );
  }
}