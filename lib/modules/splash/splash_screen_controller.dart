import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 1500), () => check());
  }

  Future checkLogin() async {
    if (AppPref().userLogin.isEmpty) {
      Get.off(LogInScreen());
    } else {
      Get.off(HomePage());
    }
  }

  Future check() async {
    if (AppPref().introScr.isEmpty) {
      Get.off(const IntroScrren());
    } else {
      checkLogin();
    }
  }
}
