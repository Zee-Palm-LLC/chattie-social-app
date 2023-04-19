import 'package:align_positioned/align_positioned.dart';
import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/starter/chat_with_friends.dart';
import 'package:chatie/app/modules/views/starter/components/avatar_card.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class FindFriends extends StatelessWidget {
  const FindFriends({super.key});

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
                text: 'Discover Friends With ',
                style: AppTypography.kBold32
                    .copyWith(color: Colors.black, fontSize: 32.sp),
                children: [
                  TextSpan(
                    text: 'Mutual ',
                    style: AppTypography.kBold32.copyWith(color: Colors.orange),
                  ),
                  TextSpan(
                    text: 'Interest',
                    style: AppTypography.kBold32.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: Text(
              'Find new friends from every where',
              style: AppTypography.kLight14.copyWith(color: Colors.grey),
            ),
          ),
          SizedBox(height: 100.h),
          FadeInUp(
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: double.infinity,
              height: 300.h,
              padding: const EdgeInsets.all(90.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  for (double i = 0; i < 360; i += 60)
                    AnimChain(initialDelay: Duration(milliseconds: i.toInt()))
                        .next(
                          wait: const Duration(milliseconds: 1000),
                          widget: AnimatedAlignPositioned(
                            dx: 0,
                            dy: 150,
                            duration: const Duration(seconds: 1),
                            rotateDegrees: 0,
                            touch: Touch.middle,
                            child: AvatarCard(index: 0, number: i),
                          ),
                        )
                        .next(
                          wait: const Duration(seconds: 2),
                          widget: AnimatedAlignPositioned(
                            dx: i / 360,
                            dy: 150,
                            duration: const Duration(seconds: 1),
                            rotateDegrees: i,
                            touch: Touch.middle,
                            child: AvatarCard(index: 0, number: i),
                          ),
                        ),
                  Container(
                    height: 120.h,
                    width: 120.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(AppAssets.kAvatar7),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: PrimaryButton(
              text: 'Next',
              onTap: () {
                Get.to<Widget>(()=>const ChatWithFriends());
              },
            ),
          ),
          SizedBox(height: 20.h),
        ]),
      ),
    );
  }
}
