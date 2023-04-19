import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileHeader extends StatelessWidget {
  final VoidCallback onTap;
  const ProfileHeader({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: isDarkMode(context) ? AppColors.kGrey : Colors.white,
        padding: EdgeInsets.symmetric(
          vertical: AppSpacing.twentyVertical,
          horizontal: AppSpacing.twentyHorizontal,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50.r,
              backgroundColor: Colors.grey[200],
              backgroundImage: const NetworkImage(
                'https://randomuser.me/api/portraits/men/81.jpg',
              ),
            ),
            SizedBox(
              width: AppSpacing.twentyHorizontal,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Eduardo Hernandez',
                  style: AppTypography.kBold22,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Berkeley, California',
                  style: AppTypography.kLight14.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
