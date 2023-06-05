import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/user/employee_service_details.dart';
import '../../models/profile.dart';
import '../../models/services.dart';

class EmployeeServiceScreen extends StatefulWidget {
  final Service service;

  const EmployeeServiceScreen({Key? key, required this.service})
      : super(key: key);

  @override
  State<EmployeeServiceScreen> createState() => _EmployeeServiceScreenState();
}

class _EmployeeServiceScreenState extends State<EmployeeServiceScreen> {
  List<Profile> profile = [
    Profile(
        id: 1,
        jobEmpId: 1,
        jobId: 1,
        name: "Lisa",
        image: "assets/images/lisa_worker.jpg",
        introduce:
            "Lalisa Manobal, thường được biết đến với nghệ danh Lisa, là một nữ rapper, ca sĩ, nhạc sĩ và vũ công người Thái Lan. Cô là thành viên nhỏ tuổi nhất của nhóm nhạc nữ Hàn Quốc Blackpink trực thuộc YG Entertainment.",
        countRate: 10,
        averageRate: 5.0,
        address: "Buriram, Thái Lan",
        jobName: "Singer",
        price: 10000000000),
    Profile(
        id: 2,
        jobEmpId: 2,
        jobId: 1,
        name: "Jennie",
        image: "assets/images/jennie_worker.jpg",
        introduce:
            "Kim Jennie, thường được biết đến với nghệ danh JENNIE hay Jennie Kim, là một nữ ca sĩ, rapper, diễn viên người Hàn Quốc, thành viên của nhóm nhạc nữ Blackpink trực thuộc công ty YG Entertainment.",
        countRate: 10,
        averageRate: 5.0,
        address: "Cheongdam-dong, Hàn Quốc",
        jobName: "Singer",
        price: 10000000000),
    Profile(
        id: 3,
        jobEmpId: 3,
        jobId: 1,
        name: "Rosé",
        image: "assets/images/rose_worker.jpg",
        introduce:
            "Park Chae-young, thường được biết đến với nghệ danh Rosé là nữ ca sĩ, người mẫu, nhạc sĩ người New Zealand gốc Hàn Quốc, thành viên của nhóm nhạc nữ Blackpink do YG Entertainment thành lập và quản lý",
        countRate: 10,
        averageRate: 5.0,
        address: "Auckland, New Zealand",
        jobName: "Singer",
        price: 10000000000),
    Profile(
        id: 4,
        jobEmpId: 4,
        jobId: 1,
        name: "Jisoo",
        image: "assets/images/jisoo_worker.jpg",
        introduce:
            "Kim Ji-soo, thường được biết đến với nghệ danh Jisoo, là một nữ ca sĩ, diễn viên, người mẫu, người dẫn chương trình người Hàn Quốc, thành viên chị cả của nhóm nhạc nữ Blackpink do YG Entertainment thành lập và quản lý.",
        countRate: 10,
        averageRate: 5.0,
        address: "Gunpo, Gyeonggi, Hàn Quốc",
        jobName: "Singer",
        price: 10000000000)
  ];

  @override
  void initState() {
    super.initState;
    //fetchWorker(widget.service.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
        child: Column(children: [
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
                widget.service.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          for (int i = 0; i < profile.length; i++)
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 120,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EmployeeDetailsScreen(
                                service: widget.service, profile: profile[i])));
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width / 4,
                        margin: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          profile[i].image,
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 15, bottom: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile[i].name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "\$${profile[i].price}",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Lato',
                                  color: Colors.deepPurple.shade300,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 14,
                                    color: Colors.grey.shade600,
                                  ),
                                  const SizedBox(width: 4),
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    child: Text(
                                      "${profile[i].address}",
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
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
        ]),
      ),
    )));
  }

  // Future<void> fetchWorker(int id) async {
  //   final listWorkers = await WorkerAPI.fetchWorkerByService(id);
  //   setState(() {
  //     worker = listWorkers;
  //   });
  // }
}
