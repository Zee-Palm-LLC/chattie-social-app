import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/enums/notification_type.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:chatie/app/model/notification_model.dart';
import 'package:chatie/app/modules/views/notifications/components/custom_follow_notification.dart';
import 'package:chatie/app/modules/views/notifications/components/custom_like_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AppTypography.kBold18,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Text(
                'Recent',
                style: AppTypography.kBold16,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ColoredBox(
              color: isDarkMode(context) ? AppColors.kGrey : Colors.white,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                  vertical: AppSpacing.twentyVertical,
                ),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return notifications[index].notificationType ==
                          NotificationType.follow
                      ? CustomFollowNotification(
                          followCallback: () {},
                          notifications: notifications[index],
                        )
                      : CustomLikeNotification(
                          onMoreTap: () {},
                          notifications: notifications[index],
                        );
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: Text(
                'Recent',
                style: AppTypography.kBold16,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ColoredBox(
              color: isDarkMode(context) ? AppColors.kGrey : Colors.white,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.twentyHorizontal,
                  vertical: AppSpacing.twentyVertical,
                ),
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  return notifications[index].notificationType ==
                          NotificationType.follow
                      ? CustomFollowNotification(
                          followCallback: () {},
                          notifications: notifications[index],
                        )
                      : CustomLikeNotification(
                          onMoreTap: () {},
                          notifications: notifications[index],
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
