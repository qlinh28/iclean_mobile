import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/address.dart';
import 'package:iclean_flutter/screens/user/update_location_screen.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({Key? key}) : super(key: key);

  Address defaultAddress = Address(
      id: 3,
      userId: 1,
      addressName: 'S102 Vinhomes Grand Park',
      description:
          '492 Nguyen Xien, P. Long Thanh My, TP. Thu Duc, Thanh Pho Ho Chi Minh, Viet Nam',
      isDefault: true);

  List<Address> listAddressSaved = [
    Address(
        id: 1,
        userId: 1,
        addressName: 'home',
        description:
            '492 Nguyen Xien, P. Long Thanh My, TP. Thu Duc, Thanh Pho Ho Chi Minh, Viet Nam',
        isDefault: false),
    Address(
        id: 2,
        userId: 1,
        addressName: 'home2',
        description:
            '1210 Huynh Van Luy, P. Phu My, TP. Thu Dau Mot, Tinh Binh Duong, Viet Nam',
        isDefault: false),
  ];

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
                    "Your Location",
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
              Expanded(
                child: ListView(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Current Address",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.deepPurple.shade300,
                            size: 25,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            fit: FlexFit.loose,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      defaultAddress.addressName,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato',
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    UpdateLocationScreen(
                                                        address:
                                                            defaultAddress)));
                                      },
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(defaultAddress.description,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                    ),
                                    textAlign: TextAlign.justify,
                                    maxLines: null),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "Saved Address",
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                    for (int i = 0; i < listAddressSaved.length; i++)
                      Container(
                        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.turned_in_not_outlined,
                                  color: Colors.deepPurple.shade300,
                                  size: 25,
                                ),
                                const SizedBox(width: 10),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            listAddressSaved[i].addressName,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Lato',
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UpdateLocationScreen(
                                                              address:
                                                                  listAddressSaved[
                                                                      i])));
                                            },
                                            child: const Text(
                                              "Edit",
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Lato',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 3),
                                      Text(listAddressSaved[i].description,
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 12,
                                            fontFamily: 'Lato',
                                          ),
                                          textAlign: TextAlign.justify,
                                          maxLines: null),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            if (i != listAddressSaved.length - 1)
                              Divider(
                                thickness: 0.5,
                                color: Colors.grey[400],
                              ),
                          ],
                        ),
                      ),
                  ],
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
                    "Add new location",
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
