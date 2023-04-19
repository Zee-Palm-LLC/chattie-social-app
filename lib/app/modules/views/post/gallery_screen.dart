import 'dart:io';

import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<AssetEntity> _images = [];
  AssetEntity? _selectedImage;

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    final albums = await PhotoManager.getAssetPathList();
    final cameraRoll = albums.first;
    final images = await cameraRoll.getAssetListRange(start: 0, end: 1000000);
    setState(() {
      _images = images;
    });
  }

  void _selectImage(AssetEntity image) {
    setState(() {
      _selectedImage = image;
    });
  }

  Future<void> _returnSelectedImage() async {
    final selectedFile = await _selectedImage?.file;
    Get.back<File?>(result: selectedFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: Text(
          'Gallery',
          style: AppTypography.kBold18,
        ),
        actions: [
          TextButton(
            child: Text(
              'Add',
              style: AppTypography.kBold16.copyWith(color: Colors.orange),
            ),
            onPressed:
                _selectedImage == null ? null : () => _returnSelectedImage,
          ),
        ],
      ),
      body: GridView.builder(
        itemCount: _images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5.h,
          crossAxisSpacing: 5.w,
        ),
        itemBuilder: (context, index) {
          final image = _images[index];
          return GestureDetector(
            onTap: () {
              _selectImage(image);
            },
            child: Stack(
              children: [
                Image(
                  image: AssetEntityImageProvider(image),
                  fit: BoxFit.cover,
                  height: 200.h,
                  width: 200.w,
                ),
                if (_selectedImage == image)
                  Container(
                    margin: EdgeInsets.all(5.w),
                    padding: EdgeInsets.all(5.h),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.orange,
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 20.h,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
