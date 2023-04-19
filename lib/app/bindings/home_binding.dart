
import 'package:chatie/app/controllers/theme_controller.dart';
import 'package:get/get.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(ThemeController.new);
  }
}
