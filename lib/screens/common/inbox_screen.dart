import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/inbox.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'messenger_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<Inbox> inboxs = [
    Inbox(
        userId: 1,
        name: "Nguyễn Thị Thùy",
        image: "assets/images/1.jpg",
        newestMess: "Oke bạn nhé!",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 2,
        name: "Nguyễn Việt Hoàng",
        image: "assets/images/2.png",
        newestMess: "Có gì bạn đánh giá 5 sao giúp mình nha!",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 3,
        name: "Đỗ Minh Quân",
        image: "assets/images/3.png",
        newestMess: "Giờ đó mình bận rồi bạn tìm người khác nhé!",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
    Inbox(
        userId: 4,
        name: "Đỗ Hải Triều",
        image: "assets/images/4.png",
        newestMess: "Vậy mình chốt ngày mai nha!",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 5,
        name: "Lê Trần Thúy Vy",
        image: "assets/images/5.jpg",
        newestMess: "Bạn ở đâu nhỉ?",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 6,
        name: "Nguyễn Văn Đạt",
        image: "assets/images/6.png",
        newestMess: "Bạn có sẵn đồ làm chưa ạ?",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
    Inbox(
        userId: 7,
        name: "Mai Thúy",
        image: "assets/images/7.jpg",
        newestMess: "Giờ đó mình có đơn rồi",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 8,
        name: "Nguyễn Văn A",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcde",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 9,
        name: "Nguyễn Văn B",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
    Inbox(
        userId: 10,
        name: "Nguyễn Văn C",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcd",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 11,
        name: "Nguyễn Văn D",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcde",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 12,
        name: "Nguyễn Văn E",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20, bottom: 10),
            child: Text(
              "Inbox",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, right: 20, bottom: 10),
            child: Icon(Icons.search_outlined, size: 30),
          ),
        ]),
        Expanded(
          child: ListView(
            children: [
              for (int i = 0; i < inboxs.length; i++)
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MessengerScreen(inbox: inboxs[i])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  // NetworkImage(feedback[i].profilePicture),
                                  AssetImage(inboxs[i].image),
                              radius: 28,
                            ),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 210,
                                      child: Text(
                                        inboxs[i].name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          fontFamily: 'Lato',
                                        ),
                                      ),
                                    ),
                                    if (inboxs[i].read == false)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          const SizedBox(width: 60.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.deepPurple.shade300,
                                            ),
                                            child: CircleAvatar(
                                              radius: 15,
                                              backgroundColor:
                                                  Colors.transparent,
                                              child: Text(
                                                inboxs[i].unreadMess.toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                  ],
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        inboxs[i].newestMess,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: inboxs[i].read
                                                ? Colors.grey[700]
                                                : Colors.grey[800],
                                            fontFamily: 'Lato',
                                            fontWeight: inboxs[i].read
                                                ? FontWeight.normal
                                                : FontWeight.w700,
                                            height: 1.7),
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 100,
                                      child: Text(
                                        // DateFormat('MMM d, yyyy | hh:mm aaa')
                                        //     .format(inboxs[i].timestamp),
                                        // DateFormat('MMM d, yyyy')
                                        //     .format(inboxs[i].timestamp),
                                        timeago.format(inboxs[i].timestamp),
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            height: 1.7),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    )));
  }
}
