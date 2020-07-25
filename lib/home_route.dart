import 'package:flutter/material.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
        backgroundColor: Colors.blue,// <- (※2)
      ),
      body: Center(child: Text("ホーム") // <- (※3)
      ),
    );
  }
}
