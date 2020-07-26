import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

var list_name=["There is","１次関数","アジア","助動詞","合同条件","歴史","電流","確率","漢字","接続詞"];
var sub_name=["2020/7/22","2020/7/15","2020/7/10","2020/7/1","2020/6/22","2020/6/15","2020/5/25","2020/5/22","2020/5/11","2020/5/4"];
var color_list=[Colors.grey,Colors.blue,Colors.red,Colors.grey,Colors.blue,Colors.lime,Colors.purple,Colors.blue,Colors.green,Colors.grey];


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('タイムライン'),
        backgroundColor: Colors.pink.shade300,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle_outline, color: Colors.white,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PickPhoto()),
              );
            },
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(9, (index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePageDetail("images/_$index.jpeg")));
              },
              child: Card(
                color: color_list[index+1],
                child: Column(
                  children: <Widget>[
                    Image.asset("images/${index+1}.jpg"),
                    Container(
                        margin: EdgeInsets.all(10.0),
                        child: ListTile(
                          title: Text(list_name[index+1]),
                          subtitle: Text(sub_name[index+1]),
                        )),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
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
  final controller = TextEditingController();
  var _message;
  @override
  void initState() {
    _message = 'コメントを入力';
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("投稿の詳細"),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child:Image.asset(_imageName),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Flower: 上手にまとめてるよ！！',
                  style: TextStyle(fontSize:15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'KH: これはすごいわ',
                  style: TextStyle(fontSize:15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  _message,
                  style: TextStyle(fontSize:15.0,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  controller: controller,
                  style: TextStyle(fontSize:15.0,
                      color: const Color(0xFFFF0000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
              ),
              FlatButton(
                  padding: EdgeInsets.all(10.0),
                  color: Colors.lightBlueAccent,
                  child: Text(
                    "Send",
                    style: TextStyle(fontSize:20.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w400,
                        fontFamily: "Roboto"),
                  ),
                  onPressed: buttonPressed
              ),
            ],
          ),
        ));
  }
  void buttonPressed(){
    setState((){
      _message = 'Light: ' + controller.text;
    });
  }
}