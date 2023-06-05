import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/inbox.dart';
import 'package:iclean_flutter/screens/user/messenger.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  List<Inbox> inboxs = [
    Inbox(
        userId: 1,
        name: "Lisa1",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcd",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 2,
        name: "Lisa2",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcde",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 3,
        name: "Lisa3",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
    Inbox(
        userId: 4,
        name: "Lisa1",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcd",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 5,
        name: "Lisa2",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcde",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 6,
        name: "Lisa3",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
    Inbox(
        userId: 7,
        name: "Lisa1",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcd",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 8,
        name: "Lisa2",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcde",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 9,
        name: "Lisa3",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 2),
    Inbox(
        userId: 10,
        name: "Lisa1",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcd",
        timestamp: DateTime.now(),
        read: true,
        unreadMess: 0),
    Inbox(
        userId: 11,
        name: "Lisa2",
        image: "assets/images/lisa_avatar.jpg",
        newestMess: "abcde",
        timestamp: DateTime.now(),
        read: false,
        unreadMess: 3),
    Inbox(
        userId: 12,
        name: "Lisa3",
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
