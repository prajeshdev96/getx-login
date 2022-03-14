import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

class EditUserController extends GetxController {
  final editFormKey = GlobalKey<FormState>();
  TextEditingController firstNameEditController = TextEditingController();
  TextEditingController lastNameEditController = TextEditingController();
  TextEditingController emailEditController = TextEditingController();
  late User user;

  @override
  void onInit() {
    user = Get.arguments as User;
    textEditInit();
    super.onInit();
  }

  textEditInit() {
    var data = user;
    firstNameEditController.text = data.fristName!;
    lastNameEditController.text = data.lastName!;
    emailEditController.text = data.email!;
  }

  updateProfile() async {
    await myDao.updateForEdit(firstNameEditController.text, lastNameEditController.text, emailEditController.text, user.id!);
    update();
  }

  editButton() {
    updateProfile();
    AppPref().userLoginData = emailEditController.text;
    Get.offAll(HomePage());
    update();
  }
}
