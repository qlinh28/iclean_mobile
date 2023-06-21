import 'package:flutter/material.dart';
import 'package:iclean_flutter/constant/gobal_variable.dart';
import 'package:iclean_flutter/models/inbox.dart';
import 'package:iclean_flutter/models/message.dart';

import 'component/message/mess_card.dart';

class MessengerScreen extends StatefulWidget {
  final Inbox inbox;
  const MessengerScreen({Key? key, required this.inbox}) : super(key: key);

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  List<Message> messages = [
    Message(message: "Hello", isMe: true, timestamp: DateTime.now()),
    Message(
        message: "Hi, how are you?", isMe: false, timestamp: DateTime.now()),
    Message(
        message: "I'm good, thanks!", isMe: true, timestamp: DateTime.now()),
    Message(message: "Great!", isMe: false, timestamp: DateTime.now()),
    Message(message: "Bye!", isMe: true, timestamp: DateTime.now()),
    Message(message: "Hello", isMe: true, timestamp: DateTime.now()),
    Message(
        message: "Hi, how are you?", isMe: false, timestamp: DateTime.now()),
    Message(
        message: "I'm good, thanks!", isMe: true, timestamp: DateTime.now()),
    Message(message: "Great!", isMe: false, timestamp: DateTime.now()),
    Message(message: "Bye!", isMe: true, timestamp: DateTime.now()),
    Message(message: "Hello", isMe: true, timestamp: DateTime.now()),
    Message(
        message: "Hi, how are you?", isMe: false, timestamp: DateTime.now()),
    Message(
        message: "I'm good, thanks!", isMe: true, timestamp: DateTime.now()),
    Message(message: "Great!", isMe: false, timestamp: DateTime.now()),
    Message(message: "Bye!", isMe: true, timestamp: DateTime.now()),
  ];

  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  bool _shouldScrollToBottom = true;

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      final newMessage = Message(
        message: message,
        isMe: true,
        timestamp: DateTime.now(),
      );
      setState(() {
        messages.add(newMessage);
      });
      _textEditingController.clear();

      // Scroll to the position of the newly sent message
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent + 100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _scrollToLatestMessage() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _shouldScrollToBottom = true;
      } else {
        _shouldScrollToBottom = false;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToLatestMessage();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            mess_card(scrollController: _scrollController, messages: messages),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: BaseConfig.BASE_COLOR),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.only(left: 20),
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                      color: BaseConfig.BASE_COLOR,
                    ),
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
