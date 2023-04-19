// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/model/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatefulWidget {
  final ChatMessage chat;
  const ChatBubble({
    required this.chat,
    Key? key,
  }) : super(key: key);

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    final message = widget.chat.messageContent;
    return widget.chat.messageType == 'sender'
        ? Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.twentyHorizontal,
                vertical: 17.h,
              ),
              constraints: BoxConstraints(maxWidth: 315.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.twentyRadius),
                  bottomLeft: Radius.circular(AppSpacing.twentyRadius),
                  topRight: Radius.circular(AppSpacing.twentyRadius),
                ),
                color: Colors.orange,
              ),
              child: Text(
                message,
                style: AppTypography.kLight14.copyWith(color: Colors.white),
              ),
            ),
          )
        : Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.twentyHorizontal,
                vertical: 17.0.h,
              ),
              constraints: BoxConstraints(maxWidth: 315.0.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppSpacing.twentyRadius),
                  topRight: Radius.circular(AppSpacing.twentyRadius),
                  bottomRight: Radius.circular(AppSpacing.twentyRadius),
                ),
                color: Colors.grey.shade100,
              ),
              child: Text(
                message,
                style: AppTypography.kLight14,
              ),
            ),
          );
  }
}
