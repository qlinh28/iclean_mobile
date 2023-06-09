import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../models/bookings.dart';

class CompletedCard extends StatefulWidget {
  // final String status;
  // final int userId;

  const CompletedCard({
    Key? key,
    /*required this.status, required this.userId*/
  }) : super(key: key);

  @override
  State<CompletedCard> createState() => _CompletedCardState();
}

class _CompletedCardState extends State<CompletedCard>
    with TickerProviderStateMixin {
  List<Booking> bookings = [
    Booking(
        id: 1,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Nguyễn Văn Đạt",
        status: "completed",
        workTime: DateTime.august,
        timestamp: DateTime.now(),
        price: 1000000000,
        location: "Thủ Đức, Thành phố Hồ Chí Minh",
        jobId: 1,
        jobName: "Giặt ủi",
        description: "1233321123321",
        jobImage: "assets/images/1.jpg"),
    Booking(
        id: 2,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Nguyễn Đăng Khoa",
        status: "completed",
        workTime: DateTime.august,
        timestamp: DateTime.now(),
        price: 1000000000,
        location: "Thủ Đức, Thành phố Hồ Chí Minh",
        jobId: 1,
        jobName: "Decor",
        description: "1233321123321",
        jobImage: "assets/images/2.png"),
    Booking(
        id: 3,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Lê Thúy Ngân",
        status: "completed",
        workTime: DateTime.august,
        timestamp: DateTime.now(),
        price: 1000000000,
        location: "Thủ Đức, Thành phố Hồ Chí Minh",
        jobId: 1,
        jobName: "Nấu ăn",
        description: "1233321123321",
        jobImage: "assets/images/3.png"),
  ];
  late AnimationController _controller;
  late Animation<double> _animation;
  late List<bool> _isExpanded = List.filled(bookings.length, false);

  @override
  void initState() {
    super.initState;
    //fetchBooking(widget.userId, widget.status);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  // void fetchBooking(int userId, String status) async {
  //   final listBookings = await BookingApi.fetchBooking(userId, status);
  //   setState(() {
  //     bookings = listBookings;
  //   });
  // }

  Widget _buildFeedbackDialog(BuildContext context, int orderId) {
    double _rating = 0;
    String _feedback = '';
    return AlertDialog(
      title: const Text('Feedback'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('How would you rate your experience?'),
          const SizedBox(height: 10.0),
          RatingBar.builder(
            initialRating: _rating,
            minRating: 1,
            maxRating: 5,
            itemSize: 30.0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          const SizedBox(height: 20.0),
          const Text('Please tell us what you think:'),
          const SizedBox(height: 10.0),
          TextFormField(
            maxLines: null,
            onChanged: (value) {
              setState(() {
                _feedback = value;
              });
            },
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text('CANCEL'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('SUBMIT'),
          onPressed: () {
            // _rating > 0 && _feedback.isNotEmpty
            //     ? _submitFeedback(_rating, _feedback, orderId)
            //     : null;
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        for (int i = 0; i < bookings.length; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded[i] = !_isExpanded[i];
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 4,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Image.asset(
                            bookings[i].jobImage,
                            width: 70,
                            height: 70,
                            fit: BoxFit.contain,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bookings[i].empName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                bookings[i].jobName,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  "Pending",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: Visibility(
                      visible: _isExpanded[i],
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Date & Time",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Text(
                                  DateFormat('MMM d, yyyy | hh:mm aaa')
                                      .format(bookings[i].timestamp),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Lato',
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    bookings[i].location,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    ),
                                    textAlign: TextAlign.right,
                                    maxLines: 3,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (context) =>
                                          _buildFeedbackDialog(
                                              context, bookings[i].id),
                                    );
                                  },
                                  child: Container(
                                    margin:
                                        const EdgeInsets.symmetric(vertical: 8),
                                    width:
                                        MediaQuery.of(context).size.width / 2.6,
                                    height:
                                        MediaQuery.of(context).size.height / 20,
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple.shade300,
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                          color: Colors.deepPurple.shade300,
                                          width: 2),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.4),
                                          spreadRadius: 5,
                                          blurRadius: 20,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Give Feedback",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Icon(
                      _isExpanded[i]
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  // Future<void> _submitFeedback(
  //     double rating, String feedback, int orderId) async {
  //   int responseStatus =
  //       await FeedBackApi.createFeedback(orderId, feedback, rating.round());
  //   if (responseStatus == 201) {
  //     // Booking order was created successfully, show a success message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Thanks for give a Feedback!')),
  //     );
  //   } else {
  //     // Booking order creation failed, show an error message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //           content: Text('You have already given feedback on this order!')),
  //     );
  //   }
  //   Navigator.of(context).pop();
  // }
}
