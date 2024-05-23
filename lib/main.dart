import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:saklolo2/services/address_provider.dart';
import 'firebase_options.dart';
import 'theme/theme_provider.dart';
import 'pages/auth_page.dart';
import 'pages/home_page.dart';
import 'pages/recent_calls_page.dart';
import 'pages/address_page.dart';
import 'pages/call_page.dart';
import 'pages/settings_page.dart';
import 'services_list.dart'; // Import the services list


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),
        ChangeNotifierProvider<AddressProvider>(
          create: (_) => AddressProvider(), // Add the AddressProvider
        ),
        // Add other providers if any
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Saklolo2',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/auth',
        routes: {
          '/auth': (context) => AuthPage(),
          '/home': (context) => HomePage(),
          '/logs': (context) => RecentCallsPage(),
          '/address': (context) => AddressPage(),
          '/call': (context) => CallPage(service: emergencyServices.isNotEmpty ? emergencyServices[0] : null), // Ensure service is passed correctly
          '/settings': (context) => SettingsPage(),
          // Add more routes if needed
        },
      ),
    );
  }
}
