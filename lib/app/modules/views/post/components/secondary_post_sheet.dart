import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryPostSheet extends StatelessWidget {
  final VoidCallback templateCallBack;
  final VoidCallback cameraCallBack;
  final VoidCallback videoCallBack;
  final VoidCallback galleryCallBack;
  final VoidCallback moreCallback;
  const SecondaryPostSheet({
    required this.templateCallBack,
    required this.cameraCallBack,
    required this.videoCallBack,
    required this.galleryCallBack,
    required this.moreCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: templateCallBack,
            constraints: const BoxConstraints(),
            padding: EdgeInsets.zero,
            icon: const Icon(
              Icons.article,
              color: Colors.orange,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              IconButton(
                onPressed: cameraCallBack,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: AppSpacing.twentyHorizontal,
              ),
              IconButton(
                onPressed: videoCallBack,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.video_camera_front,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: AppSpacing.twentyHorizontal,
              ),
              IconButton(
                onPressed: galleryCallBack,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.photo_size_select_actual,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: AppSpacing.twentyHorizontal,
              ),
              IconButton(
                onPressed: moreCallback,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: const Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                ),
              ),
              const Spacer(),
              Text(
                'Anyone',
                style: AppTypography.kLight14.copyWith(color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
