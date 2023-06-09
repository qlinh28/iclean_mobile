import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/employee/update_profile_service.dart';
import '../../screens/user/components/employee_service_details/review_card.dart';

import '../../models/services.dart';
import '../../models/profile.dart';

class ProfileServiceScreen extends StatefulWidget {
  //final Account account;
  final Service service;
  const ProfileServiceScreen(
      {Key? key, /*required this.account,*/ required this.service})
      : super(key: key);

  @override
  State<ProfileServiceScreen> createState() => _ProfileServiceScreenState();
}

class _ProfileServiceScreenState extends State<ProfileServiceScreen>
    with SingleTickerProviderStateMixin {
  Profile profile = Profile(
      employeeId: 1,
      jobId: 1,
      employeeName: "Lisa",
      srcPicture: 'assets/images/lisa_worker.jpg',
      description:
          "Lalisa Manobal, thường được biết đến với nghệ danh Lisa, là một nữ rapper, ca sĩ, nhạc sĩ và vũ công người Thái Lan. Cô là thành viên nhỏ tuổi nhất của nhóm nhạc nữ Hàn Quốc Blackpink trực thuộc YG Entertainment.",
      countRate: 10,
      averageRate: 5.0,
      location: "Buriram, Thái Lan",
      jobName: "Singer",
      price: 10000000000);

  late TabController _tabController;
  late int sumReview = 0;
  late double averageReview = 5.0;
  @override
  initState() {
    _tabController = TabController(length: 6, vsync: this, initialIndex: 0);
    _tabController.addListener((_handleTabSelection));
    super.initState();
    //averageRate();
    //sumRate();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  // void averageRate() async {
  //   double sum = 0;
  //   double averageReviewFeed = 0;
  //   // final listFeedback = await FeedBackApi.fetchFeedback(
  //   //     widget.worker.id, widget.service.id, 10);
  //   // // ignore: unnecessary_null_comparison
  //   if (listFeedback != null) {
  //     for (var i = 0; i < listFeedback.length; i++) {
  //       sum += listFeedback[i].rate;
  //     }
  //   } else {
  //     averageReviewFeed = 5.0;
  //   }
  //   if (listFeedback.length != 0) {
  //     averageReviewFeed = sum / listFeedback.length;
  //   } else {
  //     averageReviewFeed = 5.0;
  //   }

  //   setState(() {
  //     averageReview = averageReviewFeed;
  //   });
  // }

  // void sumRate() async {
  //   int sumReviewFeedback = 0;
  //   final listFeedback = await FeedBackApi.fetchFeedback(
  //       widget.worker.id, widget.service.id, 10);
  //   sumReviewFeedback = listFeedback.length;
  //   setState(() {
  //     sumReview = sumReviewFeedback;
  //   });
  // }

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
                      profile.employeeName,
                      style: const TextStyle(
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset(
                      profile.srcPicture,
                      width: 170,
                      height: 170,
                      fit: BoxFit.contain,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.employeeName,
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Lato',
                              color: Colors.deepPurple.shade300,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              const Icon(
                                Icons.star_half_outlined,
                                size: 15,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                averageReview.toStringAsFixed(1),
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "($sumReview reviews)",
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
                                profile.jobName,
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
                                  profile.location,
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
                          Text(
                            "\$${profile.price}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato',
                              color: Colors.deepPurple.shade300,
                            ),
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
                    Text(
                      profile.description,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: 'Lato',
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.star_half_outlined,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${averageReview.toStringAsFixed(1)}",
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "(${sumReview} reviews)",
                          style: const TextStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        unselectedLabelColor: Colors.deepPurple.shade300,
                        onTap: (value) {
                          setState(() {});
                        },
                        indicator: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        indicatorPadding:
                            const EdgeInsets.symmetric(vertical: 7.0),
                        labelPadding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                        tabs: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Tab(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple.shade300,
                                      width: 2)),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16.3,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "All",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Tab(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple.shade300,
                                      width: 2)),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16.3,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "1",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Tab(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple.shade300,
                                      width: 2)),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16.3,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "2",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Tab(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple.shade300,
                                      width: 2)),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16.3,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "3",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Tab(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple.shade300,
                                      width: 2)),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16.3,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Tab(
                                child: Container(
                              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      color: Colors.deepPurple.shade300,
                                      width: 2)),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.star,
                                    size: 16.3,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    "5",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: 'Lato',
                                    ),
                                  ),
                                ],
                              ),
                            )),
                          )
                        ]),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: [
                          ReviewCard(
                              profile: profile,
                              service: widget.service,
                              rate: 10),
                          ReviewCard(
                              profile: profile,
                              service: widget.service,
                              rate: _tabController.index),
                          ReviewCard(
                              profile: profile,
                              service: widget.service,
                              rate: _tabController.index),
                          ReviewCard(
                              profile: profile,
                              service: widget.service,
                              rate: _tabController.index),
                          ReviewCard(
                              profile: profile,
                              service: widget.service,
                              rate: _tabController.index),
                          ReviewCard(
                              profile: profile,
                              service: widget.service,
                              rate: _tabController.index),
                        ][_tabController.index],
                      ),
                    )
                  ],
                )
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
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            UpdateProfileServiceScreen(profile: profile)));
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
                    "Edit your profile",
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
