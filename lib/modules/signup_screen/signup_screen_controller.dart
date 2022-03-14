import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

class SighupController extends GetxController {

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conformPasswordController = TextEditingController();
  String _selectRadio = "";

  adduser() async {
    var _user = User(
        fristName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        password: conformPasswordController.text,
        gender: selectRadio);
    await myDao.insertUser(_user);
  }

  singUpButton() {
    if (formKey.currentState!.validate()) {
      adduser();
      AppPref().userLoginData = emailController.text;
      Get.off(HomePage());
    }
  }

  String get selectRadio => _selectRadio;

  radioButtonValue(value) {
    _selectRadio = value;
    update();
  }
}
