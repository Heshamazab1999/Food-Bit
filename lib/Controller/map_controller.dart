import 'dart:collection';
import 'package:app/enum/enums.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app/Controller/base_controller.dart';
import 'package:get/get.dart';

class MapController extends BaseController {
  var _marker = HashSet<Marker>().obs;

  HashSet<Marker> get marker => _marker.value;

  markLocation() {
    marker.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(31.20384501928389, 29.88524201888047),
    ));
    _marker.value = marker;
  }

  @override
  void onInit() {
    super.onInit();
    setSate(ViewState.busy);
     markLocation();
     setSate(ViewState.idle);
  }
}
