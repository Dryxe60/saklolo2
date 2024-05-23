import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add user photo and details here
            Text("Name: John Doe"),
            Text("Age: 30"),
            Text("Date of Birth: January 1, 1990"),
            Text("Contact Number: 123-456-7890"),
            Text("Location: New York"),
          ],
        ),
      ),
    );
  }
}
