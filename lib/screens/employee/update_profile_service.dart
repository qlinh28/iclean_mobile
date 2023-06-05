import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../models/profile.dart';
import 'components/update_profile/introduce_textfield.dart';
import 'components/update_profile/select_photo_options_screen.dart';
import 'components/update_profile/update_profile_textfield.dart';

class UpdateProfileServiceScreen extends StatefulWidget {
  final Profile profile;
  const UpdateProfileServiceScreen({Key? key, required this.profile})
      : super(key: key);

  @override
  State<UpdateProfileServiceScreen> createState() =>
      _UpdateProfileServiceScreenState();
}

class _UpdateProfileServiceScreenState extends State<UpdateProfileServiceScreen>
    with SingleTickerProviderStateMixin {
  late int sumReview = 0;
  late double averageReview = 5.0;

  late File _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  late final nameController;
  late final priceController;
  late final introduceController;

  @override
  initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profile.name);
    priceController =
        TextEditingController(text: widget.profile.price.toString());
    introduceController = TextEditingController(text: widget.profile.introduce);
    _image = File(widget.profile.image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      widget.profile.name,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // GestureDetector(
                    //   onTap: () {
                    //     _showSelectPhotoOptions(context);
                    //   },
                    //   child: Image(
                    //     image: FileImage(_image),
                    //     width: 170,
                    //     height: 170,
                    //     fit: BoxFit.contain,
                    //   ),
                    // ),
                    CircleAvatar(
                      backgroundImage: FileImage(_image),
                      radius: 100.0,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   widget.profile.name,
                          //   style: TextStyle(
                          //     fontSize: 20,
                          //     fontFamily: 'Lato',
                          //     color: Colors.deepPurple.shade300,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          UpdateProfileTextField(
                              controller: nameController,
                              hintText: 'Your name',
                              obscureText: false,
                              text: widget.profile.name),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_half_outlined,
                                size: 15,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "${averageReview.toStringAsFixed(1)}",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "(${sumReview} reviews)",
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.cleaning_services_sharp,
                                color: Colors.deepPurple.shade300,
                                size: 15,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                widget.profile.jobName,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Lato',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                color: Colors.deepPurple.shade300,
                                size: 15,
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  widget.profile.address,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    color: Colors.grey.shade600,
                                  ),
                                  maxLines:
                                      2, // Allow the Text widget to wrap to as many lines as needed.
                                  overflow: TextOverflow
                                      .ellipsis, // Specify what to display if the Text widget overflows.
                                  softWrap:
                                      true, // Allow the text to wrap to new lines.
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                "\$",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.deepPurple.shade300,
                                ),
                              ),
                              const SizedBox(width: 5),
                              UpdateProfileTextField(
                                  controller: priceController,
                                  hintText: 'Price',
                                  obscureText: false,
                                  text: widget.profile.price.toString()),
                            ],
                          ),

                          const SizedBox(height: 10),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Divider(
                  thickness: 0.5,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "About me",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    IntroduceTextField(
                        controller: introduceController,
                        hintText: 'Introduce your self',
                        obscureText: false,
                        text: widget.profile.introduce),
                  ],
                ),
              ],
            ),
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
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    //onTap: _createBookingOrder,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 16,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.deepPurple.shade300,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.deepPurple.shade300,
                              fontFamily: 'Lato',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    //onTap: _createBookingOrder,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 16,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
