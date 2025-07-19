import 'package:con2g12/pages/google_maps/utils/map_style.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController {
  void onMapCreated(GoogleMapController mapController) {
    mapController.setMapStyle(mapSyle);
  }
}
