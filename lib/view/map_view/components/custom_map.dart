import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spot_it/controllers/map_controller.dart';

class CustomMap extends StatelessWidget {
  const CustomMap({super.key});

  @override
  Widget build(BuildContext context) {
    MapController mapController = Get.put(MapController());
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: CameraPosition(
        zoom: 15,
        target: LatLng(
          mapController.getUserCurrentLocation.value?.latitude ?? 11111.1111,
          mapController.getUserCurrentLocation.value?.longitude ?? 11111.1111,
        ),
      ),
      //
      myLocationButtonEnabled: false,

      //
      zoomControlsEnabled: false,
      //
      compassEnabled: true,
      //

      myLocationEnabled: true,
    );
  }
}
