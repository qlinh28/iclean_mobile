import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/common/user_preferences.dart';
import 'package:iclean_flutter/screens/user/add_location_screen.dart';
import 'package:iclean_flutter/screens/user/components/home/banner_slider.dart';
import 'package:iclean_flutter/screens/user/location_screen.dart';
import 'package:iclean_flutter/screens/user/payment_screen.dart';
import 'package:intl/intl.dart';
import '../../models/account.dart';
import '../../models/services.dart';
import 'employee_service_screen.dart';

class HomeScreen extends StatefulWidget {
  final Account account;
  const HomeScreen({Key? key, required this.account}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Account? current;
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
    Service(id: 19, name: "Decor", icon: "assets/images/decor.png"),
    Service(id: 20, name: "Decor", icon: "assets/images/decor.png"),
    Service(id: 21, name: "Decor", icon: "assets/images/decor.png"),
  ];

  @override
  void initState() {
    super.initState();
    setAccount();
  }

  Future<void> setAccount() async {
    Account? currentAcc = await UserPreferences.getUserInfomation();
    setState(() {
      current = currentAcc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(149, 117, 205, 1),
                      Color.fromRGBO(103, 58, 183, 1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 0),
                          child: const CircleAvatar(
                            backgroundImage: AssetImage('assets/images/10.jpg'),
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
                                children: [
                                  Text(
                                    widget.account.fullname,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: () {
                                      if (widget.account.locationName.isEmpty) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const AddLocationScreen(
                                                      defaultOrNot: true,
                                                    )));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LocationScreen()));
                                      }
                                    },
                                    child: Text(
                                      widget.account.locationName,
                                      style: const TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'Lato',
                                        color: Colors.white,
                                      ),
                                      maxLines:
                                          2, // Allow the Text widget to wrap to as many lines as needed.
                                      overflow: TextOverflow
                                          .ellipsis, // Specify what to display if the Text widget overflows.
                                      softWrap:
                                          true, // Allow the text to wrap to new lines.
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      // padding: const EdgeInsets.only(bottom: 200),
                      height: 50,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Colors.orange,
                            Colors.white,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 30),
                          const Icon(
                            IconData(0xe0b2, fontFamily: 'MaterialIcons'),
                            size: 25,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PaymentScreen()));
                            },
                            child: Text(
                              "Point: ${NumberFormat('# ###').format(current?.point ?? 0)} VNĐ",
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                      "Service",
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
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 6 : 3,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: (80 / 70),
                children: [
                  for (int i = 0; i < services.length; i++)
                    Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(.1),
                            blurRadius: 4.0,
                            spreadRadius: .05,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmployeeServiceScreen(
                                    service: services[i],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: Image.asset(
                                services[i].icon,
                                width: 60,
                                height: 36,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Flexible(
                            child: LayoutBuilder(
                              builder: (BuildContext context,
                                  BoxConstraints constraints) {
                                const fontSize = 10.5;
                                return Text(
                                  services[i].name,
                                  style: const TextStyle(
                                    fontSize: fontSize,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
