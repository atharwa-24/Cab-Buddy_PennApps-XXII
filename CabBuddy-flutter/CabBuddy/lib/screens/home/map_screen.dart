import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cabbuddy/models/driver.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  final Driver driver;
  _MapScreenState({this.driver});

  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId('id-1'), position: LatLng(driver.latitude, driver.longitude))
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Current Location'),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(target: LatLng(driver.latitude, driver.longitude), zoom: 15),
      ),
    );
  }
}
