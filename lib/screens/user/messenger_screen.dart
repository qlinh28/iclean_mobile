import 'package:flutter/material.dart';
import 'package:iclean_flutter/models/inbox.dart';

class MessengerScreen extends StatefulWidget {
  final Inbox inbox;
  const MessengerScreen({Key? key, required this.inbox}) : super(key: key);

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  List<Map<String, dynamic>> messages = [
    {"message": "Hello", "isMe": true},
    {"message": "Hi, how are you?", "isMe": false},
    {"message": "I'm good, thanks!", "isMe": true},
    {"message": "Great!", "isMe": false},
    {"message": "Bye!", "isMe": true},
    {"message": "Hello", "isMe": true},
    {"message": "Hi, how are you?", "isMe": false},
    {"message": "I'm good, thanks!", "isMe": true},
    {"message": "Great!", "isMe": false},
    {"message": "Bye!", "isMe": true},
    {"message": "Hello", "isMe": true},
    {"message": "Hi, how are you?", "isMe": false},
    {"message": "I'm good, thanks!", "isMe": true},
    {"message": "Great!", "isMe": false},
    {"message": "Bye!", "isMe": true},
    {"message": "Hello", "isMe": true},
    {"message": "Hi, how are you?", "isMe": false},
    {"message": "I'm good, thanks!", "isMe": true},
    {"message": "Great!", "isMe": false},
    {"message": "Bye!", "isMe": true},
  ];

  TextEditingController _textEditingController = TextEditingController();

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        messages.add({"message": message, "isMe": true});
      });
      _textEditingController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.inbox.image),
                    radius: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.inbox.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lato',
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages[index];
                    return Align(
                      alignment: message["isMe"]
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        decoration: BoxDecoration(
                          color:
                              message["isMe"] ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          message["message"],
                          style: TextStyle(
                            color:
                                message["isMe"] ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        hintText: "Type a message",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      _sendMessage(_textEditingController.text);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
