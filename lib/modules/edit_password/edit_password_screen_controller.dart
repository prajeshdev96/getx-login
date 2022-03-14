import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

class EditPasswordController extends GetxController {
  final editFormKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordMatchController = TextEditingController();

  late User user;

  @override
  void onInit() {
    user = Get.arguments as User;
    super.onInit();
  }

  editPasswordButton() {
    if (editFormKey.currentState!.validate()) {
      updatePassword(newPasswordMatchController.text, user.id);
      // AllDataController().allUsers();
      Get.offAll(HomePage());
      Fluttertoast.showToast(
          msg: "Your changes is successful done!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  updatePassword(password, id) async {
    await myDao.updateForPassword(password, id);
  }
}
