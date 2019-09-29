import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'previewscreen.dart';
import 'package:image_picker/image_picker.dart';
import 'information.dart';



class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() {
    return _homescreenState();
  }
}

class _homescreenState extends State {

  CameraController controller;
  File imageFile;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {});
      } else {
        print("No camera available");
      }
    }).catchError((err) {
      print('Error: $err.code\nError Message: $err.message');
    });
  }

  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      _showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print("jhkjg,hjkjhfjghkhjhg");
    return Container(
        child: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: _cameraPreviewWidget(),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, right: 16),
                  child: FloatingActionButton(
                      heroTag: "profile",
                      child: Icon(
                        Icons.account_circle,
                        size: 50,
                      ),
                      backgroundColor: Colors.black26,
                      onPressed: () {Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => inforamtion(),
                        ),
                      );}),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(

                      height: 80.0,
                      width: 80.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: FloatingActionButton(
                          heroTag: "capture",
                          child: Icon(
                            Icons.camera_alt,
                            size: 40,
                          ),
                          backgroundColor: Colors.black.withOpacity(0.5),
                          onPressed: () {
                            _onCapturePressed(context);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 50.0,
                      width: 50.0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: FloatingActionButton(
                          heroTag: "upload",
                          child: Icon(Icons.file_upload),
                          backgroundColor: Colors.amber.withOpacity(0.6),
                          onPressed: () {
                            _selectGalleryImage();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ],
    ));
  }

  /// Display Camera preview.
  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  /// Display the control bar with buttons to take pictures

  /// Display a row of toggle to select the camera (or a message if no camera is available).





  void _onCapturePressed(context) async {
    // Take the Picture in a try / catch block. If anything goes wrong,
    // catch the error.
    try {
      // Attempt to take a picture and log where it's been saved
      final path = join(
        // In this example, store the picture in the temp directory. Find
        // the temp directory using the `path_provider` plugin.
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );
      print(path);
      await controller.takePicture(path);

      // If the picture was taken, display it on a new screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewImageScreen(imagePath: path),
        ),
      );
    } catch (e) {
      // If an error occurs, log the error to the console.
      print(e);
    }
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error: ${e.code}\nError Message: ${e.description}';
    print(errorText);

    print('Error: ${e.code}\n${e.description}');
  }

  _selectGalleryImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) {
      return ;
    }
    setState(() { Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewImageScreen(imagePath: imageFile.path),
      ),
    );});
  }
}
