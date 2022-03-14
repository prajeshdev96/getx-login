import 'package:getx_login/data/local/db.dart';
import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

Future<void> main() async {
  await ApiClient.init(ApiUrl.baseUrl);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Db();
    AppPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
