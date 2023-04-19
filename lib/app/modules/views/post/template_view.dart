import 'dart:io';
import 'dart:typed_data';

import 'package:chatie/app/data/constants/app_typography.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/model/templates.dart';
import 'package:chatie/app/modules/views/post/components/template_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class TemplateView extends StatefulWidget {
  const TemplateView({Key? key}) : super(key: key);

  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {
  int selectedIndex = 0;
  double _fontSize = 64;
  final TextEditingController _textController = TextEditingController();
  WidgetsToImageController controller = WidgetsToImageController();
  Uint8List? bytes;
  bool isText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const BackButton(
          color: Colors.white,
        ),
        centerTitle: true,
        title: Text(
          'Select Background',
          style: AppTypography.kBold18.copyWith(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () => capturePng,
            child: Text(
              'Done',
              style: AppTypography.kBold16,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 30.h,
          ),
          WidgetsToImage(
            controller: controller,
            child: TemplateCard(
              image: templates[selectedIndex].image,
              controller: _textController,
              isText: isText,
              text: _textController.text,
              onChanged: (value) {
                setState(() {
                  if (value.length <= 10) {
                    _fontSize = 64;
                  } else if (value.length <= 20) {
                    _fontSize = 28;
                  } else if (value.length <= 30) {
                    _fontSize = 24;
                  } else {
                    _fontSize = 20;
                  }
                });
              },
              fontSize: _fontSize,
            ),
          ),
          SizedBox(height: 50.h),
          SizedBox(
            height: 60.h,
            child: ListView.separated(
              itemCount: templates.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 20.w),
              separatorBuilder: (context, index) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.r),
                      border: Border.all(
                        color: selectedIndex == index
                            ? Colors.orange
                            : Colors.transparent,
                        width: 2.w,
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          templates[index].image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: selectedIndex == index
                        ? const Icon(
                            Icons.check,
                            color: Colors.orange,
                          )
                        : null,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> capturePng() async {
    setState(() {
      isText = true;
    });
    if (isText) {
      final bytes = await controller.capture();
      if (bytes != null) {
        final file = File('${(await getTemporaryDirectory()).path}/image.jpg');
        await file.writeAsBytes(bytes);
        Get.back<File?>(result: file);
      }
    }
  }
}
