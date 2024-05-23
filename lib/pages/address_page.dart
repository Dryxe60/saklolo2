// address_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saklolo2/components/my_drawer.dart';
import 'package:saklolo2/pages/create_address_page.dart';
import 'package:saklolo2/pages/home_page.dart';
import 'package:saklolo2/pages/notifications_page.dart';
import 'package:saklolo2/pages/recent_calls_page.dart';
import 'package:saklolo2/services/address_provider.dart';
import 'package:saklolo2/theme/theme_provider.dart';


class AddressPage extends StatefulWidget {
  AddressPage({Key? key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var addressProvider = Provider.of<AddressProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          "Addresses",
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: AddressesList(
                addresses: addressProvider.addresses,
                onAddressSelected: (address) {
                  // Handle address selection if needed
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
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? newAddress = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateAddressPage()),
          );
          if (newAddress != null) {
            addressProvider.addAddress(newAddress);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AddressesList extends StatelessWidget {
  final List<String> addresses;
  final Function(String)? onAddressSelected;

  AddressesList({required this.addresses, this.onAddressSelected});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      itemCount: addresses.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            if (onAddressSelected != null) {
              onAddressSelected!(addresses[index]);
            }
          },
          child: Card(
            child: ListTile(
              title: Text(addresses[index]),
            ),
          ),
        );
      },
    );
  }
}
