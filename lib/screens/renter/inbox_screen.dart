import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 30),
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
                  padding: EdgeInsets.only(top: 20, right: 30),
                  child: Icon(Icons.search_outlined, size: 30),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        // NetworkImage(feedback[i].profilePicture),
                        AssetImage('assets/images/lisa_avatar.jpg'),
                    radius: 28,
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Lisa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'Lato',
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "tin nhan gan nhat",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                                fontFamily: 'Lato',
                                height: 1.7),
                            textAlign: TextAlign.justify,
                          ),
                          const Text(
                            // DateFormat('MMM d, yyyy | hh:mm aaa')
                            //     .format(feedback[i].timestamp),
                            "thoi gian",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'Lato',
                                height: 1.7),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ],
        )),
      ),
    );
  }
}
