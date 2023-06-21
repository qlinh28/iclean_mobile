import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/employee/profile_service_screen.dart';
import 'package:iclean_flutter/screens/employee/register_service_screen.dart';
import 'package:iclean_flutter/screens/user/components/home/banner_slider.dart';
import '../../models/account.dart';
import '../../models/services.dart';

class HomeScreen extends StatefulWidget {
  final Account account;
  const HomeScreen({Key? key, required this.account}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Service> services = [
    Service(id: 1, name: "quet nha", icon: "assets/images/lisa_avatar.jpg"),
    Service(id: 2, name: "lau nha", icon: "assets/images/lisa_avatar.jpg"),
    Service(id: 3, name: "rua chen", icon: "assets/images/lisa_avatar.jpg"),
    Service(id: 4, name: "nau com", icon: "assets/images/lisa_avatar.jpg"),
  ];

  List<Service> allServices = [
    Service(id: 1, name: "quet nha2", icon: "assets/images/lisa_avatar.jpg"),
    Service(id: 2, name: "lau nha2", icon: "assets/images/lisa_avatar.jpg"),
    Service(id: 3, name: "rua chen2", icon: "assets/images/lisa_avatar.jpg"),
    Service(id: 4, name: "nau com2", icon: "assets/images/lisa_avatar.jpg"),
  ];

  @override
  void initState() {
    super.initState();
  }

  void createNewService(BuildContext context, Service service) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "You haven't subscribed to this service yet",
            style: TextStyle(
              fontFamily: 'Lato',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          content: const Text(
            "Would you like to sign up?",
            style: TextStyle(
              fontFamily: 'Lato',
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.deepPurple.shade300),
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Colors.deepPurple.shade300,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegisterServiceScreen(
                            account: widget.account, service: service)));
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
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
                  child: CircleAvatar(
                    backgroundImage:
                        NetworkImage(widget.account.profilePicture),
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
                          const Text(
                            "Hello, ",
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            widget.account.fullname,
                            style: const TextStyle(
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
                        createNewService(context, allServices[i]);
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
