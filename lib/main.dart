import 'package:flutter/material.dart';
import 'screen/homescreen.dart';
import 'app_theme.dart';
import 'screen/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:camera/camera.dart';

List<CameraDescription> cameras;

Future<Null> main() async {
  cameras = await availableCameras();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');
  Widget _screen;
  if (seen == null || seen == false) {
    _screen = OnBoarding();
  } else {
    _screen = OnBoarding();
  }
  runApp(affat(_screen));
}

class affat extends StatelessWidget {
  final Widget _screen;

  affat(this._screen);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: this._screen,
    );
  }
}
