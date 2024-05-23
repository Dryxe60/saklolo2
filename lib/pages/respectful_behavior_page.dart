import 'package:flutter/material.dart';

class RespectfulBehaviorPage extends StatelessWidget {
  const RespectfulBehaviorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Respectful Behavior"),
      ),
      body: Center(
        child: Text(
          "Respectful Behavior Content Goes Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
