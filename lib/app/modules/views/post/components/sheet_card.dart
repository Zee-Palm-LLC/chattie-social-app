import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SheetCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const SheetCard({
    required this.icon,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10.w,
          ),
          Text(text, style: AppTypography.kBold14),
        ],
      ),
    );
  }
}
