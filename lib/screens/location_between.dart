import 'package:app/component/loading_widget.dart';
import 'package:app/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:app/Controller/profile_controller.dart';

class LocationBetween extends StatelessWidget {
  final double zoom;

  LocationBetween({this.zoom = 8});

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(ProfileController());

    return SafeArea(
        child: Scaffold(
      body: Obx(() => (_controller.state == (ViewState.busy) &&
              _controller.position.longitude == null &&
              _controller.position.latitude == null)
          ? LoadingWidget()
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(_controller.position.latitude,
                    _controller.position.longitude),
                zoom: zoom,
              ),
              onMapCreated: (GoogleMapController googleMapController) {
                _controller.determinePosition();
                _controller.markLocation();
                _controller.myPolygon();
                _controller.getPolyline();
              },
              markers: _controller.marker,
              polygons: _controller.myPolygon(),
              polylines: Set<Polyline>.of(_controller.polylines.values),
            )),
    ));
  }
}
