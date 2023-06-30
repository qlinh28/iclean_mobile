// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iclean_flutter/dto/order_dto.dart';
import 'package:iclean_flutter/models/profile.dart';
import 'package:iclean_flutter/screens/common/user_preferences.dart';
import 'package:iclean_flutter/services/booking_api.dart';
import 'package:iclean_flutter/services/user_api.dart';
import 'package:intl/intl.dart';

import '../../models/account.dart';
import '../../models/services.dart';
import 'components/summary/successful_booking_dialog.dart';

class SummaryScreen extends StatefulWidget {
  final Service service;
  final Profile profile;
  final Account account;
  final int hour;
  final int discount;
  final DateTime workDateTime;
  const SummaryScreen(
      {Key? key,
      required this.service,
      required this.profile,
      required this.hour,
      required this.account,
      required this.discount,
      required this.workDateTime})
      : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  Future<void> _makeBooking() async {
    OrderDto orderDto = OrderDto(
        jobId: widget.service.id,
        employeeId: widget.profile.employeeId,
        renterId: 0,
        workDateTime: widget.workDateTime,
        serviceName: widget.service.name,
        workerName: widget.profile.employeeName,
        orderDate: DateTime.now(),
        workingHour: widget.hour,
        sum: widget.profile.price * widget.hour - widget.discount,
        totalNotDiscount: widget.profile.price * widget.hour,
        discount: widget.discount);
    String bookingCode =
        '${widget.profile.employeeId}${widget.profile.jobId}${widget.profile.employeeId}${widget.account.id}${widget.hour}';
    bool? check = await _handleAddNewOrder(orderDto);
    if (check!) {
      showDialog(
        context: context,
        builder: (BuildContext context) => BookingSuccessDialog(
          bookingCode: bookingCode,
          orderDto: orderDto,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 20),
                  const Text(
                    "Review Summary",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Service",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              widget.profile.jobName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Worker",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              widget.profile.employeeName,
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Date & Time",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              DateFormat('MMM d, yyyy | hh:mm aaa')
                                  .format(DateTime.now()),
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Working Hours",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            widget.hour.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "House Cleaning",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              "${NumberFormat('#,###').format(widget.profile.price * widget.hour)} VNĐ",
                              style: const TextStyle(
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Promo',
                              style: TextStyle(
                                color: Colors.deepPurple.shade300,
                                fontSize: 15,
                                fontFamily: 'Lato',
                              ),
                            ),
                            Text(
                              widget.discount.toString(),
                              style: TextStyle(
                                color: Colors.deepPurple.shade300,
                                fontSize: 15,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Total",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                            ),
                          ),
                          Text(
                            "${NumberFormat('#,###').format(widget.profile.price * widget.hour - widget.discount)} VNĐ",
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                _makeBooking();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 16,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade300,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Center(
                  child: Text(
                    "Confirm Payment",
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

  Future<void> _updateMoney(int newMoney) async {
    await UserApi.updateMoneyByUserId(newMoney);
  }

  Future<bool?> _handleAddNewOrder(OrderDto orderDto) async {
    int statusCode = await BookingApi.createBooking(orderDto);
    if (statusCode == 200) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Add booking success!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      Account? account = await UserPreferences.getUserInfomation();
      int updateMoney = account!.point - orderDto.sum;
      await _updateMoney(updateMoney);
      return true;
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Some error occur!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return false;
    }
  }
}
