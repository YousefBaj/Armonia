/*
 * Copyright (c) 2019 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
 * distribute, sublicense, create a derivative work, and/or sell copies of the
 * Software in any work that is designed, intended, or marketed for pedagogical or
 * instructional purposes related to programming, coding, application development,
 * or information technology.  Permission for such use, copying, modification,
 * merger, publication, distribution, sublicensing, creation of derivative works,
 * or sale is expressly withheld.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'information.dart';

class PreviewImageScreen extends StatefulWidget {
  final String imagePath;

  PreviewImageScreen({this.imagePath});

  @override
  _PreviewImageScreenState createState() => _PreviewImageScreenState();
}

class _PreviewImageScreenState extends State<PreviewImageScreen> {
  File imageFile;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    imageFile = File(widget.imagePath);
    return Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        child: Image.file(File(widget.imagePath)),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 70.0,
                width: 70.0,
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 16),
                  child: FloatingActionButton(
                      heroTag: "cancel",
                      child: Icon(
                        Icons.cancel,
                        size: 25,
                      ),
                      backgroundColor: Colors.black26,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: FloatingActionButton(
                    heroTag: "post",
                    child: Icon(
                      Icons.file_upload,
                      size: 50,
                    ),
                    backgroundColor: Colors.black26,
                    onPressed: () {
                      _uploadImage();
                    }),
              )
            ],
          )
        ],
      )
//      Container(
//        child: Row(
//          children: <Widget>[
//            IconButton(
//              icon: Icon(Icons.arrow_back_ios),
//              onPressed: () {
//                Navigator.of(context).pop();
//              },
//            ),
////            Flexible(
////              flex: 1,
////              child: Container(
////                padding: EdgeInsets.all(60.0),
////                child: RaisedButton(
////                  onPressed: () {
////                    getBytesFromFile().then((bytes) {
////                      Share.file('Share via:', basename(widget.imagePath),
////                          bytes.buffer.asUint8List(), 'image/png');
////                    });
////                  },
////                  child: Text('Share'),
////                ),
////              ),
////            ),
//          ],
//        ),
//      ),
    ]);
  }

  _uploadImage() async {
    print(imageFile);
    if (imageFile == null) {
      return _showSnackbar('Please select image');
    }

    var baseUrl = 'http://192.168.8.162:5555';

    print("hi");
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = base64.encode(imageBytes);

    print(base64Image);
    Map<String, String> body = {
      "img": base64Image,
    };
   var response = await http.post(baseUrl, body: body);
    print(response.statusCode);


   if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => inforamtion(),
        ),
      );
    }
  }

  List<int> compress(List<int> bytes) {
    var image = img.decodeImage(bytes);
    var resize = img.copyResize(image);
    return img.encodePng(resize, level: 1);
  }

  _showSnackbar(String text) => scaffoldKey.currentState?.showSnackBar(
        new SnackBar(
          content: new Text(text),
        ),
      );
}
