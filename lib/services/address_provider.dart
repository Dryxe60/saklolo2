// address_provider.dart
import 'package:flutter/material.dart';

class AddressProvider extends ChangeNotifier {
  List<String> addresses = [
    'Address 1',
    'Address 2',
    'Address 3',
  ];

  void addAddress(String newAddress) {
    addresses.add(newAddress);
    notifyListeners();
  }
}
