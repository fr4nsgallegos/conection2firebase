import 'package:con2g12/pages/google_maps/utils/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapPage2 extends StatefulWidget {
  @override
  State<MapPage2> createState() => _MapPage2State();
}

class _MapPage2State extends State<MapPage2> {
  final _mapController = HomeController();
  Logger _logger = Logger();
  Set<Marker> _markers = {};

  Future addMarkers() async {
    Set<Marker> auxMarkers = Set();
    LatLng pos1 = LatLng(-8.3828904011862, -74.57487186540675);
    LatLng pos2 = LatLng(-8.38881395295857, -74.56742391434366);
    LatLng pos3 = LatLng(-8.395122677078604, -74.59799458929538);

    List<LatLng> posiciones = [pos1, pos2, pos3];

    //MÉTODO 1
    posiciones.forEach((pos) {
      auxMarkers.add(
        Marker(
          markerId: MarkerId("${pos.latitude}-${pos.longitude}"),
          position: pos,
        ),
      );
    });

    //MÉTODO 2
    // auxMarkers = posiciones.map((pos) {
    //   _logger.w(pos);
    //   return Marker(
    //     markerId: MarkerId("${pos.latitude}-${pos.longitude}"),
    //     position: pos,
    //   );
    // }).toSet();

    _markers = auxMarkers;
    _logger.d(auxMarkers);
    _logger.d(_markers);
    print(_markers);

    setState(() {});
  }

  @override
  void initState() {
    addMarkers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: _mapController.onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(-8.39303027389812, -74.58163168086732),
          zoom: 13,
        ),
        markers: _markers,
      ),
    );
  }
}
