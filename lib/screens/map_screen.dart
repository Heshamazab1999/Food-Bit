import 'package:app/component/loading_widget.dart';
import 'package:app/enum/enums.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:app/Controller/map_controller.dart';

class MapScreen extends StatelessWidget {
  final _controller = Get.put(MapController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Obx(
        () => (_controller.state == ViewState.busy)
            ? LoadingWidget()
            : GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(31.20384501928389, 29.88524201888047),
                  zoom: 15,
                ),
                onMapCreated: (GoogleMapController googleMapController) {
                  _controller.onInit();
                },
                markers: _controller.marker,
              ),
      )),
    );
  }
}
