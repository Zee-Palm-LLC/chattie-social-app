import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLikeNotification extends StatelessWidget {
  final NotificationModel notifications;
  final VoidCallback onMoreTap;
  const CustomLikeNotification({
    required this.notifications,
    required this.onMoreTap,
    Key? key,
  }) : super(key: key);

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
                  text: ' liked your photo!',
                  style: AppTypography.kLight14.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.0.w),
        Container(
          height: 60.h,
          width: 60.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            image: DecorationImage(
              image: AssetImage(notifications.likePostImage!),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
