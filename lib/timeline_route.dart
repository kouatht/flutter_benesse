import 'package:flutter/material.dart';
class TimeLine extends StatelessWidget {
  int x=10;
  int y=9;
  //final StopWatchTimer _stopWatchTimer = StopWatchTimer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ホーム"),
        backgroundColor: Colors.blue,// <- (※2)
      ),
      body: Center(child: Text("${x}") // <- (※3)
      ),
    );
  }
}
