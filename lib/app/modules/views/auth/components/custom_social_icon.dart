import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSocialIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String icons;
  const CustomSocialIcon({
    required this.onPressed,
    required this.icons,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 43.h,
        width: 43.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(icons),
      ),
    );
  }
}
