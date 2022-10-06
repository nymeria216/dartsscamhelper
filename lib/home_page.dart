import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:dartsscamhelper/choice_cam_or_gallery.dart';
import 'package:dartsscamhelper/second_page.dart';
import 'package:dartsscamhelper/score_overview/score_overview.dart';
import 'package:flutter/material.dart';
import 'package:dartsscamhelper/camera_page.dart';
import 'package:animated_background/animated_background.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'first_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home Page")),
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
            //baseColor: Color.fromARGB(255, 212, 75, 114),
            image: Image(image: AssetImage('assets/icons/pfeile.jpg')),
          )),
          vsync: this, 
          child: const Text(" "),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.red,
          //  color: const Color.fromARGB(0, 231, 192, 34.0),
          items: const [
            Icon(Icons.home, size: 30.0, semanticLabel: 'Home'),
            ImageIcon(
              // image to icon
              size: 35.0,
              semanticLabel: 'Game',
              AssetImage(
                'assets/icons/darts_icon.png',
              ),
            ),
            // Icon(Icons.track_changes, size: 30),
            Icon(
              Icons.person,
              size: 30.0,
              semanticLabel: 'Profile',
            ),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        // burger/ side navigation bar
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                    //color: Color.fromARGB(255, 227, 85, 85)
                    gradient: LinearGradient(
                        colors: <Color>[Colors.lightBlue, Colors.red])),
                child: Text("Navigation"),
              ),
              ListTile(
                title: const Text("First Page"),
                tileColor: const Color.fromARGB(255, 227, 85, 85),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                  );
                },
              ),
              ListTile(
                title: const Text("Second Page"),
                tileColor: const Color.fromARGB(255, 62, 156, 214),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
              ),
            ],
          ),
        ));
  }
}