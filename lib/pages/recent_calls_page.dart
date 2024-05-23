import 'package:flutter/material.dart';
import 'package:saklolo2/components/my_drawer.dart';
import 'package:saklolo2/pages/home_page.dart';
import 'package:saklolo2/pages/notifications_page.dart';
import 'package:saklolo2/services/recent_calls_storage.dart'; // Ensure this import is correct
import 'package:saklolo2/theme/theme_provider.dart';
import 'package:saklolo2/services_list.dart'; // Import services_list for EmergencyService
import 'package:intl/intl.dart'; // Import for formatting dates

class RecentCallsPage extends StatefulWidget {
  RecentCallsPage({Key? key}) : super(key: key);

  @override
  _RecentCallsPageState createState() => _RecentCallsPageState();
}

class _RecentCallsPageState extends State<RecentCallsPage> {
  late List<EmergencyService> recentCalls; // Changed RecentCall to EmergencyService

  @override
  void initState() {
    super.initState();
    recentCalls = RecentCallsStorage().recentCalls; // Ensure RecentCallsStorage is correctly defined and imported
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Calls"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: recentCalls.length,
        itemBuilder: (context, index) {
          final service = recentCalls[index];
          final formattedTimestamp = service.timestamp != null 
              ? DateFormat('hh:mm a MM/dd/yyyy').format(service.timestamp!)
              : 'No timestamp'; // Format the timestamp
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(service.logoPath),
            ),
            title: Text('${service.name} ${service.number}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(service.department),
                Text(formattedTimestamp), // Display the timestamp
              ],
            ),
            trailing: Text(service.distance),
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
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
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
