import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var latitude = "Getting latitude".obs;
  var longitude = "Getting longitude".obs;
  var address = "Getting address".obs;

  //Retrieve the location continue
  late StreamSubscription<Position> _streamSubscription;

  getLocation() async {
    bool serviceEnabled;

    LocationPermission permission;

    //Test if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();


    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permission is permanently denied");
    }

    _streamSubscription = Geolocator.getPositionStream().listen((Position position) {
      latitude.value = "Latitude: ${position.latitude}";
      longitude.value = "Latitude: ${position.longitude}";
      getAddressFromLatLang(position);
    });
  }

  Future<void> getAddressFromLatLang(Position position) async {
    List<Placemark> placemark = await placemarkFromCoordinates(position.latitude, position.longitude);

    Placemark place = placemark[0];
    address.value = "Address ${place.country}, country code ${place.isoCountryCode}, street ${place.locality}";
  }

  @override
  void onInit() {
    getLocation();
    // TODO: implement onInit
  }

  @override
  void onReady() {
    // TODO: implement onReady
  }

  @override
  void onClose() {
    // TODO: implement onClose
  }
}
