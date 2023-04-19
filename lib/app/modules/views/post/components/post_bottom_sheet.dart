import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/post/components/sheet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostBottomSheet extends StatelessWidget {
  final VoidCallback cameraCallback;
  final VoidCallback galleryCallback;
  final VoidCallback templateCallback;
  const PostBottomSheet({
    required this.cameraCallback,
    required this.galleryCallback,
    required this.templateCallback,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.twentyVertical),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Container(
              height: 3.h,
              width: 70.w,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 30.h),
          SheetCard(
            icon: Icons.photo,
            onTap: galleryCallback,
            text: 'Add a Photo',
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SheetCard(
            icon: Icons.photo_camera_front,
            onTap: cameraCallback,
            text: 'Add a Video',
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SheetCard(
            icon: Icons.article,
            onTap: templateCallback,
            text: 'Use a Template',
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SheetCard(
            icon: Icons.celebration,
            onTap: () {},
            text: 'Celebrate a Moment',
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SheetCard(
            icon: Icons.document_scanner,
            onTap: () {},
            text: 'Add a Document',
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SheetCard(
            icon: Icons.poll_outlined,
            onTap: () {},
            text: 'Create a poll',
          ),
          SizedBox(height: AppSpacing.twentyVertical),
          SheetCard(
            icon: Icons.event,
            onTap: () {},
            text: 'Create a Event',
          ),
        ],
      ),
    );
  }
}
