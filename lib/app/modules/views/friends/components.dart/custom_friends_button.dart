import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFriendsButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double? radius;
  final Color? color;
  const CustomFriendsButton({
    required this.onTap,
    required this.text,
    this.color,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xffEBECF0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 30.r),
        ),
      ),
      child: Text(
        text,
        style: AppTypography.kLight14.copyWith(
          fontSize: 12.sp,
          color: color == null ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
