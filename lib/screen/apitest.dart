import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;
import 'package:image/image.dart' as img;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File imageFile;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  static const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Upload image'),
      ),
      body: new Column(
        children: <Widget>[
          _buildPreviewImage(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildPreviewImage() {
    return new Expanded(
      child: new Card(
        elevation: 3.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(
            new Radius.circular(4.0),
          ),
        ),
        child: new Stack(
          children: <Widget>[
            new Container(
              constraints: new BoxConstraints.expand(),
              child: imageFile == null
                  ? new Image.asset('assets/bg.png', colorBlendMode: BlendMode.darken, color: Colors.black26, fit: BoxFit.cover)
                  : new Image.file(imageFile, fit: BoxFit.cover),
            ),
            new Align(
              alignment: AlignmentDirectional.center,
              child: imageFile == null
                  ? new Text(
                'No selected image',
                style: Theme.of(context).textTheme.title,
              )
                  : new Container(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.camera),
            onPressed: _takePhoto,
            tooltip: 'Take photo',
          ),
          new IconButton(
            icon: Icon(Icons.file_upload),
            onPressed: _uploadImage,
            tooltip: 'Upload image',
          ),
          new IconButton(
            icon: Icon(Icons.image),
            onPressed: _selectGalleryImage,
            tooltip: 'Select from gallery',
          ),
        ],
      ),
    );
  }

  _takePhoto() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  _showSnackbar(String text) => scaffoldKey.currentState?.showSnackBar(
    new SnackBar(
      content: new Text(text),
    ),
  );

  _uploadImage() async {
    if (imageFile == null) {
      return _showSnackbar('Please select image');
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new Center(
          child: new CircularProgressIndicator(),
        );
      },
      barrierDismissible: false,
    );

    try {
      print("yousef");
      final url = Uri.parse('$baseUrl');
      final fileName = path.basename(imageFile.path);
      final bytes = await compute(compress, imageFile.readAsBytesSync());

      var request = http.MultipartRequest('POST', url)
        ..files.add(
          new http.MultipartFile.fromBytes(
            'image',
            bytes,
            filename: fileName,
          ),
        );

      var response = await request.send();
      var decoded = await response.stream.bytesToString().then(json.decode);
      print(response.statusCode);
      Navigator.pop(context);
      if (response.statusCode == HttpStatus.OK) {
        _showSnackbar('Image uploaded, imageUrl = $baseUrl/${decoded['path']}');
      } else {
        _showSnackbar('Image failed: ${decoded['message']}');
      }
    } catch (e) {
      Navigator.pop(context);
      _showSnackbar('Image failed: $e');
    }
  }

  _selectGalleryImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }
}

List<int> compress(List<int> bytes) {
  var image = img.decodeImage(bytes);
  var resize = img.copyResize(image,width: 400,height: 400);
  return img.encodePng(resize, level: 1);
}