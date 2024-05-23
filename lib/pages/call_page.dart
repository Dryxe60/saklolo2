// call_page.dart

import 'package:flutter/material.dart';
import 'package:saklolo2/pages/home_page.dart';
import 'package:saklolo2/pages/notifications_page.dart';
import 'package:saklolo2/services/recent_calls_storage.dart';
import 'package:saklolo2/services_list.dart';


class CallPage extends StatelessWidget {
  final EmergencyService? service;

  CallPage({Key? key, this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Call ${service?.name ?? 'Unknown'} ${service?.number ?? ''}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              '${service?.number ?? ''} ${service?.name ?? 'Unknown'}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              service?.department ?? 'Unknown',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 4),
            Text(
              service?.distance ?? 'Unknown',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            CircleAvatar(
              radius: 30,
              child: IconButton(
                icon: Icon(Icons.phone, size: 30),
                onPressed: () {
                  if (service != null) {
                    RecentCallsStorage().addCall(service!); // Save the called service
                    // Perform call action here (e.g., using url_launcher to make a phone call)
                  }
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.location_on),
              onPressed: () {
                Navigator.pushNamed(context, '/address');
              },
            ),
            IconButton(
              icon: Icon(Icons.phone),
              onPressed: () {
                Navigator.pushNamed(context, '/logs');
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),

            IconButton(
              icon: Icon(Icons.notifications), // Added notification icon
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),

            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }
}
