import 'package:flutter/material.dart';

class AppropriateUsePage extends StatelessWidget {
  const AppropriateUsePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Appropriate Use"),
      ),
      body: Center(
        child: Text(
          "Appropriate Use Content Goes Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
