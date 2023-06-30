// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iclean_flutter/models/address.dart';
import 'package:iclean_flutter/services/address_api.dart';

class UpdateLocationScreen extends StatefulWidget {
  final Address address;
  const UpdateLocationScreen({Key? key, required this.address})
      : super(key: key);

  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  late final dynamic nameController;
  late final dynamic buildingController;
  late final dynamic descriptionController;
  late final double? latitude;
  late final double? longitude;
  LatLng? _selectedLocation;

  @override
  void initState() {
    super.initState();
    latitude = widget.address.latitude;
    longitude = widget.address.longitude;
    nameController = TextEditingController(text: widget.address.addressName);
    buildingController = TextEditingController(text: widget.address.street);
    descriptionController =
        TextEditingController(text: widget.address.description);
    _markers.add(
      Marker(
        markerId: const MarkerId('selected_location'),
        position: LatLng(latitude!, longitude!),
        infoWindow: const InfoWindow(
          title: 'Your Location',
          snippet: 'This is the initial location',
        ),
      ),
    );
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
                      "Update Your Location",
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
                  onMapCreated: (value) => {_mapController = value},
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        latitude ?? 14,
                        longitude ??
                            -106), //Default Location: Tan Son Nhat AirPort
                    zoom: 18,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    _handleDeleteLocation(widget.address.id);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    height: MediaQuery.of(context).size.height / 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Lato',
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Address address = Address(
                        id: widget.address.id,
                        userId: 0,
                        addressName: nameController.text,
                        description: descriptionController.text,
                        isDefault: widget.address.isDefault,
                        street: buildingController.text,
                        longitude: _selectedLocation!.longitude,
                        latitude: _selectedLocation!.latitude);
                    _handleUpdateLocation(address);
                  },
                  child: Container(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleDeleteLocation(int addressId) async {
    int statusCode = await AddressApi.deleteAddress(addressId);
    if (statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Delete location success!'),
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

  Future<void> _handleUpdateLocation(Address address) async {
    int statusCode = await AddressApi.updateAddress(address);
    if (statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Update location success!'),
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
