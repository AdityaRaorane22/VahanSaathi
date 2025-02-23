import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../utils/mapbox_constants.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parking Map")),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(19.0760, 72.8777), // Default to Mumbai
          initialZoom: 14.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/256/{z}/{x}/{y}@2x?access_token=$MAPBOX_API_KEY",
            additionalOptions: const {"access_token": MAPBOX_API_KEY},
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(19.0760, 72.8777), // Sample parking spot
                width: 40,
                height: 40,
                child: Icon(Icons.location_pin, color: Colors.red, size: 40),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
