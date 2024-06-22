import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _controller.animateCamera(CameraUpdate.zoomIn());
            },
            icon: Icon(Icons.zoom_in),
          ),
          IconButton(
            onPressed: () {
              _controller.animateCamera(CameraUpdate.zoomOut());
            },
            icon: Icon(Icons.zoom_out),
          ),
          IconButton(
            onPressed: () {
              _controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  const CameraPosition(
                    target: LatLng(29.9845929, 31.2299752),
                    zoom: 17,
                  ),
                ),
              );
            },
            icon: Icon(Icons.location_pin),
          ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          _controller = controller;
        },
        zoomControlsEnabled: false,
        trafficEnabled: false,
        buildingsEnabled: false,
        mapType: MapType.satellite,
        polylines: {
          Polyline(
              polylineId: PolylineId("1"),
              points: [
                LatLng(29.9845929, 31.2299752),
                LatLng(29.9836, 31.223),
                LatLng(29.9816, 31.224),
                LatLng(29.9826, 31.226),
                LatLng(29.9856, 31.221),
              ],
              color: Colors.blue),
        },
        markers: {
          Marker(
            markerId: MarkerId("1"),
            position: LatLng(29.9845929, 31.2299752),
          ),
          Marker(
            markerId: MarkerId("2"),
            position: LatLng(29.9846, 31.221),
          )
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(29.9845929, 31.2299752),
          zoom: 17,
        ),
      ),
    );
  }
}
