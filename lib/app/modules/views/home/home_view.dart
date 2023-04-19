import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:chatie/app/modules/views/chat/all_conversation_view.dart';
import 'package:chatie/app/modules/views/home/components/animated_icon_button.dart';
import 'package:chatie/app/modules/views/home/components/feed_card.dart';
import 'package:chatie/app/modules/views/home/components/story_card.dart';
import 'package:chatie/app/modules/views/post/share_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.25,
        automaticallyImplyLeading: false,
        title: Image.asset(
          AppAssets.kChattieLogo,
          height: 40.0.h,
          width: 120.w,
          fit: BoxFit.cover,
        ),
        actions: [
          AnimatedIconButton(
            onTap: () => Get.to<Widget>(() => const AllConversationView()),
          ),
          SizedBox(
            width: AppSpacing.twentyHorizontal,
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          debugPrint('Refresh');
        },
        child: ListView(
          children: [
            SizedBox(height: AppSpacing.twentyVertical),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(AppAssets.kAvatar1),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.to<Widget>(
                          () => const SharePost(),
                          transition: Transition.downToUp,
                        );
                      },
                      child: Container(
                        height: 45.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: AppSpacing.tenHorizontal,
                        ),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: isDarkMode(context)
                              ? AppColors.kGrey
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                        ),
                        child: Text(
                          "What's on your mind?",
                          style: AppTypography.kBold14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 240.h,
              child: Container(
                color: isDarkMode(context) ? AppColors.kGrey : Colors.white,
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: AppSpacing.twentyHorizontal),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10.w,
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) => const StoryCard(),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.w,
              ),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) => const FeedCard(),
            ),
          ],
        ),
      ),
    );
  }
}
