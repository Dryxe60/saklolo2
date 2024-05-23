import 'dart:async';
import 'package:flutter/material.dart';
import 'package:saklolo2/pages/distress_page.dart';
import 'package:saklolo2/pages/home_page.dart'; // Import the home page

class DistressVerifyPage extends StatefulWidget {
  final String userName;

  DistressVerifyPage({required this.userName});

  @override
  _DistressVerifyPageState createState() => _DistressVerifyPageState();
}

class _DistressVerifyPageState extends State<DistressVerifyPage> {
  int _timerValue = 10;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timerValue == 0) {
          timer.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DistressPage(userName: widget.userName)),
          );
        } else {
          setState(() {
            _timerValue--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
              "Client Name: ${widget.userName}",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Alerting nearby Emergency Stations",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "(${_timerValue} Secs)",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.warning,
              color: Colors.black,
              size: 50,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
