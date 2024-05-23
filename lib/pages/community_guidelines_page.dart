import 'package:flutter/material.dart';
import 'package:saklolo2/pages/respectful_behavior_page.dart';
import 'package:saklolo2/pages/appropriate_use_page.dart';
import 'package:saklolo2/pages/privacy_and_safety_page.dart';
import 'package:saklolo2/pages/feedback_page.dart';

class CommunityGuidelinesPage extends StatelessWidget {
  const CommunityGuidelinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Community Guidelines"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Respectful Behavior"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RespectfulBehaviorPage()),
              );
            },
          ),
          ListTile(
            title: Text("Appropriate Use"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AppropriateUsePage()),
              );
            },
          ),
          ListTile(
            title: Text("Privacy and Safety"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PrivacyAndSafetyPage()),
              );
            },
          ),
          ListTile(
            title: Text("Feedback and Suggestions"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
