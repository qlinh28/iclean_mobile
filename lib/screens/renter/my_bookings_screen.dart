
import 'package:flutter/material.dart';
import 'package:iclean_flutter/screens/renter/components/my_booking/cancelled_card.dart';
import 'package:iclean_flutter/screens/renter/components/my_booking/completed_card.dart';
import 'package:iclean_flutter/screens/renter/components/my_booking/pending_card.dart';
import 'package:iclean_flutter/screens/renter/components/my_booking/upcoming_card.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    _tabController.addListener((_handleTabSelection));
    super.initState();
  }

//   Future<int> _getUserId() async {
//     final storage = FlutterSecureStorage();
//     final jsonString = await storage.read(key: 'account');

// // Convert JSON string to object
//     final accountJson = jsonDecode(jsonString!);
//     final account = Account.fromJson(accountJson);
//     return account.id;
//   }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                    "My Booking",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.bold,
                    ),
              ),
              
              TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.deepPurple.shade300,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(
                          width: 2, color: Colors.deepPurple.shade300)),
                  tabs: const [
                    Tab(text: 'Pending'),
                    Tab(text: 'Upcoming'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ]),
              Container(
                  child: [
                FutureBuilder<int>(
                  //future: _getUserId(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return PendingCard(
                          status: 'unconfirm', userId: snapshot.data!);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder<int>(
                  //future: _getUserId(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return UpcomingCard(
                          status: 'undone', userId: snapshot.data!);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder<int>(
                  //future: _getUserId(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return CompletedCard(
                          status: 'done', userId: snapshot.data!);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder<int>(
                  //future: _getUserId(),
                  builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                    if (snapshot.hasData) {
                      return CancelledCard(
                          status: 'cancel', userId: snapshot.data!);
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ][_tabController.index])
            ],
          ),
        )),
      ),
    );
  }
}
