import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/model/notification_model.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFollowNotification extends StatelessWidget {
  final NotificationModel notifications;
  final VoidCallback followCallback;
  const CustomFollowNotification({
    required this.notifications,
    required this.followCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundImage: NetworkImage(notifications.senderImage),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: notifications.senderName,
              style: AppTypography.kBold14,
              children: [
                TextSpan(
                  text: ' started following you. follow back to connect!',
                  style: AppTypography.kLight14.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.0.w),
        PrimaryButton(
          onTap: followCallback,
          text: 'Follow',
          height: 40.h,
          width: 80.w,
          fontSize: 14.sp,
          borderRadius: 5.r,
        ),
      ],
    );
  }
}
