import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/inbox.dart';

class MessengerScreen extends StatelessWidget {
  final Inbox inbox;
  const MessengerScreen({Key? key, required this.inbox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundImage: AssetImage(inbox.image),
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  inbox.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Lato',
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
