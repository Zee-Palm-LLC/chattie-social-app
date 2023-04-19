import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/auth/components/social_button.dart';
import 'package:chatie/app/modules/views/auth/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Transform.rotate(
            angle: 175,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1400),
              child: Container(
                height: 400,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppAssets.kLogo),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Text(
              'Create Better Together',
              style: AppTypography.kBold22,
            ),
          ),
          SizedBox(height: AppSpacing.tenVertical),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Text(
              'Join our Community',
              style: AppTypography.kBold16.copyWith(color: Colors.grey[300]),
            ),
          ),
          SizedBox(height: 10.h),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Container(
              height: 5.h,
              width: 40.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.r),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          const Spacer(),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: SocialButton(
                onPressed: () {},
                icon: AppAssets.kGoogle,
                color: Colors.white,
                fontColor: Colors.black,
                text: 'Continue with Google',
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          FadeInUp(
            duration: const Duration(milliseconds: 1400),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              child: SocialButton(
                onPressed: () {
                  Get.to<Widget>(SignInView.new);
                },
                color: Colors.black,
                fontColor: Colors.white,
                icon: AppAssets.kMail,
                text: 'Continue with Email',
              ),
            ),
          ),
          SizedBox(height: AppSpacing.twentyVertical),
        ],
      ),
    );
  }
}
