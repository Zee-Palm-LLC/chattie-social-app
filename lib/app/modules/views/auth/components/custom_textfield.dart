// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:chatie/app/data/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final String labelText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final bool isPasswordField;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  const CustomTextField({
    required this.controller,
    required this.hintText,
    required this.labelText,
    super.key,
    this.validator,
    this.textInputAction,
    this.keyboardType,
    this.isPasswordField = false,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: widget.isPasswordField ? isObscure : false,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      style: AppTypography.kMedium16,
      decoration: InputDecoration(
        hintText: widget.hintText,
        labelText: widget.labelText,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: isObscure
                    ? SvgPicture.asset(AppAssets.kEyeOn)
                    : SvgPicture.asset(AppAssets.kEyeOff),
              )
            : null,
        labelStyle: AppTypography.kLight14,
        hintStyle: AppTypography.kMedium16.copyWith(color: Colors.grey),
      ),
    );
  }
}
