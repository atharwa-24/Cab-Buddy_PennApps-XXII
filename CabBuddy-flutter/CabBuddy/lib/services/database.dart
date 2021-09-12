import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cabbuddy/models/driver.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  //collection ref
  final CollectionReference driverData = FirebaseFirestore.instance.collection('driver');

  Future updateUserData(String vehicle, String name, double latitude, double longitude) async {
    return await driverData.doc(uid).set({
      'vehicle': vehicle,
      'name': name,
      'latitude': latitude,
      'longitude': longitude
    });
  }

  //brew list from snapshot
  List<Driver> _driverfromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return Driver(
        vehicle: doc.data()['vehicle'] ?? '',
        name: doc.data()['name'] ?? '',
        latitude: doc.data()['latitude'] ?? 27.2046,
        longitude: doc.data()['longitude'] ?? 77.4977
      );
    }).toList();
  }

  //get brews stream
  Stream<List<Driver>> get driver {
    return driverData.snapshots()
        .map(_driverfromSnapshot);
  }

}