import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMaps extends StatefulWidget {
  const SimpleMaps({Key? key}) : super(key: key);

  @override
  State<SimpleMaps> createState() => _SimpleMapsState();
}

class _SimpleMapsState extends State<SimpleMaps> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition kGooglePlex =
      CameraPosition(target: LatLng(37.42796233580664, -122.78945), zoom: 14.0);
  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(33.15478, -135.78945),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  List<Marker> _marker = [
    Marker(markerId: MarkerId('1'),
    position: LatLng(-8.117966, 115.088608),
    draggable: true,
    onDragEnd: (e) {
      print(e.toJson());
    },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Google Maps"), centerTitle: true),
      body: GoogleMap(
          initialCameraPosition: kGooglePlex,
          mapType: MapType.terrain,
          markers: _marker.toSet(),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final GoogleMapController controller = await _controller.future; 
          controller.animateCamera(CameraUpdate.newLatLng(LatLng(-8.117966, 115.088608),));
        },
        label: const Text(" Go To Undiksha"),
        icon: const Icon(Icons.location_city_outlined),
      ),
    );
  }
  
  Future<void> goToLake() async{
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
