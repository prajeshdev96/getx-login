import 'package:getx_login/packages/config_package.dart';

class AllDataController extends GetxController {
  late List<User> allUser;

  @override
  void onInit() {
    allUsers();
    super.onInit();
  }

  allUsers() async {
    var data = await myDao.getAllUser();
    allUser = data;
    update();
  }
}
