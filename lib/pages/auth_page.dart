import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:saklolo2/pages/home_page.dart';
import 'package:saklolo2/pages/login_or_register_page.dart';
//import 'package:saklolo2/pages/login_page.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {

          //User Logged in
          if(snapshot.hasData) {
            return HomePage();
          }

          //User is not Logged in


          else{
            return LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}