import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ThemeModeSelection extends StatelessWidget {
  final String currentTheme;
  final ThemeData theme;
  final VoidCallback lightThemeCallback;
  final VoidCallback darkThemeCallback;
  final VoidCallback systemThemeCallback;
  const ThemeModeSelection({
    required this.currentTheme,
    required this.theme,
    required this.lightThemeCallback,
    required this.darkThemeCallback,
    required this.systemThemeCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.grey.shade900 : Colors.grey.shade200,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.twentyRadius),
          topRight: Radius.circular(AppSpacing.twentyRadius),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 2.h,
              width: 70.w,
              color: Colors.grey,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: const Icon(
              Icons.brightness_5,
              color: Colors.blue,
            ),
            title: Text('Light', style: AppTypography.kBold16),
            onTap: lightThemeCallback,
            trailing: Container(
              padding: EdgeInsets.all(5.01.h),
              decoration: BoxDecoration(
                color: currentTheme == 'light'
                    ? Colors.red
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 14.0.sp,
                color:
                    currentTheme == 'light' ? Colors.white : Colors.transparent,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.tenHorizontal),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: const Icon(
              Icons.brightness_2,
              color: Colors.orange,
            ),
            title: Text('Dark', style: AppTypography.kBold16),
            onTap: darkThemeCallback,
            trailing: Container(
              padding: EdgeInsets.all(5.h),
              decoration: BoxDecoration(
                color: currentTheme == 'dark'
                    ? Colors.amber
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 14.sp,
                color:
                    currentTheme == 'dark' ? Colors.white : Colors.transparent,
              ),
            ),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            leading: const Icon(
              Icons.brightness_6,
              color: Colors.blueGrey,
            ),
            title: Text('System', style: AppTypography.kBold16),
            onTap: systemThemeCallback,
            trailing: Container(
              padding: EdgeInsets.all(5.0.h),
              decoration: BoxDecoration(
                color: currentTheme == 'system'
                    ? Colors.blueGrey
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check,
                size: 14,
                color: currentTheme == 'system'
                    ? Colors.white
                    : Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
