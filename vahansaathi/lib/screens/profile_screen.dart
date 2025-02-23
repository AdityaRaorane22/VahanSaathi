import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _vehicleImage;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _vehicleImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/user_avatar.png'),
            ),
            const SizedBox(height: 20),
            _buildProfileInfo(),
            const SizedBox(height: 30),
            _buildVehicleForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileInfo() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('User Name: John Doe', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Email: johndoe@example.com', style: TextStyle(fontSize: 16)),
            SizedBox(height: 5),
            Text('Phone: +123 456 7890', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleForm() {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Register Your Vehicle', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Vehicle Number Plate',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: const [
                DropdownMenuItem(value: 'Two-Wheeler', child: Text('Two-Wheeler')),
                DropdownMenuItem(value: 'Four-Wheeler', child: Text('Four-Wheeler')),
              ],
              onChanged: (value) {},
              hint: const Text('Select Vehicle Type'),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'License Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Insurance Details',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            _vehicleImage != null
                ? Image.file(_vehicleImage!, height: 100)
                : const Text('No Image Selected'),
            const SizedBox(height: 5),
            ElevatedButton.icon(
              onPressed: _pickImage,
              icon: const Icon(Icons.camera_alt),
              label: const Text('Upload Vehicle Image'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Save Vehicle Info'),
            ),
          ],
        ),
      ),
    );
  }
}
