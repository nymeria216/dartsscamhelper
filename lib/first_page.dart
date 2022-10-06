import 'package:camera/camera.dart';
import 'package:dartsscamhelper/choice_cam_or_gallery.dart';
import 'package:flutter/material.dart';
import 'camera_page.dart';


class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Page"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 40),
          ),
          onPressed: () async {
            await Navigator.push(
              context, MaterialPageRoute(builder: (_) => const CamOrGal()));
          }, child: const Text("Take a Picture"),),)
    );
  }
}


