import 'package:flutter/material.dart';

class PrivacyAndSafetyPage extends StatelessWidget {
  const PrivacyAndSafetyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy and Safety"),
      ),
      body: Center(
        child: Text(
          "Privacy and Safety Content Goes Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
