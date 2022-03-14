import 'dart:async';

import 'package:getx_login/packages/config_package.dart';

class HomePageController extends GetxController {
  final List<StreamSubscription> _stream = [];
  List<TodoModal> todosApiData = [];
  User? editUser;

  @override
  void onInit() {
    _stream.add(myDao.emailData(AppPref().userLogin).listen((value) {
      editUser = value ?? User(email: '',fristName: '',lastName: '',password: '');
      update();
    }));
    todosApiAllData();
    super.onInit();
  }

  @override
  void onClose() {
    _stream.clear();
    super.onClose();
  }

  todosApiAllData() async {
    todosApiData = await ApiClient.instance.getTodos();
    update();
  }
}
