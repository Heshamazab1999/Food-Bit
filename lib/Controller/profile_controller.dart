import 'package:app/Controller/base_controller.dart';
import 'package:app/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:collection';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class ProfileController extends BaseController {
  static ProfileController to = Get.find();
  var _marker = HashSet<Marker>().obs;
  final _address = ''.obs;
  Position _position = new Position();

  // final _distance = 0.0.obs;
  // List _favouriteModel = <FavouriteModel>[].obs;
  // final _isData = true.obs;

  Position get position => _position;

  // bool get isData => _isData.value;

  String get address => _address.value;

  HashSet<Marker> get marker => _marker.value;

  // List<FavouriteModel> get favouriteModel => _favouriteModel;

  // double get distance => _distance.value;

  @override
  Future<void> onInit() async {
    super.onInit();
    setSate(ViewState.busy);
    //await requestPositionPermission();
    await determinePosition();
    await GetAddressFromLatLong();
    // await getCityName();
    // myPolygon();
    // getAllProducts();
    setSate(ViewState.idle);
  }

  // insertProduct(FavouriteModel favouriteModel, BuildContext context) async {
  //   for (int i = 0; i < _favouriteModel.length; i++) {
  //     if (_favouriteModel[i].name == favouriteModel.name) {
  //       return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text("Added Before Time"),
  //       ));
  //     }
  //   }
  //   var db = DataBaseFavouriteServices.db;
  //   await db.insert(favouriteModel);
  //   _favouriteModel.add(favouriteModel);
  //   print(_favouriteModel.length);
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text("Added To Cart"),
  //         TextButton(
  //             onPressed: () {
  //               Get.toNamed(AppRoute.profile_screen);
  //             },
  //             child: Text("Check"))
  //       ],
  //     ),
  //   ));
  //   update();
  // }

  // getAllProducts() async {
  //   var db = DataBaseFavouriteServices.db;
  //   _favouriteModel = await db.getAllProduct();
  //   update();
  //   print(_favouriteModel.length);
  // }

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
    return _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  markLocation() {
    marker.add(
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(90),
        markerId: MarkerId("1"),
        position: LatLng(position.latitude, position.longitude),
      ),
    );
    marker.add(Marker(
      markerId: MarkerId("2"),
      position: LatLng(31.20384501928389, 29.88524201888047),
    ));

    _marker.value = marker;
  }

  Set<Polygon> myPolygon() {
    List<LatLng> polygonCords = [];
    polygonCords.add(LatLng(31.20384501928389, 29.88524201888047));
    polygonCords.add(LatLng(position.latitude, position.longitude));

    var polygonSet = Set<Polygon>();
    polygonSet.add(Polygon(
        strokeWidth: 3,
        polygonId: PolygonId("1"),
        points: polygonCords,
        strokeColor: Colors.red));

    return polygonSet;
  }

  Future<void> GetAddressFromLatLong() async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    _address.value =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
  }
// getCityName() async {
//   final addresses = await Geocoder.local.findAddressesFromCoordinates(
//       new Coordinates(position.latitude, position.longitude));
//   var first = addresses.first.addressLine;
//   _address.value = first.toString();
//   var moonLanding = DateTime.parse(position.timestamp.toString());
//   print(moonLanding);
// }

}
