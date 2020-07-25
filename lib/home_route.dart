import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タイムライン'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('右上のプラスボタンから追加'),
      ),
    );
  }
}

//class SecondRoute extends StatelessWidget {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("投稿画面"),
//      ),
//      body: Center(
//        child: Column(
//          children: <Widget>[
//            Image.asset(
//              'images/noteImage.jpg',
//            ),
//            FlatButton(
//              onPressed: (){
//                //TODO Upload image from library;
//              },
//              child: Icon(
//                Icons.photo_camera
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(30.0),
//              child: TextField(
//                enabled: true,
//              ),
//            ),
//            RaisedButton(
//              onPressed: () {
//                //TODO Save command
//                Navigator.pop(context);
//              },
//              child: Text('保存'),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

//class ThirdRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Third Route"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go second'),
//        ),
//      ),
//    );
//  }
//}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿画面'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            _image == null
                ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 50.0),
                  child: Text('写真を選択してください'),
                )
                : Image.file(_image),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "概要など",
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                //TODO Save command
                Navigator.pop(context);
              },
              child: Text('保存'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}