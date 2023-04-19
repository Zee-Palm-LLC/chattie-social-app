import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/starter/find_friends.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({super.key});

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _pinFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Timer? _timer;
  int _remainingTime = 59;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_remainingTime == 0) {
          _stopTimer();
        } else {
          setState(() {
            _remainingTime--;
          });
        }
      },
    );
  }

  void _stopTimer() {
    _timer?.cancel();
    _timer = null;
  }

  String get _remainingTimeText {
    return _remainingTime.toString().padLeft(2, '0');
  }

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
                  child:
                      Text('Email Verification', style: AppTypography.kBold22),
                ),
                Center(
                  child: Text(
                    'This code is for one-time use only and expires after a certain period of time. If you did not sign up for our service, please disregard this email.',
                    style: AppTypography.kLight14.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 50.h),
                Center(
                  child: Text(
                    '00:$_remainingTimeText ',
                    style: const TextStyle(fontSize: 38, color: Colors.orange),
                  ),
                ),
                SizedBox(height: 30.h),
                Center(
                  child: PinCodeTextField(
                    pinBoxBorderWidth: 0,
                    controller: _pinController,
                    focusNode: _pinFocus,
                    highlightAnimation: true,
                    highlightColor: Colors.orange,
                    pinBoxHeight: 50,
                    pinBoxWidth: 50,
                    pinBoxRadius: 10.r,
                  ),
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Didn't receive the code? ",
                        style: AppTypography.kLight14
                            .copyWith(color: Colors.grey, fontSize: 14.sp),
                      ),
                      TextSpan(
                        text: 'Resend Code',
                        style: AppTypography.kMedium16
                            .copyWith(color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                PrimaryButton(
                  text: 'Verify OTP',
                  onTap: () {
                    Get.to<Widget>(() => const FindFriends());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
