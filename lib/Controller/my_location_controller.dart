import 'dart:collection';
import 'package:app/enum/enums.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app/Controller/base_controller.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class MyLocationController extends BaseController {
  var _marker = HashSet<Marker>().obs;
  Position _position = new Position();

  HashSet<Marker> get marker => _marker.value;

  Position get position => _position;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    await determinePosition();
    await markLocation();
    setSate(ViewState.idle);
  }

  markLocation() {
    marker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(position.latitude, position.longitude),
    ));
    _marker.value = marker;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    return _position = await Geolocator.getCurrentPosition();
  }
}
