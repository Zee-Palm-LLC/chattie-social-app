import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/enums/camera_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CameraView extends StatefulWidget {
  const CameraView({super.key});

  @override
  State<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  late CameraController controller;
  File? output;
  Future<void> initializationCamera() async {
    final cameras = await availableCameras();
    controller = CameraController(
      cameras[CameraEnum.front.index],
      ResolutionPreset.medium,
      imageFormatGroup: ImageFormatGroup.yuv420,
    );
    await controller.initialize();
  }

  Future<void> onTakePicture() async {
    final image = await controller.takePicture();
    setState(() {
      output = File(image.path);
    });
    Get.back<File>(result: output);
    return;
  }

  bool isFlashOn = false;

  // ignore: avoid_void_async
  void _onPressFlashToggle(int _) async {
    setState(() {
      isFlashOn = !isFlashOn;
    });
    if (isFlashOn) {
      await controller.setFlashMode(FlashMode.torch);
    } else {
      await controller.setFlashMode(FlashMode.off);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: StatefulBuilder(
          builder: (context, setState) {
            return ToggleButtons(
              isSelected: [isFlashOn],
              onPressed: _onPressFlashToggle,
              color: Colors.white,
              selectedColor: Colors.yellow,
              children: [
                if (isFlashOn)
                  const Icon(Icons.flash_off)
                else
                  const Icon(Icons.flash_on),
              ],
            );
          },
        ),
        centerTitle: true,
        title: Text(
          'Identify the query',
          style: AppTypography.kBold16.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back<void>();
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
      body: FutureBuilder(
        future: initializationCamera(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                AspectRatio(
                  aspectRatio: Get.width / Get.height,
                  child: CameraPreview(controller),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60.h,
                        width: 60.w,
                        margin: EdgeInsets.only(bottom: 40.h),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          border: Border.all(color: Colors.white, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt),
                          onPressed: () => onTakePicture(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          } else {
            return Container(
              color: Colors.black,
            );
          }
        },
      ),
    );
  }
}
