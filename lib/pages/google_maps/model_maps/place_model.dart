import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel {
  int id;
  String name;
  String services;
  LatLng position;
  String imageUrl;

  PlaceModel({
    required this.id,
    required this.name,
    required this.services,
    required this.position,
    required this.imageUrl,
  });
}

List<PlaceModel> places = [
  PlaceModel(
    id: 1,
    name: "Polleria Los pollos",
    services: "Pollos a la brasa riquísimos",
    position: LatLng(-8.3828904011862, -74.57487186540675),
    imageUrl:
        "https://images.pexels.com/photos/16554893/pexels-photo-16554893.jpeg?_gl=1*17z3knb*_ga*ODI4MzUxMDczLjE3MjI2NDc0MzI.*_ga_8JE65Q40S6*czE3NTI5Mzk1MzQkbzU2JGcxJHQxNzUyOTM5NTQzJGo1MSRsMCRoMA..",
  ),
  PlaceModel(
    id: 2,
    name: "Veterinaria Lucho",
    services: "Servicio de atención a mascotas",
    position: LatLng(-8.38881395295857, -74.56742391434366),
    imageUrl:
        "https://images.pexels.com/photos/6234980/pexels-photo-6234980.jpeg?_gl=1*1xwbxxt*_ga*ODI4MzUxMDczLjE3MjI2NDc0MzI.*_ga_8JE65Q40S6*czE3NTI5Mzk1MzQkbzU2JGcxJHQxNzUyOTM5NTk1JGo1OSRsMCRoMA..",
  ),
  PlaceModel(
    id: 3,
    name: "Colegio TECH",
    services: "Educacion de secundaria",
    position: LatLng(-8.395122677078604, -74.59799458929538),
    imageUrl:
        "https://images.pexels.com/photos/2982449/pexels-photo-2982449.jpeg?_gl=1*xhbf90*_ga*ODI4MzUxMDczLjE3MjI2NDc0MzI.*_ga_8JE65Q40S6*czE3NTI5Mzk1MzQkbzU2JGcxJHQxNzUyOTM5Njc2JGo0MCRsMCRoMA..",
  ),
];
