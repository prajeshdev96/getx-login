import 'package:getx_login/modules/detail_page/detail_screen_controller.dart';
import 'package:getx_login/packages/config_package.dart';


class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('second api'),
      ),
      body: GetBuilder<CompactApiFetchDataController>(
          init: CompactApiFetchDataController(),
          builder: (compactapiDetail) {
            // ignore: unnecessary_null_comparison
            if (compactapiDetail == null) {
              return const Center(child: Text('No Data'));
            }
            if (compactapiDetail.compactDetailApiDetail.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: compactapiDetail.compactDetailApiDetail.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(
                      "id:- ${compactapiDetail.compactDetailApiDetail[index].id}\n"
                          "Name:- ${compactapiDetail.compactDetailApiDetail[index].name}"),
                  subtitle: Text(
                      "Email:- ${compactapiDetail.compactDetailApiDetail[index].email}"),
                ),
              ),
            );
          }),
    );
  }
}
