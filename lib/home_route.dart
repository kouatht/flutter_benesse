import 'package:flutter/material.dart';

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
                  MaterialPageRoute(builder: (context) => SecondRoute()),
                );
              },
            ),
          ],
        ),
        body: ListView(
            children: List.generate(3, (index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePageDetail("images/$index.jpg")));
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
            }))
    );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("投稿画面"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/noteImage.jpg',
            ),
            FlatButton(
              onPressed: (){
                //TODO Upload image from library

              },
              child: Icon(
                  Icons.photo_camera
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                enabled: true,
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
    );
  }
}
class ThirdRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go second'),
        ),
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
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePageDetail("images/$index.jpg")));
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
  _MyHomePageDetailState createState() => new _MyHomePageDetailState(_imageName);
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