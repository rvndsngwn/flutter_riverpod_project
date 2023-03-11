import 'dart:async';

import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class GoogleMapView extends StatelessWidget {
  GoogleMapView({Key? key}) : super(key: key);

  final Completer<GoogleMapController> mapController = Completer();

  final CameraPosition mohesuPosition = const CameraPosition(
    target: LatLng(28.8993468, 76.6250249),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: {
        const Marker(
          markerId: MarkerId('mohesu'),
          position: LatLng(28.8993468, 76.6250249),
          infoWindow: InfoWindow(
            title: 'Mohesu Enterprises',
            snippet: 'Sector 3, Rohtak',
          ),
        ),
      },
      myLocationButtonEnabled: false,
      myLocationEnabled: false,
      mapType: MapType.hybrid,
      initialCameraPosition: mohesuPosition,
      onMapCreated: (GoogleMapController controller) {
        mapController.complete(controller);
      },
      onTap: (coordinates) {
        MapsLauncher.launchCoordinates(
            coordinates.latitude, coordinates.longitude);
      },
    );
  }
}
