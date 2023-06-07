import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationDetailScreen extends StatelessWidget {
  final TextEditingController _locationDetailsController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _locationDetailsController,
              decoration: InputDecoration(
                labelText: 'Location Details',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final locationDetails = _locationDetailsController.text.trim();
                Navigator.pop(context, locationDetails);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
