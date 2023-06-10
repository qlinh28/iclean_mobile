import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/employee/profile_service_screen.dart';
import 'package:iclean_flutter/screens/user/components/home/banner_slider.dart';
import '../../models/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Service> services = [
    Service(id: 4, name: "Giặt thảm", icon: "assets/images/clean-tham.jpg"),
    Service(
        id: 14, name: "Vệ sinh kính", icon: "assets/images/cleaning-kinh.png"),
    Service(id: 15, name: "Giặt ủi", icon: "assets/images/giat-ui.png"),
    Service(
        id: 16,
        name: "Dọn nhà vệ sinh",
        icon: "assets/images/don-nha-ve-sinh.png"),
    Service(id: 17, name: "Nấu ăn", icon: "assets/images/nau-an.png"),
    Service(id: 18, name: "Decor", icon: "assets/images/decor.png"),
  ];

  List<Service> allServices = [
    Service(id: 4, name: "Giặt thảm", icon: "assets/images/clean-tham.jpg"),
    Service(
        id: 14, name: "Vệ sinh kính", icon: "assets/images/cleaning-kinh.png"),
    Service(id: 15, name: "Giặt ủi", icon: "assets/images/giat-ui.png"),
    Service(
        id: 16,
        name: "Dọn nhà vệ sinh",
        icon: "assets/images/don-nha-ve-sinh.png"),
    Service(id: 17, name: "Nấu ăn", icon: "assets/images/nau-an.png"),
    Service(id: 18, name: "Decor", icon: "assets/images/decor.png"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: const CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/images/lisa_avatar.jpg'),
                    radius: 25,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            "Hello, ",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "Lisa",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(children: [
                        Icon(
                          Icons.location_on,
                          size: 14,
                          color: Colors.grey.shade600,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "S102 Vinhomes Grand Park",
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
                      ]),
                      const SizedBox(width: 10),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "What's news?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 5),
            const Center(child: BannerSlider()),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Your Service",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple.shade300,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: (80 / 70),
              children: [
                for (int i = 0; i < services.length; i++)
                  Column(children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileServiceScreen(
                                    service: services[i])));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          services[i].icon,
                          width: 100,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        services[i].name,
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ]),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Hot Service",
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                      color: Colors.deepPurple.shade300,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              childAspectRatio: (80 / 70),
              children: [
                for (int i = 0; i < services.length; i++)
                  Column(children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => EmployeeServiceScreen(
                        //             service: services[i])));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          allServices[i].icon,
                          width: 100,
                          height: 60,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        allServices[i].name,
                        style: const TextStyle(
                          fontSize: 10,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ]),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
