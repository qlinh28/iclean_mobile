import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/noti.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Noti> notis = [
    Noti(
        id: 1,
        details: "Đơn #00834 của bạn đang được duyệt từ nhân viên",
        status: 'unconfirm',
        timestamp: DateTime.now(),
        deleted: false,
        read: false),
    Noti(
        id: 2,
        details:
            "Đơn #98956 của bạn đã được xác nhận, vui lòng chờ nhân viên của chúng tôi!",
        status: 'undone',
        timestamp: DateTime.now(),
        deleted: false,
        read: false),
    Noti(
        id: 3,
        details:
            "Công việc thuộc đơn #98442 đã được hoàn thành, bạn có thể đánh giá dịch vụ của chúng tôi!",
        status: 'done',
        timestamp: DateTime.now(),
        deleted: false,
        read: false),
    Noti(
        id: 4,
        details: "Đơn #95242 đã bị hủy từ nhân viên",
        status: 'cancel',
        timestamp: DateTime.now(),
        deleted: false,
        read: false),
  ];

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
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Row(
                  children: const [
                    Text(
                      "Notification",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lato',
                      ),
                    ),
                  ],
                ),
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
                        decoration: BoxDecoration(
                          color: notis[i].read
                              ? Colors.white
                              : Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    notis[i].details,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontFamily: 'Lato',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    DateFormat('MMM d, yyyy | hh:mm aaa')
                                        .format(notis[i].timestamp),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Lato',
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
