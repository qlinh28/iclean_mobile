// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/account.dart';
import 'package:iclean_flutter/screens/common/user_preferences.dart';
import 'package:iclean_flutter/screens/user/payment_screen.dart';
import 'package:iclean_flutter/screens/user/summary_screen.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/profile.dart';
import '../../models/services.dart';
import '../../services/user_api.dart';

class BookingDetailsScreen extends StatefulWidget {
  final Profile profile;

  final Service service;

  const BookingDetailsScreen(
      {Key? key, required this.profile, required this.service})
      : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  DateTime today = DateTime.now();
  int _counter = 1;
  TimeOfDay _selectedTime = TimeOfDay.now();
  late int money;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  Future<void> _refreshData() async {
    await setMoney();
    setState(() {});
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter >= 1) {
      setState(() {
        _counter--;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    setMoney();
  }

  Future<void> setMoney() async {
    int currmoney = await UserApi.fetchMoneyByUserId();
    setState(() {
      money = currmoney;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 25, right: 25),
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
                      const Text(
                        "Booking Details",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Select Date",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.utc(2023),
                      focusedDay: today,
                      lastDay: DateTime.utc(2024),
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleTextStyle: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      daysOfWeekStyle: const DaysOfWeekStyle(
                          weekdayStyle: TextStyle(fontWeight: FontWeight.bold),
                          weekendStyle: TextStyle(fontWeight: FontWeight.bold)),
                      availableGestures: AvailableGestures.all,
                      onDaySelected: _onDaySelected,
                      selectedDayPredicate: (day) => isSameDay(day, today),
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        weekendTextStyle: const TextStyle(color: Colors.black),
                        todayDecoration: BoxDecoration(
                          color: Colors.deepPurple.shade200,
                          shape: BoxShape.circle,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.deepPurple.shade300,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Working Hours",
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Lato',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: Colors.deepPurple.shade100,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: _decrementCounter,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '$_counter',
                              style: const TextStyle(
                                fontSize: 24,
                                fontFamily: 'Lato',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 15.0,
                                backgroundColor: Colors.deepPurple.shade100,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  onPressed: _incrementCounter,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Choose Start Time",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 9, // number of hours
                              itemBuilder: (context, index) {
                                final hour = index + 9; // start at 9:00 AM
                                final time = TimeOfDay(hour: hour, minute: 0);
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedTime = time;
                                    });
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: _selectedTime == time
                                            ? Colors.deepPurple.shade300
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: Colors.deepPurple.shade300,
                                            width: 2),
                                      ),
                                      child: Text(
                                        time.format(context),
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'Lato',
                                          color: _selectedTime == time
                                              ? Colors.white
                                              : Colors.deepPurple.shade300,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "Enter Voucher Code",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Enter your voucher code",
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                    ),
                  ),
                ],
              ),
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
              onTap: () async {
                Account? account = await UserPreferences.getUserInfomation();
                if (money > (widget.profile.price * _counter)) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SummaryScreen(
                                account: account!,
                                discount: 0,
                                workDateTime: DateTime(
                                    today.year,
                                    today.month,
                                    today.day,
                                    _selectedTime.hour,
                                    _selectedTime.minute),
                                hour: _counter,
                                profile: widget.profile,
                                service: widget.service,
                              )));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Out of money!'),
                      content: const Text(
                          'You don\'t have enough money in your account, please top up!'),
                      actions: [
                        TextButton(
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PaymentScreen()))
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
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
                    "Book now",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Lato',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
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
