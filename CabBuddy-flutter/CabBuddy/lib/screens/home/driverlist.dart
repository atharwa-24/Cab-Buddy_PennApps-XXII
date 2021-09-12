import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cabbuddy/models/driver.dart';
import 'package:provider/provider.dart';
import 'package:cabbuddy/screens/home/drivertile.dart';

class DriverList extends StatefulWidget {
  @override
  _DriverListState createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  @override
  Widget build(BuildContext context) {

    final driver = Provider.of<List<Driver>>(context) ?? [];
    driver.forEach((driver) {
      print(driver.vehicle);
      print(driver.name);
    });

    return ListView.builder(
      itemCount: driver.length,
      itemBuilder: (context, index) {
        return DriverTile(driver: driver[index]);
      },
    );
  }
}
