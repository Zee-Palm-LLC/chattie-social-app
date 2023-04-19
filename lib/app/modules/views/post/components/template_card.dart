import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TemplateCard extends StatelessWidget {
  final String image;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final double fontSize;
  final bool isText;
  final String text;
  const TemplateCard({
    required this.image,
    required this.controller,
    required this.fontSize,
    required this.isText,
    required this.text,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      padding: EdgeInsets.all(20.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: isText
            ? Text(
                text,
                style: AppTypography.kBold32
                    .copyWith(fontSize: fontSize, color: Colors.white),
              )
            : TextField(
                controller: controller,
                maxLines: 2,
                onChanged: onChanged,
                cursorColor: Colors.transparent,
                textAlignVertical: TextAlignVertical.center,
                style: AppTypography.kBold32
                    .copyWith(color: Colors.white, fontSize: fontSize.sp),
                decoration: InputDecoration(
                  filled: false,
                  hintText: "What's on your mind?",
                  hintStyle:
                      TextStyle(color: Colors.black26, fontSize: fontSize.sp),
                  focusedBorder: InputBorder.none,
                ),
              ),
      ),
    );
  }
}
