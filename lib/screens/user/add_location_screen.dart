// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iclean_flutter/models/address.dart';
import 'package:iclean_flutter/services/address_api.dart';

class AddLocationScreen extends StatefulWidget {
  final bool defaultOrNot;
  const AddLocationScreen({Key? key, required this.defaultOrNot})
      : super(key: key);

  @override
  State<AddLocationScreen> createState() => _AddLocationScreenState();
}

class _AddLocationScreenState extends State<AddLocationScreen> {
  final Set<Marker> _markers = {};
  late final dynamic nameController;
  late final dynamic buildingController;
  late final dynamic descriptionController;
  late double latitude = 37.7749;
  late double longitude = -122.4194;
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    buildingController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    buildingController.dispose();
    descriptionController.dispose();
    _markers.clear();
    super.dispose();
  }

  void _onMapTapped(LatLng latLng) {
    setState(() {
      _markers.clear();
      _markers.add(
        Marker(
          markerId: const MarkerId('selected_location'),
          position: latLng,
        ),
      );
      _selectedLocation = latLng;
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Add New Location",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(34 * fem, 0, 0, 0),
                      child: SizedBox(
                        width: 350 * fem,
                        height: 70 * fem,
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: 'Name Location',
                            labelStyle: TextStyle(
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(158, 158, 158, 1),
                              ),
                            ),
                          ),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(34 * fem, 0 * fem, 0, 0),
                      child: SizedBox(
                        width: 350 * fem,
                        height: 70 * fem,
                        child: TextFormField(
                          controller: buildingController,
                          decoration: InputDecoration(
                            labelText: 'Street/Building Name',
                            labelStyle: TextStyle(
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(158, 158, 158, 1),
                              ),
                            ),
                          ),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(34 * fem, 0 * fem, 0, 0),
                      child: SizedBox(
                        width: 350 * fem,
                        height: 70 * fem,
                        child: TextFormField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                            labelText: 'Additional Address Information',
                            labelStyle: TextStyle(
                              fontSize: 15 * fem,
                              fontWeight: FontWeight.w700,
                              color: const Color.fromRGBO(158, 158, 158, 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10 * fem),
                              borderSide: const BorderSide(
                                color: Color.fromRGBO(158, 158, 158, 1),
                              ),
                            ),
                          ),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(latitude,
                        longitude), //Default Location: Tan Son Nhat AirPort
                    zoom: 14,
                  ),
                  markers: _markers,
                  onTap: _onMapTapped,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            Divider(
              thickness: 0.5,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 5),
            InkWell(
              onTap: () {
                Address address = Address(
                    id: 0,
                    userId: 0,
                    addressName: nameController.text,
                    description: descriptionController.text,
                    isDefault: widget.defaultOrNot,
                    street: buildingController.text,
                    longitude: _selectedLocation!.longitude,
                    latitude: _selectedLocation!.latitude);
                _handleAddNewLocation(address);
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 14,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleAddNewLocation(Address address) async {
    int statusCode = await AddressApi.createAddress(address);
    if (statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Add new location success!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Some error occur!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
