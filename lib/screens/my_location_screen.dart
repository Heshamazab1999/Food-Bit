import 'package:app/component/loading_widget.dart';
import 'package:app/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:app/Controller/my_location_controller.dart';

class MyLocationScreen extends StatelessWidget {
  final _controller = Get.put(MyLocationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => (_controller.state == (ViewState.busy) &&
                _controller.position.longitude == null &&
                _controller.position.latitude == null)
            ? LoadingWidget()
            : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(_controller.position.latitude,
                      _controller.position.longitude),
                  zoom: 16,
                ),
                onMapCreated: (GoogleMapController googleMapController) {
                  _controller.onInit();
                  _controller.markLocation();
                },
                markers: _controller.marker,

        ),
      )),
    );
  }
}
