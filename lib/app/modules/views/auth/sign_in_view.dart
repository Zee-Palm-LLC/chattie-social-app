import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/auth/components/custom_textfield.dart';
import 'package:chatie/app/modules/views/auth/email_verification.dart';
import 'package:chatie/app/modules/views/auth/forget_password.dart';
import 'package:chatie/app/modules/views/auth/sign_up_view.dart';
import 'package:chatie/app/modules/views/landingPage/landing_page.dart';
import 'package:chatie/app/modules/widgets/buttons/custom_textbutton.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInView extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back<void>();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: _formKey,
          child: FadeInRight(
            duration: const Duration(milliseconds: 1400),
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              physics: const BouncingScrollPhysics(),
              children: [
                Image.asset(AppAssets.kChattieLogo, height: 100.h),
                SizedBox(height: 40.h),
                Center(
                  child: Text('Welcome Back !', style: AppTypography.kBold22),
                ),
                Center(
                  child: Text(
                    'Make it work, make it right, make it fast .',
                    style: AppTypography.kLight14.copyWith(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 50.h),
                CustomTextField(
                  controller: _emailController,
                  validator: (value) {
                    return null;
                  },
                  focusNode: _emailFocus,
                  hintText: 'Email Address',
                  labelText: 'Email',
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                CustomTextField(
                  controller: _passwordController,
                  isPasswordField: true,
                  focusNode: _passwordFocus,
                  validator: (value) {
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomTextButton(
                    onPressed: () {
                      Get.to<Widget>(
                        ForgetPassword.new,
                      );
                    },
                    text: 'Forget Password?',
                  ),
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                PrimaryButton(
                  text: 'Sign in',
                  onTap: () {
                    Get.to<Widget>(
                      () => const LandingPage(),
                    );
                  },
                ),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not a member? ', style: AppTypography.kLight14),
            CustomTextButton(
              text: 'Register Now',
              onPressed: () {
                Get.to<Widget>(
                  () => const SignUpView(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
