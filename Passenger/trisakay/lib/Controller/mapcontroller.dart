import 'package:trisakay/packages.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MapController extends GetxController {
  static LatLng SOURCE_LOCATION = LatLng(6.916829, 122.071434);
  static double CAMERA_ZOOM = 16;
  static double CAMERA_TILT = 0;
  static double CAMERA_BEARING = 30;

  FirebaseAuth auth = FirebaseAuth.instance;
  Directions? info;
  Marker? origin;
  Marker? destination;
  String? permissionStatus;
  WaitingList waitingList = WaitingList();
  Location location = Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  CameraPosition initialCameraPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: SOURCE_LOCATION);

  void addMarker(LatLng pos) async {
    if (destination == null || (destination != null && origin != null)) {
      waitingList.destinationLocation = pos;
      destination = Marker(
        markerId: const MarkerId('destination'),
        infoWindow: const InfoWindow(title: 'Destination'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        position: pos,
      );
    } else {
      waitingList.pickupLocation = pos;
      origin = Marker(
        markerId: const MarkerId('pickup'),
        infoWindow: const InfoWindow(title: 'Pickup location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: pos,
      );
    }
    if (destination != null) {
      final directions = await DirectionsRepository().getDirections(
          origin: origin!.position, destination: destination!.position);
      info = directions;
    }
    refresh();
  }

  double getPrice() {
    if (info != null) {
      String distance =
          info!.totalDistance!.substring(0, info!.totalDistance!.indexOf(' '));
      print(distance);
      return (double.parse(distance) * 8) + 40;
    }
    return 0;
  }

  void getCurrentLocation() async {
    try {
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled!) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled!) {
          return;
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      locationData = await location.getLocation();
      SOURCE_LOCATION =
          LatLng(locationData!.latitude!, locationData!.longitude!);
    } catch (e) {
      print(e.toString());
    }
  }

  void addInWaitingList() {
    waitingList.uidAdd = auth.currentUser!.uid;
    Firedatabase().addWaitingList();
  }
}
