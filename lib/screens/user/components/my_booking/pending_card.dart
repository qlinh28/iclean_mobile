import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../models/bookings.dart';

class PendingCard extends StatefulWidget {
  // final String status;
  // final int userId;

  const PendingCard({
    Key? key,
    /*required this.status, required this.userId*/
  }) : super(key: key);

  @override
  State<PendingCard> createState() => _PendingCardState();
}

class _PendingCardState extends State<PendingCard>
    with TickerProviderStateMixin {
  List<Booking> bookings = [
    Booking(
        id: 1,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Nguyễn Văn Đạt",
        status: "pending",
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
        status: "pending",
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
        status: "pending",
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

  void _reloadPage() {
    setState(() {
      bookings = [];
    });
    // fetchBooking(widget.userId, widget.status);
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // await _updateBookingOrder(
                                    //   bookings[i].id, 'cancel');
                                  },
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2,
                                    height:
                                        MediaQuery.of(context).size.height / 18,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      border: Border.all(
                                        color: Colors.deepPurple.shade300,
                                        width: 2,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Cancel Booking",
                                        style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          fontSize: 15,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // InkWell(
                                //   onTap: () async {
                                //     await _updateBookingOrder(
                                //         bookings[i].id, 'undone');
                                //     // Navigator.push(
                                //     //     context,
                                //     //     MaterialPageRoute(
                                //     //         builder: (context) =>
                                //     //             OrderDetailsSreen(
                                //     //               order: orders[i],
                                //     //               orderDetails:
                                //     //                   orders[i].cartItems,
                                //     //             )));
                                //   },
                                //   child: Container(
                                //     width:
                                //         MediaQuery.of(context).size.width / 3.5,
                                //     height:
                                //         MediaQuery.of(context).size.height / 18,
                                //     decoration: BoxDecoration(
                                //       color: Colors.deepPurple.shade300,
                                //       borderRadius: BorderRadius.circular(50),
                                //       border: Border.all(
                                //         color: Colors.deepPurple.shade300,
                                //         width: 2,
                                //       ),
                                //     ),
                                //     child: const Center(
                                //       child: Text(
                                //         "Accept Booking",
                                //         style: TextStyle(
                                //           color: Colors.white,
                                //           fontSize: 15,
                                //           fontWeight: FontWeight.bold,
                                //           letterSpacing: 1,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
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

  // Future<void> _updateBookingOrder(int id, String status) async {
  //   int responseStatus = await BookingApi.changeStatusBooking(id, status);
  //   String alert = "Cancel";
  //   if (status != 'cancel') {
  //     alert = 'Accept';
  //   }
  //   if (responseStatus == 202) {
  //     // Booking order was created successfully, show a success message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('${alert} Booking Successfully!')),
  //     );
  //   } else if (responseStatus == 409) {
  //     // Booking order creation failed, show an error message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('The booking is conflict with another')),
  //     );
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Failed to cancel booking')),
  //     );
  //   }
  //   _reloadPage;
  // }

  // void fetchBooking(int userId, String status) async {
  //   final listBookings = await BookingApi.fetchBooking(userId, status);
  //   setState(() {
  //     bookings = listBookings;
  //   });
  // }
}
