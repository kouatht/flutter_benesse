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
              icon: Icon(
                Icons.add_circle_outline,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PickPhoto()),
                );
              },
            ),
          ],
        ),
        body: ListView(
            children: List.generate(3, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePageDetail("images/$index.jpg")));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset("images/$index.jpg"),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text("$index.jpg"),
                        leading: Icon(Icons.person),
                        subtitle: Text("サブタイトル"),
                      )),
                ],
              ),
            ),
          );
        })));
  }
}

class PickPhoto extends StatefulWidget {
  @override
  _PickPhotoState createState() => _PickPhotoState();
}

class _PickPhotoState extends State<PickPhoto> {
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 100.0, horizontal: 50.0),
                    child: Text('写真を選択してください'),
                  )
                : Image.file(_image),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("ホーム"),
        ),
        body: ListView(
            children: List.generate(3, (index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MyHomePageDetail("images/$index.jpg")));
            },
            child: Card(
              child: Column(
                children: <Widget>[
                  Image.asset("images/$index.jpg"),
                  Container(
                      margin: EdgeInsets.all(10.0),
                      child: ListTile(
                        title: Text("$index.jpg"),
                        leading: Icon(Icons.person),
                        subtitle: Text("サブタイトル"),
                      )),
                ],
              ),
            ),
          );
        })));
  }
}

class MyHomePageDetail extends StatefulWidget {
  MyHomePageDetail(this._imageName);
  final String _imageName;
  @override
  _MyHomePageDetailState createState() =>
      new _MyHomePageDetailState(_imageName);
}

class _MyHomePageDetailState extends State<MyHomePageDetail> {
  _MyHomePageDetailState(this._imageName);
  final String _imageName;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("投稿の詳細"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Image.asset(_imageName),
              Container(
                child: ListTile(
                  title: Text(_imageName),
                  leading: Icon(Icons.person),
                  subtitle: Text("お写真ですこれは"),
                ),
              )
            ],
          ),
        ));
  }
}
