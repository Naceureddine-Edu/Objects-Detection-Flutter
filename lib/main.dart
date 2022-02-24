// @dart=2.9

import 'package:flutter/material.dart';
import 'package:projet_detection_object/MyHome.dart';
import 'package:camera/camera.dart' show CameraDescription, availableCameras;

List<CameraDescription> cameras="cameras" as List<CameraDescription>;

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: SplashScreen(),
      title: 'OBJECT DETECTION',

      home: MyHome(),
    );
  }
}

