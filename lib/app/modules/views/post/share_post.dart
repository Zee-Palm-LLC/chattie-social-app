import 'dart:io';

import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/post/camera_view.dart';
import 'package:chatie/app/modules/views/post/components/post_bottom_sheet.dart';
import 'package:chatie/app/modules/views/post/components/post_field.dart';
import 'package:chatie/app/modules/views/post/components/public_card.dart';
import 'package:chatie/app/modules/views/post/components/secondary_post_sheet.dart';
import 'package:chatie/app/modules/views/post/gallery_screen.dart';
import 'package:chatie/app/modules/views/post/template_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SharePost extends StatefulWidget {
  const SharePost({Key? key}) : super(key: key);

  @override
  State<SharePost> createState() => _SharePostState();
}

class _SharePostState extends State<SharePost> {
  final TextEditingController postController = TextEditingController();
  bool _isButtonDisabled = true;
  bool _isBottomSheetShown = false;
  File? image;
  @override
  void initState() {
    super.initState();
    postController.addListener(_updateButtonState);
    WidgetsBinding.instance.addPostFrameCallback((_) => _showBottomSheet());
  }

  void _updateButtonState() {
    setState(() {
      _isButtonDisabled = postController.text.isEmpty;
    });
  }

  Future<void> _showBottomSheet() async {
    setState(() {
      _isBottomSheetShown = true;
    });
    await showModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.transparent,
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      builder: (context) {
        return PostBottomSheet(
          cameraCallback: () => onCameraCallback,
          galleryCallback: () => onGalleryCallback,
          templateCallback: () => onTemplateCallback,
        );
      },
    );

    setState(() {
      _isBottomSheetShown = false;
    });
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: const BackButton(),
        title: Text(
          'Share Post',
          style: AppTypography.kBold18,
        ),
        actions: [
          TextButton(
            onPressed: _isButtonDisabled ? null : () {},
            child: Text(
              'Post',
              style: AppTypography.kBold16,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shameel Irtaza',
                      style: AppTypography.kBold16,
                    ),
                    const PublicCard(),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
            child: PostField(
              controller: postController,
              onChanged: (value) {
                _updateButtonState();
              },
            ),
          ),
          if (image != null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.twentyHorizontal,
              ),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          else
            const SizedBox(),
        ],
      ),
      bottomSheet: !_isBottomSheetShown
          ? SecondaryPostSheet(
              cameraCallBack: () => onCameraCallback,
              galleryCallBack: () => onGalleryCallback,
              moreCallback: () {
                debugPrint('Open Sheet');
                _showBottomSheet();
              },
              templateCallBack: () => onTemplateCallback,
              videoCallBack: () {},
            )
          : null,
    );
  }

  Future<void> onCameraCallback() async {
    final imagePath = await Get.to<File>(() => const CameraView());
    if (imagePath != null) {
      setState(() {
        image = imagePath;
      });
    }
  }

  Future<void> onGalleryCallback() async {
    final imagePath = await Get.to<File>(() => const GalleryScreen());
    if (imagePath != null) {
      setState(() {
        image = imagePath;
      });
    }
  }

  Future<void> onTemplateCallback() async {
    final imagePath = await Get.to<File>(() => const TemplateView());
    if (imagePath != null) {
      setState(() {
        image = imagePath;
        debugPrint(imagePath.path);
      });
    }
  }
}
