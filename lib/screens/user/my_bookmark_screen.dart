import 'package:flutter/material.dart';
import '../../models/profile.dart';
import 'components/my_bookmark/SavedProfile.dart';
import 'components/my_bookmark/TopBar.dart';

class MyBookmarkScreen extends StatefulWidget {
  const MyBookmarkScreen({Key? key}) : super(key: key);

  @override
  State<MyBookmarkScreen> createState() => _MyBookmarkScreenState();
}

class _MyBookmarkScreenState extends State<MyBookmarkScreen> {
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
                const TopBar(),
                const SizedBox(height: 20),
                for (int i = 0; i < profile.length; i++)
                  SavedProfile(profile: profile, i: i),
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
