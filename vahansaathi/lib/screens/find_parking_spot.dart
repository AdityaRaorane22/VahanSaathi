import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'map_screen.dart';

class FindParkingSpotScreen extends StatelessWidget {
  const FindParkingSpotScreen({super.key});

  final List<Map<String, dynamic>> parkingSpots = const [
    {
      "name": "City Mall Parking",
      "location": LatLng(19.0748, 72.8856),
      "price": "₹50/hr",
      "distance": "150m",
    },
    {
      "name": "Sunshine Plaza",
      "location": LatLng(19.0805, 72.8773),
      "price": "₹40/hr",
      "distance": "180m",
    },
    {
      "name": "Green Street Parking",
      "location": LatLng(19.0683, 72.8794),
      "price": "₹30/hr",
      "distance": "200m",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Find Parking Spot")),
      body: Column(
        children: [
          // Map section
          const Expanded(
            flex: 2,
            child: MapScreen(),
          ),

          // Parking Spots List
          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: parkingSpots.length,
              itemBuilder: (context, index) {
                final spot = parkingSpots[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.local_parking, color: Colors.blue, size: 40),
                    title: Text(spot["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text("${spot["distance"]} • ${spot["price"]}"),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _showParkingDetails(context, spot);
                      },
                      child: const Text("View"),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showParkingDetails(BuildContext context, Map<String, dynamic> spot) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(spot["name"], style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text("Location: ${spot["distance"]} away"),
              Text("Price: ${spot["price"]}"),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.directions, color: Colors.white),
                label: const Text("Navigate"),
                onPressed: () {
                  // Open navigation (Future implementation)
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
