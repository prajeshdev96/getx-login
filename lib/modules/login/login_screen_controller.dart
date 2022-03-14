import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

class LogInScreenController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final globalFormKey = GlobalKey<FormState>();

  login() async {
    var data = await myDao.loginData(emailController.text, passwordController.text);
    if (data.isNotEmpty) {
      AppPref().userLoginData = emailController.text;
      Get.offAll(HomePage());
      emailController.clear();
      passwordController.clear();
    } else {
      Fluttertoast.showToast(
          msg: "enter a valid email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}
