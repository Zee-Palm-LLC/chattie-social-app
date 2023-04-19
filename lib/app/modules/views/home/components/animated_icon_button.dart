import 'package:chatie/app/data/helpers/rive_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rive/rive.dart';

class AnimatedIconButton extends StatelessWidget {
  final VoidCallback onTap;
  AnimatedIconButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Chat');
        onTap();
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Container(
          height: 45.h,
          width: 45.w,
          padding: EdgeInsets.all(10.w),
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.orange),
          child: RiveAnimation.asset(
            'assets/rive/icons.riv',
            artboard: 'CHAT',
            fit: BoxFit.cover,
            onInit: (artboard) {
              RiveHelper.getRiveInput(
                artboard,
                stateMachineName: 'CHAT_Interactivity',
              );
            },
          ),
        ),
      ),
    );
  }
}
