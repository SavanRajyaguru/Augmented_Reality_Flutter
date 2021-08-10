import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'package:flutter/material.dart';

const apikey =
    "2a84720f55b2c7a4196ac31667f47cd2225f6ab6f467fa32ddbc75f949633eec2c3f467153bac4fb";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  CameraDeepArController cameraDeepArController;
  int effectCount = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Snepchat filter"),
        ),
          body: Stack(
        children: [
          CameraDeepAr(
              onCameraReady: (isReady) {
                setState(() {});
              },
              onImageCaptured: (path) {
                setState(() {});
              },
              onVideoRecorded: (path) {
                setState(() {});
              },
              androidLicenceKey: apikey,
              iosLicenceKey: apikey,
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              }),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: EdgeInsets.all(20),
                  child: FloatingActionButton(
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.navigate_next),
                      onPressed: () => {
                            cameraDeepArController.changeMask(effectCount),
                            if (effectCount == 7) {effectCount = 0},
                            effectCount++
                          })))
        ],
      )),
    );
  }
}
