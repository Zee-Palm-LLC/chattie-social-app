import 'package:chatie/app/data/constants/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Logout confirmation',
            style: AppTypography.kBold22,
          ),
          SizedBox(height: 10.h),
          Text(
            'Would you like to log out and return to the login screen?',
            style: AppTypography.kLight14,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          Divider(
            height: 0.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Semantics(
                  button: true,
                  child: InkWell(
                    onTap: () {
                      Get.back<void>();
                    },
                    child: Container(
                      height: 50.0.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Cancel',
                        style: AppTypography.kBold16,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 50.00.h,
                width: 0.25.w,
                color: Colors.grey,
              ),
              Expanded(
                child: Semantics(
                  button: true,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.01.h,
                      alignment: Alignment.center,
                      child: Text(
                        'Logout',
                        style:
                            AppTypography.kBold16.copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
