import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';

class PostField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  const PostField({
    required this.controller,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      maxLines: 4,
      decoration: InputDecoration(
        filled: false,
        hintText: "What's on your mind?",
        hintStyle: AppTypography.kMedium16,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
