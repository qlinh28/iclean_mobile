import 'package:flutter/material.dart';
import 'package:iclean_flutter/services/booking_api.dart';
import 'package:intl/intl.dart';

import '../../../../models/bookings.dart';

class UpcomingCard extends StatefulWidget {
  final int status;
  // final int userId;

  const UpcomingCard({Key? key, required this.status}) : super(key: key);

  @override
  State<UpcomingCard> createState() => _UpcomingCardState();
}

class _UpcomingCardState extends State<UpcomingCard>
    with TickerProviderStateMixin {
  List<Booking> bookings = [
    // Booking(
    //     id: 1,
    //     userId: 1,
    //     usename: "Linh",
    //     empId: 1,
    //     empName: "Nguyễn Văn Đạt",
    //     status: "upcoming",
    //     workTime: DateTime.august,
    //     timestamp: DateTime.now(),
    //     price: 1000000000,
    //     location: "Thủ Đức, Thành phố Hồ Chí Minh",
    //     jobId: 1,
    //     jobName: "Giặt ủi",
    //     description: "1233321123321",
    //     jobImage: "assets/images/1.jpg"),
    // Booking(
    //     id: 2,
    //     userId: 1,
    //     usename: "Linh",
    //     empId: 1,
    //     empName: "Nguyễn Đăng Khoa",
    //     status: "upcoming",
    //     workTime: DateTime.august,
    //     timestamp: DateTime.now(),
    //     price: 1000000000,
    //     location: "Thủ Đức, Thành phố Hồ Chí Minh",
    //     jobId: 1,
    //     jobName: "Decor",
    //     description: "1233321123321",
    //     jobImage: "assets/images/2.png"),
    // Booking(
    //     id: 3,
    //     userId: 1,
    //     usename: "Linh",
    //     empId: 1,
    //     empName: "Lê Thúy Ngân",
    //     status: "upcoming",
    //     workTime: DateTime.august,
    //     timestamp: DateTime.now(),
    //     price: 1000000000,
    //     location: "Thủ Đức, Thành phố Hồ Chí Minh",
    //     jobId: 1,
    //     jobName: "Nấu ăn",
    //     description: "1233321123321",
    //     jobImage: "assets/images/3.png"),
  ];
  late final List<bool> _isExpanded = List.filled(bookings.length, false);

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
                                  "Upcoming",
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

  void fetchBooking(int status) async {
    final listBookings = await BookingApi.fetchBookingByStatus(status);
    setState(() {
      bookings = listBookings;
    });
  }
}
