import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PublicCard extends StatelessWidget {
  const PublicCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 3.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.public,
            size: 20,
          ),
          SizedBox(
            width: 5.w,
          ),
          const Text('Public'),
          SizedBox(
            width: 5.0.w,
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 20,
          ),
        ],
      ),
    );
  }
}
