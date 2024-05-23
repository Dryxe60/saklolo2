import 'package:flutter/material.dart';

class CreateAddressPage extends StatefulWidget {
  @override
  _CreateAddressPageState createState() => _CreateAddressPageState();
}

class _CreateAddressPageState extends State<CreateAddressPage> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Address"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String newAddress = _addressController.text;
                if (newAddress.isNotEmpty) {
                  Navigator.pop(context, newAddress);
                } else {
                  // Show error message if address is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please enter an address.'),
                    ),
                  );
                }
              },
              child: Text('Save Address'),
            ),
          ],
        ),
      ),
    );
  }
}
