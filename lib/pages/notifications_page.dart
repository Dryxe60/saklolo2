import 'package:flutter/material.dart';
import 'package:saklolo2/components/my_drawer.dart';
import 'package:saklolo2/pages/home_page.dart';
import 'package:saklolo2/pages/recent_calls_page.dart';
import 'package:saklolo2/theme/theme_provider.dart';
import 'package:saklolo2/services_list.dart'; // Import services_list for EmergencyService
import 'package:intl/intl.dart'; // Import for formatting dates

class NotificationsPage extends StatefulWidget {
  NotificationsPage({Key? key}) : super(key: key);

  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  late List<NotificationItem> notifications;

  @override
  void initState() {
    super.initState();
    notifications = [
      NotificationItem(
        message: "All Good",
        serviceOperator: "Police",
        logoPath: "assets/police.png",
        timestamp: DateTime.now(),
      ),
      NotificationItem(
        message: "Emergency Alert: Fire Reported",
        serviceOperator: "Fire Department",
        logoPath: "assets/fire_department.png",
        timestamp: DateTime.now().subtract(Duration(hours: 1)),
      ),
      NotificationItem(
        message: "Weather Clear",
        serviceOperator: "Weather Service",
        logoPath: "assets/weather_service.png",
        timestamp: DateTime.now().subtract(Duration(days: 1)),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          final formattedTimestamp = DateFormat('hh:mm a MM/dd/yyyy').format(notification.timestamp);
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(notification.logoPath),
            ),
            title: Text("${notification.serviceOperator}: ${notification.message}"),
            subtitle: Text(formattedTimestamp),
          );
        },
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecentCallsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
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

class NotificationItem {
  final String message;
  final String serviceOperator;
  final String logoPath;
  final DateTime timestamp;

  NotificationItem({
    required this.message,
    required this.serviceOperator,
    required this.logoPath,
    required this.timestamp,
  });
}
