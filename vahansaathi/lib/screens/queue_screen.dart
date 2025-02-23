import 'package:flutter/material.dart';
import '../components/queue_card.dart';
import 'login_screen.dart';

class QueueScreen extends StatelessWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          const QueueCard(
            title: "Find Nearby Parking",
            description: "Easily locate available parking spots within a 200m radius.",
            imagePath: "assets/images/parking1.png",
          ),
          const QueueCard(
            title: "Offer Your Own Spot",
            description: "List your empty garage or society parking to earn rewards.",
            imagePath: "assets/images/parking2.png",
          ),
          const QueueCard(
            title: "Earn Coins & Rewards",
            description: "Gamified experience! Earn points & use them for free parking.",
            imagePath: "assets/images/parking3.png",
          ),
          const QueueCard(
            title: "Secure & Hassle-Free",
            description: "Digital receipts, legal handling, and seamless payments.",
            imagePath: "assets/images/parking4.png",
          ),
          // Last Screen with "Get Started" Button
          Container(
            color: Colors.green.shade100,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/app_logo.png", height: 150),
                  const SizedBox(height: 20),
                  const Text(
                    "Welcome to VahanSaathi!",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Your smart parking assistant",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                    },
                    child: const Text(
                      "Get Started",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
