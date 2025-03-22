// ignore_for_file: avoid_print

// import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;
  Future<void> getCurentLocation() async {

    LocationPermission permissioncheck = await Geolocator.checkPermission();

    if (permissioncheck == LocationPermission.denied) {
      LocationPermission permission = await Geolocator.requestPermission();
      permissioncheck = await Geolocator.checkPermission();
    }
    if (permissioncheck != LocationPermission.denied) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
      print(position);
    } else {
      print('permission denied');
    }
  }
}