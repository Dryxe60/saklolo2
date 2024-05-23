import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saklolo2/components/my_drawer.dart';
import 'package:saklolo2/pages/menu_page.dart';
import 'package:saklolo2/pages/notifications_page.dart';
import 'package:saklolo2/theme/theme_provider.dart';
import 'package:saklolo2/pages/recent_calls_page.dart';
import 'package:saklolo2/pages/call_page.dart';
import 'package:saklolo2/pages/distress_verify_page.dart';
import 'package:saklolo2/services_list.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String? selectedService;

  Timer? _holdTimer;
  bool _isHolding = false;
  bool _isPressed = false;

  @override
  void dispose() {
    _holdTimer?.cancel();
    super.dispose();
  }

  void _startHoldTimer() {
    _holdTimer = Timer(Duration(seconds: 5), () {
      if (_isPressed) {
        // Perform your action here after holding for 5 seconds
        print('Distress button held for 5 seconds!');
        // Add your navigation logic here after holding for 5 seconds
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DistressVerifyPage(userName: '',)),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text(
              "Home",
              style: TextStyle(
                color: themeProvider.themeData.colorScheme.onBackground,
              ),
            ),
            backgroundColor: themeProvider.themeData.colorScheme.background,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: themeProvider.themeData.colorScheme.onBackground,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                );
              },
            ),
          ),
          drawer: MyDrawer(),
          body: Container(
            color: themeProvider.themeData.colorScheme.background,
            child: Column(
              children: <Widget>[
                Header(),
                Expanded(
                  child: EmergencyServicesList(
                    onServiceSelected: (service) {
                      setState(() {
                        selectedService = service;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CallButton(selectedService: selectedService),
                      SizedBox(width: 30), // Gap
                      GestureDetector(
                        onTapDown: (details) {
                          setState(() {
                            _isPressed = true;
                            _isHolding = true;
                          });
                          _startHoldTimer();
                        },
                        onTapUp: (details) {
                          setState(() {
                            _isPressed = false;
                            _isHolding = false;
                          });
                          _holdTimer?.cancel();
                        },
                        onTapCancel: () {
                          setState(() {
                            _isPressed = false;
                            _isHolding = false;
                          });
                          _holdTimer?.cancel();
                        },
                        child: Container(
                          width: 120, // Adjust width as needed
                          height: 120, // Adjust height as needed
                          decoration: BoxDecoration(
                            color: _isHolding ? Colors.red.withOpacity(0.5) : Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.warning,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                BottomNavigationBarWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        'Nearest Emergency Services',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}

class EmergencyServicesList extends StatefulWidget {
  final Function(String)? onServiceSelected;

  EmergencyServicesList({this.onServiceSelected});

  @override
  _EmergencyServicesListState createState() => _EmergencyServicesListState();
}

class _EmergencyServicesListState extends State<EmergencyServicesList> {
  String? selectedService;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: emergencyServices.length,
            itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedService = emergencyServices[index].name;
            });
            if (widget.onServiceSelected != null) {
              widget.onServiceSelected!(emergencyServices[index].name);
              print('Service selected: ${emergencyServices[index].name}');
            }
          },
          child: Card(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedService == emergencyServices[index].name ? Colors.grey : Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: ListTile(
                leading: Container(
                  width: 60, // Adjust width as needed
                  height: 60, // Adjust height as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(emergencyServices[index].logoPath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text('${emergencyServices[index].name} ${emergencyServices[index].number}'), // Displaying number next to name
                subtitle: Text(emergencyServices[index].department),
                trailing: Text(emergencyServices[index].distance),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CallButton extends StatelessWidget {
  final String? selectedService;

  CallButton({required this.selectedService});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.red,
      radius: 30,
      child: IconButton(
        icon: Icon(Icons.phone, size: 30, color: Colors.white),
        onPressed: () {
          if (selectedService == null) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Select Service First"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("OK"),
                    ),
                  ],
                );
              },
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CallPage(
                  service: emergencyServices.firstWhere(
                    (service) => service.name == selectedService,
                    orElse: () => defaultService,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MenuPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}

