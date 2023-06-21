import 'package:flutter/material.dart';
import 'package:iclean_flutter/constant/gobal_variable.dart';
import 'package:iclean_flutter/models/message.dart';
import 'package:intl/intl.dart';

class mess_card extends StatelessWidget {
  const mess_card({
    Key? key,
    required ScrollController scrollController,
    required this.messages,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: messages.length,
            itemBuilder: (BuildContext context, int index) {
              final message = messages[index];
              final isMe = message.isMe;
              final messageWidget = Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(
                  gradient: isMe ? BaseConfig.myGradient : null,
                  color: !isMe ? Colors.grey[300] : null,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message.message,
                      style: TextStyle(
                        fontFamily: 'Lato',
                        color: isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
              final timeWidget = Text(
                DateFormat.Hm().format(message.timestamp),
                style: const TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 10,
                  color: Colors.grey,
                ),
              );
              return isMe
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        timeWidget,
                        const SizedBox(width: 10),
                        messageWidget,
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        messageWidget,
                        const SizedBox(width: 10),
                        timeWidget,
                      ],
                    );
            },
          )),
    );
  }
}
