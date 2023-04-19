import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeedButton extends StatelessWidget {
  final bool isActive;
  final IconData icon;
  final String text;
  const FeedButton({
    required this.isActive,
    required this.icon,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: isActive ? Colors.blue : Colors.grey,
          size: 18,
        ),
        SizedBox(
          width: 5.w,
        ),
        Text(
          text,
          style: TextStyle(color: isActive ? Colors.blue : Colors.grey),
        ),
      ],
    );
  }
}
