import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback and Suggestions"),
      ),
      body: Center(
        child: Text(
          "Feedback and Suggestions Content Goes Here",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
