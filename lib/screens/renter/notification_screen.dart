import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/noti.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Noti> notis = [];

  @override
  void initState() {
    super.initState();
    //fetchNoti();
  }

  // Future<void> fetchNoti() async {
  //   final listNotis = await NotiAPI.fetchNotification(widget.account.id);
  //   setState(() {
  //     if (listNotis != null) {
  //       notis = listNotis;
  //       notis.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  //     } else {}
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                for (int i = 0; i < notis.length; i++)
                  InkWell(
                    onTap: () {
                      setState(() {
                        notis[i].read = true;
                      });
                    },
                    child: Container(
                      color: notis[i].read ? Colors.white : Colors.blue.shade50,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          if (notis[i].status == "unconfirm" ||
                              notis[i].status == "undone")
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 13.0,
                                backgroundColor: Colors.deepPurple.shade200,
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          if (notis[i].status == "done")
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.shade100,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 13.0,
                                backgroundColor: Colors.greenAccent.shade200,
                                child: const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          if (notis[i].status == "cancel")
                            Container(
                              padding: const EdgeInsets.all(4.5),
                              decoration: BoxDecoration(
                                color: Colors.lightBlue.shade50,
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.lightBlue.shade50,
                                child: const Icon(
                                  Icons.cancel,
                                  color: Colors.redAccent,
                                  size: 30,
                                ),
                              ),
                            ),
                          const SizedBox(width: 15),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  notis[i].details,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  DateFormat('MMM d, yyyy | hh:mm aaa')
                                      .format(notis[i].timestamp),
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontFamily: 'Lato',
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
