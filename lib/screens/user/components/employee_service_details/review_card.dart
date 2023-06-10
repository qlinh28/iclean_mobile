import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iclean_flutter/services/feedback_api.dart';
import 'package:intl/intl.dart';

import '../../../../models/profile.dart';
import '../../../../models/feedback.dart';
import '../../../../models/services.dart';

class ReviewCard extends StatefulWidget {
  final Profile profile;
  final Service service;
  final int rate;

  const ReviewCard(
      {Key? key,
      required this.profile,
      required this.service,
      required this.rate})
      : super(key: key);
  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  List<FeedbackOrder> feedback = [
    // FeedbackOrder(
    //     id: 1,
    //     rate: 5,
    //     employeeId: 1,
    //     detail: "She's so beautiful",
    //     profilePicture: "assets/images/1.jpg",
    //     username: "Lê Trần Quang Linh",
    //     timestamp: DateTime.now()),
    // FeedbackOrder(
    //     id: 2,
    //     rate: 4,
    //     employeeId: 1,
    //     detail: "She dances very well",
    //     profilePicture: "assets/images/2.png",
    //     username: "Mai Thanh Tỷ",
    //     timestamp: DateTime.now()),
    // FeedbackOrder(
    //     id: 3,
    //     rate: 3,
    //     employeeId: 1,
    //     detail: "I love her performance",
    //     profilePicture: "assets/images/3.png",
    //     username: "Nguyễn Phương Nhật Linh",
    //     timestamp: DateTime.now()),
  ];
  late int workerId;
  late int serviceId;
  late int rate;

  @override
  void initState() {
    super.initState;
    workerId = widget.profile.employeeId;
    serviceId = widget.service.id;
    rate = widget.rate;
    fetchReview(workerId, serviceId, rate);
  }

  @override
  void didUpdateWidget(covariant ReviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    fetchReview(workerId, serviceId, widget.rate);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          for (int i = 0; i < feedback.length; i++)
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(feedback[i].profilePicture),
                              // AssetImage("assets/images/1.jpg"),
                              radius: 20,
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  feedback[i].username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: 'Lato',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                RatingBarIndicator(
                                  rating: feedback[i].rate.toDouble(),
                                  itemBuilder: (_, __) => Icon(Icons.star,
                                      color: Colors.deepPurple.shade300),
                                  itemCount: 5,
                                  itemSize: 20,
                                  unratedColor: Colors.grey[300],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Text(
                      feedback[i].detail,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[800],
                        fontFamily: 'Lato',
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      DateFormat('MMM d, yyyy | hh:mm aaa')
                          .format(feedback[i].timestamp),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ),
                ],
              ),
            )
        ]);
  }

  void fetchReview(int workerId, int serviceId, int rate) async {
    final listFeedback =
        await FeedbackAPI.fetchFeedback(serviceId, workerId, rate);
    setState(() {
      // ignore: unnecessary_null_comparison
      if (listFeedback != null) {
        feedback = listFeedback;
      } else {
        print("list feedback null");
      }
    });
  }
}
