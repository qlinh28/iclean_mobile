import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/user/employee_service_details.dart';
import '../../models/profile.dart';
import 'package:intl/intl.dart';
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
        name: "Vũ Văn Đạt",
        image: "assets/images/1.jpg",
        introduce:
            "Lalisa Manobal, thường được biết đến với nghệ danh Lisa, là một nữ rapper, ca sĩ, nhạc sĩ và vũ công người Thái Lan. Cô là thành viên nhỏ tuổi nhất của nhóm nhạc nữ Hàn Quốc Blackpink trực thuộc YG Entertainment.",
        countRate: 10,
        averageRate: 5.0,
        address: "Buriram, Thái Lan",
        jobName: "Singer",
        price: 100000),
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
        price: 100000),
    Profile(
        id: 3,
        jobEmpId: 3,
        jobId: 1,
        name: "Rosé",
        image: "assets/images/rose_worker.jpg",
        price: 120000,
        introduce:
            "Park Chae-young, thường được biết đến với nghệ danh Rosé là nữ ca sĩ, người mẫu, nhạc sĩ người New Zealand gốc Hàn Quốc, thành viên của nhóm nhạc nữ Blackpink do YG Entertainment thành lập và quản lý",
        countRate: 10,
        averageRate: 5.0,
        address: "Auckland, New Zealand",
        jobName: "Singer"),
    Profile(
        id: 4,
        jobEmpId: 4,
        jobId: 1,
        name: "Jisoo",
        image: "assets/images/jisoo_worker.jpg",
        price: 127000,
        introduce:
            "Kim Ji-soo, thường được biết đến với nghệ danh Jisoo, là một nữ ca sĩ, diễn viên, người mẫu, người dẫn chương trình người Hàn Quốc, thành viên chị cả của nhóm nhạc nữ Blackpink do YG Entertainment thành lập và quản lý.",
        countRate: 10,
        averageRate: 5.0,
        address: "Gunpo, Gyeonggi, Hàn Quốc",
        jobName: "Singer")
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
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      widget.service.name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                for (int i = 0; i < profile.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EmployeeDetailsScreen(
                              profile: profile[i],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    offset: const Offset(0, 2),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  profile[i].image,
                                  width: 120,
                                  height: 150,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    profile[i].name,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "${NumberFormat('#,###').format(profile[i].price)} VNĐ",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.deepPurple.shade300,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 16,
                                        color: Colors.grey.shade600,
                                      ),
                                      const SizedBox(width: 4),
                                      Expanded(
                                        child: Text(
                                          profile[i].address,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            color: Colors.grey.shade600,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 150,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade50,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.favorite_border,
                                    color: Colors.deepPurple,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "Save",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Lato',
                                      color: Colors.deepPurple,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> fetchWorker(int id) async {
  //   final listWorkers = await WorkerAPI.fetchWorkerByService(id);
  //   setState(() {
  //     worker = listWorkers;
  //   });
  // }
}
