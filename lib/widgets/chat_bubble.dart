import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.04,
          top: size.width * 0.04,
          bottom: size.width * 0.04,
          right: size.width * 0.08,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.04,
          vertical: size.height * 0.01,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width * 0.08),
            topRight: Radius.circular(size.width * 0.08),
            bottomRight: Radius.circular(size.width * 0.08),
          ),
          color: kPrimaryColor,
        ),
        child: Text(
          message.message,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.width * 0.04,
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          left: size.width * 0.04,
          top: size.width * 0.04,
          bottom: size.width * 0.04,
          right: size.width * 0.08,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: kSecondaryColor,
        ),
        child: Text(
          message.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
