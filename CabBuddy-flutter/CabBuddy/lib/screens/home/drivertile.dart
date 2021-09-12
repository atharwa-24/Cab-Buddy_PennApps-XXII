import 'package:flutter/material.dart';
import 'package:cabbuddy/models/driver.dart';

class DriverTile extends StatelessWidget {

  final Driver driver;
  DriverTile({this.driver});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
                backgroundImage: AssetImage('assets/among.png'),
                radius: 40.0
            ),
          ),
          Divider(
              height: 60.0,
              color: Colors.grey[800]
          ),
          Text(
            'Name:',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            driver.name,
            style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Vehicle No:',
            style: TextStyle(
              color: Colors.grey,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(height: 10.0),
          Text(
            driver.vehicle,
            style: TextStyle(
                color: Colors.amberAccent[200],
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children: [
              Icon(
                Icons.phone,
                color: Colors.grey[400],
              ),
              SizedBox(width: 10.0),
              Text(
                'Emergency No: 8810014422',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0
                ),
              )
            ],
          ),
          Divider(
              height: 100.0,
              color: Colors.grey[800]
          ),
        ],
      ),
    );
  }
}
