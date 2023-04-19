import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String icon;
  final String text;
  final Color color;
  final Color fontColor;
  const SocialButton({
    required this.fontColor,
    required this.color,
    required this.onPressed,
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MaterialButton(
        elevation: 10,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        onPressed: onPressed,
        color: color,
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
        child: Row(
          children: [
            SvgPicture.asset(icon, height: 30.h, width: 30.w),
            const Spacer(),
            Text(
              text,
              style: AppTypography.kBold18.copyWith(color: fontColor),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
