import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:projet_detection_object/main.dart' show cameras;


class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool isWorking = false;
  String result="";
  late CameraController cameraController;
  late CameraImage imgCamera;


  initCamera(){
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((value)
    {
      if(!mounted)
        {
          return;
        }
      setState(() {
        cameraController.startImageStream((imageFromStream) =>
        {
          if(!isWorking)
          {
            isWorking = true,
            imgCamera = imageFromStream,
          }
        }
        );
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/3.jpg")
              ),
            ),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 320,
                    width: 330,
                    child: Image.asset("assets/1.jpg"),
                    
                  ),
                ),
                Center(
                  child: FlatButton(
                    onPressed: () {
                      initCamera();
                    },
                    child: Container(
                      margin: EdgeInsets.only(top:35),
                      height: 270,
                      width: 360,
                      child: imgCamera == null
                          ? Container(
                              height: 270,
                              width: 360,
                              child: Icon(Icons.photo_camera_front, color: Colors.blueAccent, size: 40,),


                      )
                          : AspectRatio(
                              aspectRatio: cameraController.value.aspectRatio,
                              child: CameraPreview(cameraController),
                      ),
                    ),
                  ),
                )

              ],
            ),

          ),

        ),
        ),
      );



  }
}
