import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/auth/sign_in_view.dart';
import 'package:chatie/app/modules/views/auth/sign_up_view.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeInUp(
        duration: const Duration(milliseconds: 300),
        child: Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.kFeed),
              fit: BoxFit.cover,
            ),
          ),
          child: ColoredBox(
            color: const Color.fromARGB(255, 59, 36, 1).withOpacity(0.5),
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Image.asset(
                  AppAssets.kChattieLogo,
                ),
                Text(
                  'Connect with creators worldwide\nand explore new perspectives.',
                  style: GoogleFonts.bubblegumSans(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: const Divider(
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                Text(
                  'Connect with the world like never\nbefore with Chattie. \nOur app lets you stay connected\nto the people and things you love most. ',
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.twentyHorizontal,
                  ),
                  child: PrimaryButton(
                    onTap: () => Get.to<Widget>(SignInView.new),
                    text: 'Get Started for Free',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.twentyHorizontal,
                  ),
                  child: PrimaryButton(
                    onTap: () => Get.to<Widget>(SignUpView.new),
                    text: 'I already have an account',
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: AppSpacing.twentyVertical),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
