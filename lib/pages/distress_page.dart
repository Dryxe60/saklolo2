import 'package:flutter/material.dart';

class DistressPage extends StatelessWidget {
  final String userName;

  DistressPage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DISTRESS SIGNAL"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Client Name: ${userName}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Alerting nearby Emergency Stations",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Please Wait for Emergency Services",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.warning,
              color: Colors.black,
              size: 50,
            ),
          ],
        ),
      ),
    );
  }
}
