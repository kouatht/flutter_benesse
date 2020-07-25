import 'package:flutter/material.dart';
class settings extends StatelessWidget {
  int x=10;
  int y=9;
  //final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("設定"),
        backgroundColor: Colors.blue,// <- (※2)
      ),
      body: Center(child: Text("設定") // <- (※3)
      ),
    );
  }
}
