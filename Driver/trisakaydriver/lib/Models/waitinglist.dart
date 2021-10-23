import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class WaitingList {
  String? uid;
  LatLng? pickupLocation;
  LatLng? destinationLocation;
  bool status = false;

  WaitingList();

  WaitingList.getDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    try {
      uid = documentSnapshot.get('uid');
      pickupLocation = documentSnapshot.get('pickupLocation');
      destinationLocation = documentSnapshot.get('destinationLocation');
    } catch (e) {
      print(e.toString());
    }
  }

  WaitingList.getQueryDocumentSnapshot(
      QueryDocumentSnapshot queryDocumentSnapshot) {
    try {
      uid = queryDocumentSnapshot.get('uid');
      GeoPoint point = queryDocumentSnapshot.get('pickupLocation');
      pickupLocation = LatLng(point.latitude, point.longitude);
      point = queryDocumentSnapshot.get('destinationLocation');
      destinationLocation = LatLng(point.latitude, point.longitude);
    } catch (e) {
      print(e.toString());
    }
  }

  String get userID => uid!;
  LatLng get pickuplocation => pickupLocation!;
  LatLng get destinationlocation => destinationLocation!;
  bool get statusCheck => status;

  set statusCheck(bool status) => this.status = status;
  set uidAdd(String uid) => this.uid = uid;
}
