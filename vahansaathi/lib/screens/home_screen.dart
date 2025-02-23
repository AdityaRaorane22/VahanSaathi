import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'find_parking_spot.dart';
//import 'offer_parking_spot.dart';
//import 'booking_history.dart';
//import 'notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('VahanSaathi'),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.green),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            _buildDrawerItem(Icons.search, 'Find Parking Spot', context,  FindParkingSpotScreen()),
            //_buildDrawerItem(Icons.local_parking, 'Offer Parking Spot', context, const OfferParkingSpotScreen()),
            //_buildDrawerItem(Icons.history, 'Booking History', context, const BookingHistoryScreen()),
            //_buildDrawerItem(Icons.notifications, 'Notifications', context, const NotificationsScreen()),
            
            // Uncomment these when About Us & Logout are implemented
            // _buildDrawerItem(Icons.info, 'About Us', context, const AboutUsScreen()),
            // ListTile(
            //   leading: const Icon(Icons.logout, color: Colors.red),
            //   title: const Text('Logout', style: TextStyle(color: Colors.red)),
            //   onTap: () {
            //     // Implement logout functionality
            //   },
            // ),
          ],
        ),
      ),
      body: const Center(
        child: Text(
          'Welcome to VahanSaathi!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, BuildContext context, Widget screen) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
    );
  }
}
