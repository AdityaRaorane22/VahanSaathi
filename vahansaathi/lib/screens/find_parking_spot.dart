import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

class FindParkingSpotScreen extends StatelessWidget {
  FindParkingSpotScreen({super.key});

  // Sample real-world parking locations (within 200m radius)
  final List<Map<String, dynamic>> parkingSpots = [
    {
      "name": "Mall Parking",
      "lat": 19.0760,
      "lng": 72.8777,
      "price": "₹50/hr",
    },
    {
      "name": "Apartment Garage",
      "lat": 19.0785,
      "lng": 72.8752,
      "price": "₹30/hr",
    },
    {
      "name": "Street Parking",
      "lat": 19.0745,
      "lng": 72.8790,
      "price": "₹20/hr",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Find Parking Spot")),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(19.0760, 72.8777), // Center of the map
          zoom: 16.0, // Adjust zoom for better visibility
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          MarkerLayer(
            markers: parkingSpots.map((spot) {
              return Marker(
                point: LatLng(spot["lat"], spot["lng"]),
                width: 50,
                height: 50,
                child: GestureDetector(
                  onTap: () => _showParkingDetails(context, spot),
                  child: const Icon(Icons.local_parking, size: 40, color: Colors.green),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // Show details of the parking spot
  void _showParkingDetails(BuildContext context, Map<String, dynamic> spot) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 220,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                spot["name"],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text("Price: ${spot["price"]}", style: const TextStyle(fontSize: 16)),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => _navigateToParking(spot["lat"], spot["lng"]),
                icon: const Icon(Icons.navigation),
                label: const Text("Navigate to this spot"),
              ),
            ],
          ),
        );
      },
    );
  }

  // Open Google Maps for navigation
  void _navigateToParking(double lat, double lng) async {
    final Uri googleMapsUri = Uri.parse("https://www.google.com/maps/dir/?api=1&destination=$lat,$lng");
    if (await canLaunchUrl(googleMapsUri)) {
      await launchUrl(googleMapsUri, mode: LaunchMode.externalApplication);
    } else {
      print("Could not launch Google Maps");
    }
  }
}
