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

class _PendingCardState extends State<PendingCard> {
  List<Booking> bookings = [
    Booking(
        id: 1,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Lisa1",
        status: "pending",
        workTime: DateTime.august,
        timestamp: DateTime.now(),
        price: 1000000000,
        location: "Thái Lan",
        jobId: 1,
        jobName: "Singer",
        description: "1233321123321",
        jobImage: "assets/images/lisa_avatar.jpg"),
    Booking(
        id: 2,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Lisa2",
        status: "pending",
        workTime: DateTime.august,
        timestamp: DateTime.now(),
        price: 1000000000,
        location: "Thái Lan",
        jobId: 1,
        jobName: "Singer",
        description: "1233321123321",
        jobImage: "assets/images/lisa_avatar.jpg"),
    Booking(
        id: 3,
        userId: 1,
        usename: "Linh",
        empId: 1,
        empName: "Lisa3",
        status: "pending",
        workTime: DateTime.august,
        timestamp: DateTime.now(),
        price: 1000000000,
        location: "Thái Lan",
        jobId: 1,
        jobName: "Singer",
        description: "1233321123321",
        jobImage: "assets/images/lisa_avatar.jpg"),
  ];
  late List<bool> _isExpanded = List.filled(bookings.length, false);

  void _reloadPage() {
    setState(() {
      bookings = [];
    });
    // fetchBooking(widget.userId, widget.status);
  }

  @override
  void initState() {
    super.initState;
    //fetchBooking(widget.userId, widget.status);
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
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: _isExpanded[i] ? 280 : 165,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 15, top: 15),
                    child: Row(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Divider(
                      thickness: 1,
                      color: Colors.grey[400],
                    ),
                  ),
                  Visibility(
                    visible: _isExpanded[i],
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 3),
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
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50),
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
                              ),
                            ],
                          ),
                          const SizedBox(height: 0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () async {
                                  // await _updateBookingOrder(
                                  //     bookings[i].id, 'cancel');
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 2.6,
                                  height:
                                      MediaQuery.of(context).size.height / 20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        color: Colors.deepPurple.shade300,
                                        width: 2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cancel booking",
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade300,
                                          fontSize: 15,
                                          fontFamily: 'Lato',
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1),
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
                              //         MediaQuery.of(context).size.width / 2.6,
                              //     height:
                              //         MediaQuery.of(context).size.height / 20,
                              //     decoration: BoxDecoration(
                              //       color: Colors.deepPurple.shade300,
                              //       borderRadius: BorderRadius.circular(50),
                              //       border: Border.all(
                              //           color: Colors.deepPurple.shade300,
                              //           width: 2),
                              //     ),
                              //     child: const Center(
                              //       child: Text(
                              //         "Accept Booking",
                              //         style: TextStyle(
                              //             color: Colors.white,
                              //             fontSize: 15,
                              //             fontWeight: FontWeight.bold,
                              //             letterSpacing: 1),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  ),
                  Icon(_isExpanded[i]
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down)
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
