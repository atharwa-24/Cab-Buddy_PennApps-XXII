import 'package:cabbuddy/screens/home/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:cabbuddy/services/auth.dart';
import 'package:cabbuddy/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cabbuddy/screens/home/driverlist.dart';
import 'package:cabbuddy/models/driver.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return StreamProvider<List<Driver>>.value(
      value: DatabaseService().driver,
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text('Cab Buddy'),
          backgroundColor: Colors.grey[850],
          elevation: 0.0,
          actions: [
            FlatButton.icon(
              icon: Icon(Icons.person, color: Colors.white,),
              label: Text('Logout', style: TextStyle(color: Colors.white),),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        body: Container(
          child: DriverList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
          },
          tooltip: 'Current Location',
          child: Icon(Icons.pin_drop_outlined),
        ),
      ),
    );
  }
}
