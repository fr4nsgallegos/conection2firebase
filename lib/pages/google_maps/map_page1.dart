import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage1 extends StatefulWidget {
  @override
  State<MapPage1> createState() => _MapPage1State();
}

class _MapPage1State extends State<MapPage1> {
  Position? currentPosition;
  Set<Marker> _markers = {};
  BitmapDescriptor? _customMarker;

  Future<void> _setCustomMarker() async {
    _customMarker = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(100, 100)),
      "assets/markers/orange.png",
    );
    _markers.add(
      Marker(
        markerId: MarkerId(_markers.length.toString()),
        position: LatLng(currentPosition!.latitude, currentPosition!.longitude),
        icon: _customMarker!,
        infoWindow: InfoWindow(
          title: "marcador n: ${_markers.length}",
          snippet: "Esta es mi posición",
        ),
      ),
    );
  }

  Future<void> getPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      print("Los servicios de ubicación estan deshabiltiados");
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permiso denegado");
        return null;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("Los permisos de ubicación estan permanentemente denegados");
      return null;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      currentPosition = position;
      _setCustomMarker();
      print(position);
      // _markers.add(
      //   Marker(
      //     markerId: MarkerId(_markers.length.toString()),
      //     position: LatLng(
      //       currentPosition!.latitude,
      //       currentPosition!.longitude,
      //     ),
      //     infoWindow: InfoWindow(
      //       title: "marcador n: ${_markers.length}",
      //       snippet: "Esta es mi posición",
      //     ),
      //   ),
      // );
      setState(() {});
    } catch (e) {
      print("eerror: $e");
      return null;
    }
  }

  @override
  void initState() {
    getPosition();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPosition == null
          ? Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  currentPosition!.latitude,
                  currentPosition!.longitude,
                ),
                zoom: 12,
              ),
              markers: _markers,

              onTap: (LatLng position) {
                _markers.add(
                  Marker(
                    icon: _customMarker!,
                    infoWindow: InfoWindow(
                      title: "Marcador n: ${_markers.length}",
                      snippet: "Marcador más info",
                    ),
                    markerId: MarkerId(_markers.length.toString()),
                    position: position,
                  ),
                );
                setState(() {});
              },
            ),
    );
  }
}
