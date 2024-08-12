import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map_heatmap/flutter_map_heatmap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OpenStreetMap Heatmap Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Exemple de points avec profondeur
    final List<HeatMapPoint> points = [
      HeatMapPoint(LatLng(45.8992, 6.1294), intensity: 100), // Profondeur faible
      HeatMapPoint(LatLng(45.8900, 6.1200), intensity: 50), // Profondeur moyenne
      HeatMapPoint(LatLng(45.8800, 6.1300), intensity: 2), // Profondeur élevée
      // Ajoute plus de points ici
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('OpenStreetMap Heatmap with Flutter'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(45.8992, 6.1294), // Coordonnées pour Annecy, France
          zoom: 12.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.example.openstreetmap_example',
          )
        ],
      ),
    );
  }
}

// Représente un point dans la heatmap avec une intensité
class HeatMapPoint {
  final LatLng point;
  final double intensity;

  HeatMapPoint(this.point, {required this.intensity});
}
