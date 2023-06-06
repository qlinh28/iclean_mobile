import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/address.dart';
import 'package:iclean_flutter/screens/user/components/update_location/introduce_textfield.dart';
import 'package:iclean_flutter/screens/user/components/update_location/update_location_textfield.dart';

class UpdateLocationScreen extends StatefulWidget {
  final Address address;
  const UpdateLocationScreen({Key? key, required this.address})
      : super(key: key);

  @override
  State<UpdateLocationScreen> createState() => _UpdateLocationScreenState();
}

class _UpdateLocationScreenState extends State<UpdateLocationScreen> {
  late final nameController;
  late final descriptionController;

  @override
  initState() {
    super.initState();
    nameController = TextEditingController(text: widget.address.addressName);
    descriptionController =
        TextEditingController(text: widget.address.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(children: [
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
                ]),
              ),
              Divider(
                thickness: 0.5,
                color: Colors.grey[400],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "Name Address",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: UpdateLocationTextField(
                    controller: nameController,
                    hintText: 'enter name of your address',
                    obscureText: false,
                    text: widget.address.addressName),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: UpdateDescriptionTextField(
                    controller: descriptionController,
                    hintText: 'enter your address',
                    obscureText: false,
                    text: widget.address.description),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             UpdateProfileServiceScreen(profile: profile)));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
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
                        "Delete this address",
                        style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Lato',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1),
                      ),
                    ),
                  ),
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
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) =>
                //             UpdateProfileServiceScreen(profile: profile)));
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
                        letterSpacing: 1),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
