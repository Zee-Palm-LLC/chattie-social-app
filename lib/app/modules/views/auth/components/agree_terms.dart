import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgreeTerms extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  const AgreeTerms({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          margin: EdgeInsets.only(top: 2.h),
          child: Checkbox(
            value: value,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2.r),
            ),
            side: BorderSide(width: 0.5.w),
            onChanged: onChanged,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By continuing , you agree to the ',
              style: AppTypography.kLight14.copyWith(color: Colors.grey),
              children: [
                TextSpan(
                  text: 'Terms of Service',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: AppTypography.kLight14.copyWith(
                    color: Colors.orange,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' & ',
                  style: AppTypography.kLight14.copyWith(color: Colors.black),
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  recognizer: TapGestureRecognizer()..onTap = () {},
                  style: AppTypography.kLight14.copyWith(
                    color: Colors.orange,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
