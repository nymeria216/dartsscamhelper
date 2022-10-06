import 'package:animated_background/animated_background.dart';
import 'package:camera/camera.dart';
import 'package:dartsscamhelper/from_gallery_page.dart';
import 'package:dartsscamhelper/score_overview/score_overview.dart';
import 'package:flutter/material.dart';
import 'camera_page.dart';

class CamOrGal extends StatefulWidget {
  const CamOrGal({Key? key}) : super(key: key);

  @override
  State<CamOrGal> createState() => _HomePageState();
}

class _HomePageState extends State<CamOrGal> with SingleTickerProviderStateMixin{
  
  // definition of ParticlesOptions.
  // ParticleOptions particles = const ParticleOptions(
  //   baseColor: Colors.red,
  //   spawnOpacity: 0.0,
  //   opacityChangeRate: 0.25,
  //   minOpacity: 0.1,
  //   maxOpacity: 0.4,
  //   particleCount: 70,
  //   spawnMaxRadius: 15.0,
  //   spawnMaxSpeed: 100.0,
  //   spawnMinSpeed: 30,
  //   spawnMinRadius: 7.0,
  //   image: Image(image: AssetImage('assets/icons/pfeile.jpg')),
  // );
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Choose between Gallery and Camera")),
        body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
            options: const ParticleOptions(
               spawnMaxRadius: 50,
              spawnMinSpeed: 10.00,
              particleCount: 68,
              spawnMaxSpeed: 50,
              minOpacity: 0.3,
              spawnOpacity: 0.4,
             // baseColor: Colors.red,
              image: Image(image: AssetImage('assets/icons/pfeile.jpg')),
            )
          ),
          vsync: this,
          child: const Center(child: Text(' '),),),
    //     body: AnimatedBackground(vsync: this,
    //     behaviour: RandomParticleBehaviour(options: particles),
    //     child: const Center(child: Text(
    //       "",
    //       style: TextStyle(fontSize: 50,
    //     )),
    //   ),
    // ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            margin: const EdgeInsets.all(100.0),
            
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
                const SizedBox(
                  height: 50.0,
                  width: 250.0,
                ),
                MaterialButton(
                  color: Colors.red,
                  child: const Text("Take Image by Camera",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CameraPage(cameras: value))));
                  },
                ),
                MaterialButton(
                  color: Colors.red,
                  child: const Text("Pick Image from Gallery",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () async {
                    await availableCameras().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const GalleryPage())));
                  },
                ),
              ],
            ),
          // ),
          // MaterialButton(onPressed:() async {
          // },)
        )));
    // floatingActionButton: Row(
    //     child: const Text("Take a Picture"),
    // )
  }
}
