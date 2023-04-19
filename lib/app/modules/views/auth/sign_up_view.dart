import 'package:animate_do/animate_do.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/modules/views/auth/components/agree_terms.dart';
import 'package:chatie/app/modules/views/auth/components/custom_social_icon.dart';
import 'package:chatie/app/modules/views/auth/components/custom_textfield.dart';
import 'package:chatie/app/modules/views/auth/email_verification.dart';
import 'package:chatie/app/modules/views/starter/find_friends.dart';
import 'package:chatie/app/modules/widgets/buttons/custom_textbutton.dart';
import 'package:chatie/app/modules/widgets/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isAgreeTerms = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back<void>();
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Form(
          key: _formKey,
          child: FadeInLeft(
            duration: const Duration(milliseconds: 1400),
            child: ListView(
              padding:
                  EdgeInsets.symmetric(horizontal: AppSpacing.twentyHorizontal),
              physics: const BouncingScrollPhysics(),
              children: [
                Image.asset(AppAssets.kChattieLogo, height: 100.h),
                Center(
                  child: Text(
                    'Create Account !',
                    style: AppTypography.kBold22,
                  ),
                ),
                Center(
                  child: Text(
                    "It's Quick and Easy",
                    style: AppTypography.kLight14.copyWith(color: Colors.grey),
                  ),
                ),
                SizedBox(height: 50.h),
                CustomTextField(
                  controller: _userNameController,
                  focusNode: _userNameFocus,
                  validator: (value) {
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  hintText: 'Username',
                  labelText: 'Username',
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_emailFocus);
                  },
                ),
                SizedBox(height: AppSpacing.tenVertical),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        controller: _firstNameController,
                        validator: (value) {
                          return null;
                        },
                        focusNode: _firstNameFocus,
                        hintText: 'First Name',
                        labelText: 'First Name',
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_lastNameFocus);
                        },
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(width: AppSpacing.tenVertical),
                    Expanded(
                      child: CustomTextField(
                        controller: _lastNameController,
                        focusNode: _lastNameFocus,
                        validator: (value) {
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        hintText: 'Last Name',
                        labelText: 'Last Name',
                        onFieldSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_userNameFocus);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.tenVertical),
                CustomTextField(
                  controller: _emailController,
                  validator: (value) {
                    return null;
                  },
                  focusNode: _emailFocus,
                  hintText: 'Email Address',
                  labelText: 'Email',
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: AppSpacing.tenVertical),
                CustomTextField(
                  controller: _passwordController,
                  isPasswordField: true,
                  focusNode: _passwordFocus,
                  validator: (value) {
                    return null;
                  },
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                ),
                SizedBox(
                  height: 34.h,
                ),
                AgreeTerms(
                  value: isAgreeTerms,
                  onChanged: (value) {
                    setState(() {
                      isAgreeTerms = value!;
                    });
                  },
                ),
                SizedBox(height: 48.h),
                PrimaryButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      Get.to<Widget>(
                        const EmailVerification(),
                      );
                    }
                  },
                  text: 'Sign Up',
                ),
                SizedBox(height: AppSpacing.thirtyVertical),
                Row(
                  children: [
                    const Expanded(child: Divider(color: Colors.black)),
                    SizedBox(width: AppSpacing.tenHorizontal),
                    Text('Or Continue with', style: AppTypography.kLight14),
                    SizedBox(width: AppSpacing.tenHorizontal),
                    const Expanded(child: Divider(color: Colors.black)),
                  ],
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSocialIcon(
                      icons: AppAssets.kGoogle,
                      onPressed: () {},
                    ),
                    SizedBox(width: AppSpacing.tenHorizontal),
                    CustomSocialIcon(
                      icons: AppAssets.kApple,
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.twentyVertical),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member? ', style: AppTypography.kLight14),
                    CustomTextButton(
                      text: 'Login Now',
                      onPressed: () {
                        Get.back<void>();
                      },
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.thirtyVertical),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
