import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/model/chat_model.dart';
import 'package:chatie/app/modules/views/chat/components/chat_bubble.dart';
import 'package:chatie/app/modules/views/chat/components/scroll_controller_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConversationView extends StatefulWidget {
  final ChatModel chat;
  const ConversationView({
    required this.chat,
    super.key,
  });

  @override
  State<ConversationView> createState() => _ConversationViewState();
}

class _ConversationViewState extends State<ConversationView> {
  final ScrollController _scrollController = ScrollController();
  bool showToBottomButton = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        setState(() {
          showToBottomButton = true;
        });
      } else if (_scrollController.offset <=
          _scrollController.position.minScrollExtent) {
        setState(() {
          showToBottomButton = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chat = widget.chat;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.chat.name, style: AppTypography.kBold18),
        actions: [
          CircleAvatar(
            radius: 25.r,
            backgroundColor: chat.imageURL == null ? Colors.orange : null,
            child: chat.imageURL == null
                ? Text(
                    chat.name[0],
                    style: AppTypography.kBold18.copyWith(color: Colors.white),
                  )
                : Hero(
                    tag: widget.chat.name,
                    child:
                        ClipOval(child: Image.network(widget.chat.imageURL!)),
                  ),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          ListView.separated(
            controller: _scrollController,
            padding: EdgeInsets.only(
              left: AppSpacing.twentyHorizontal,
              right: AppSpacing.twentyHorizontal,
              bottom: 100.h,
            ),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ChatBubble(
                chat: messages[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemCount: messages.length,
            reverse: true,
          ),
          Positioned(
            top: 10.h,
            child: Visibility(
              visible: showToBottomButton,
              child: ScrollControllerButton(
                onTap: () {
                  _scrollController.animateTo(
                    _scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomSheet: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.0.w,
          bottom: 20.h,
        ),
        child: TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide.none,
            ),
            hintText: 'Send a message',
          ),
        ),
      ),
    );
  }
}
