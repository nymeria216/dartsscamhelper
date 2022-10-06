import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => GalleryPageState();
  
}

enum MediaType {
  image,
  video;
}

class GalleryPageState extends State<GalleryPage>  with TickerProviderStateMixin {
  MediaType _mediaType = MediaType.image;


  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Image & Video Picker example"),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ChoiceChip3D(
                    //   style: ChoiceChip3DStyle.white,
                    //   selected: _mediaType == MediaType.image,
                    //   onSelected: () {
                    //     setState(() {
                    //       _mediaType = MediaType.image;
                    //     });
                    //   },
                    //   onUnSelected: () {},
                    //   height: 50,
                    //   child: const Text(
                    //     "Image",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // ),
                    
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 40),
                      ), 
                      child: const Text("video")
                    ),
                    //const Spacer(), // maximum place between boxes
                    // place between boxes
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {}, 
                      style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 40),
                      ), 
                      child: const Text("image")
                    )
                    // MaterialButton(  
                    //   color: Colors.red,
                    //   child: const Text('video', 
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //     fontSize: 10.0),),  
                    //   onPressed: () {},  
                    // )

                    // ChoiceChip3D(
                    //   style: ChoiceChip3DStyle.white,
                    //   selected: _mediaType == MediaType.video,
                    //   onSelected: () {
                    //     setState(() {
                    //       _mediaType = MediaType.video;
                    //     });
                    //   },
                    //   onUnSelected: () {},
                    //   height: 50,
                    //   child: const Text(
                    //     "Video",
                    //     style: TextStyle(color: Colors.black),
                    //   ),
                    // )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                (imagePath != null)
                    ? Image.file(File(imagePath!))
                    : Container(
                        width: 250,
                        height: 250,
                        color: Colors.grey[300],
                        child: const Icon(Icons.picture_in_picture_alt_outlined),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            pickMedia(ImageSource.gallery);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.image,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Gallery",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          )),
                        ),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.grey,
                            shadowColor: Colors.grey[400],
                            elevation: 10,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(8.0)),
                          ),
                          onPressed: () {
                            pickMedia(ImageSource.camera);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  Icons.camera_alt,
                                  size: 30,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Camera",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            )),
      )),
    );
  }

  void pickMedia(ImageSource source) async {
    XFile? file;
    if (_mediaType == MediaType.image) {
      file = await ImagePicker().pickImage(source: source);
    } else {
      file = await ImagePicker().pickVideo(source: source);
    }
    if (file != null) {
      imagePath = file.path;
      if (_mediaType == MediaType.video) {
        imagePath = await VideoThumbnail.thumbnailFile(
            video: file.path, quality: 100, maxWidth: 300, maxHeight: 300);
      }
      setState(() {});
    }
  }
}
