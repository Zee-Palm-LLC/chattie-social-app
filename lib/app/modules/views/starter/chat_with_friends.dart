import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/landingPage/landing_page.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ChatWithFriends extends StatelessWidget {
  const ChatWithFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 50.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: RichText(
              text: TextSpan(
                text: 'Chat with ',
                style: AppTypography.kBold32.copyWith(color: Colors.black),
                children: [
                  TextSpan(
                    text: 'Friends',
                    style: AppTypography.kBold32.copyWith(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: Text(
              'Chat with friends from every where',
              style: AppTypography.kLight14.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: 100.h),
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Image.asset(AppAssets.kChatWithFriends),
          ),
          const Spacer(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: PrimaryButton(
              text: 'Next',
              onTap: () {
                Get.offAll<Widget>(() => const LandingPage());
              },
            ),
          ),
          SizedBox(height: 20.h),
        ]),
      ),
    );
  }
}
