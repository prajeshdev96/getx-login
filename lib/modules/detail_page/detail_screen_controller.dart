import 'package:getx_login/packages/config_package.dart';

class CompactApiFetchDataController extends GetxController {
  List<CompactsModal> compactDetailApiDetail = [];

  @override
  void onInit() {
    int id = Get.arguments;
    compactPostIdapiData(id);
    super.onInit();
  }

  compactPostIdapiData(int id) async {
    if (compactDetailApiDetail.isEmpty) {
      compactDetailApiDetail = await ApiClient.instance.getCompacts(id);
      update();
    }
  }
}