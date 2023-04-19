import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/auth/components/custom_textfield.dart';
import 'package:chatie/app/modules/views/auth/sign_up_view.dart';
import 'package:chatie/app/modules/widgets/buttons/custom_textbutton.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ForgetPassword({super.key});

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
                  child: Text('Forget Password', style: AppTypography.kBold22),
                ),
                Center(
                  child: Text(
                    'Please enter the email associated with your account. We will send an OTP code to this email to verify your identity.',
                    style: AppTypography.kLight14.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
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
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                PrimaryButton(text: 'Send OTP', onTap: () {}),
                SizedBox(
                  height: 60.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
