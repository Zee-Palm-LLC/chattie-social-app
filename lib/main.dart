import 'package:chatie/app/bindings/home_binding.dart';
import 'package:chatie/app/controllers/theme_controller.dart';
import 'package:chatie/app/data/constants/constants.dart';
import 'package:chatie/app/data/helpers/theme_helper.dart';
import 'package:chatie/app/modules/views/auth/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(defaultOverlay);
  await GetStorage.init();
  runApp(Main());
}

// ignore: must_be_immutable
class Main extends StatelessWidget {
  ThemeController themeController = Get.put(ThemeController());
  Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Chatie',
          debugShowCheckedModeBanner: false,
          scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
          defaultTransition: Transition.fadeIn,
          initialBinding: HomeBinding(),
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          themeMode: getThemeMode(themeController.theme),
          home: const WelcomeView(),
        );
      },
    );
  }
}
