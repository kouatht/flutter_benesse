import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyPage(),
    ),
  );
}

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyPage> {
  var _selectedValue = 'マイページ';
  var _usStates = ["設定", "投稿", "友達"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade300,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'マイページ',
          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
        ),
        elevation: 0,
        actions: <Widget>[
          PopupMenuButton<String>(
            initialValue: _selectedValue,
            onSelected: (String s) {
              setState(() {
                _selectedValue = s;
              });
            },
            itemBuilder: (BuildContext context) {
              return _usStates.map((String s) {
                return PopupMenuItem(
                  child: Text(s),
                  value: s,
                );
              }).toList();
            },
          )
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Image.asset(
                      "images/mymelody.jpg",
                      height: 150,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('マイメロディ')
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.only(left: 78, right: 60, top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "6",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('投稿数')
                    ],
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '20',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('フォロワー')
                    ],
                  ),
                  Divider(
                    height: 10,
                    color: Colors.black,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '20',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('フォロー')
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                Divider(
                  height: 10,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50, right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Expanded(child: Image.asset('images/_0.jpeg')),
                    Expanded(child: Image.asset('images/_1.jpeg')),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
