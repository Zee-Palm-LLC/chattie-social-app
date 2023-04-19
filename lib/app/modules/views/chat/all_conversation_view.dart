import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/model/chat_model.dart';
import 'package:chatie/app/modules/views/chat/components/all_chat_card.dart';
import 'package:chatie/app/modules/views/chat/conversation_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AllConversationView extends StatelessWidget {
  const AllConversationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back<void>();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text('All Chats', style: AppTypography.kLight14),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        physics: const BouncingScrollPhysics(),
        itemCount: chatList.length,
        separatorBuilder: (context, index) => SizedBox(height: 10.h),
        itemBuilder: (context, index) {
          return AllChatCard(
            onTap: () {
              Get.to<Widget>(() => ConversationView(
                    chat: chatList[index],
                  ));
            },
            chat: chatList[index],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
