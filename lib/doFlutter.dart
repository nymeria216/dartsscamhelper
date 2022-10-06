import 'package:flutter/material.dart';

class DoFlutterPage extends StatefulWidget {
  const DoFlutterPage({super.key});

  @override
  State<DoFlutterPage> createState() => _DoFlutterPage();
}

class _DoFlutterPage extends State<DoFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('doing Flutter'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
          Navigator.of(context).pop();
        },
        // arrow back to page before 
        icon: const Icon(Icons.arrow_back_ios)), 
        actions: [IconButton(onPressed: () {
          debugPrint('actions');
        }, 
        icon: const Icon(
          Icons.info_outline))]
      ),
      body: SingleChildScrollView(
        child: Column(
          // children used to put multiple widgets inside
          children: [
            // adding picture/ image
            Image.asset('assets/icons/Flutter.png'),
            const SizedBox(height: 10,),
            const Divider(color: Colors.black,),
            Container(
              margin: const EdgeInsets.all(10.0),
              padding: const EdgeInsets.all(10.0),
              color: Colors.blueGrey,
              width: double.infinity,
              child: const Center(
                child: Text('dummy text',
                style: TextStyle(
                  color: Colors.white),),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: isSwitch ? Colors.red : Colors.blue,
              ),
              onPressed: () {
                debugPrint('Elevated Button');
            }, child: const Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {
                debugPrint('Outlined Button');
            }, child: const Text('Outlined Button'),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Text Button');
            }, child: const Text
            ('Text Button'),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap:() {
                debugPrint('This is the row');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // space is between all widgets
                children: const [
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.blue,
                    ),
                    Text('Row widget'),
                    Icon(
                      Icons.local_fire_department,
                        color: Colors.blue,
                    ),
                  ],
                ),
            ),
            Switch(
              value: isSwitch, 
              onChanged: (bool newBool) {
                setState(() {
                  isSwitch = newBool; 
                });
            }),
            Checkbox(
              value: isCheckbox, 
              onChanged: (
                bool? newBool
              ) {
                setState(() {
                  isCheckbox = newBool;
                });
              }),
              Image.network('https://www.a-zdarts.com/mm5/graphics/00000001/steeldarts/15-200214.jpg')
            ],
          ),
      ),               
      );
  }
}