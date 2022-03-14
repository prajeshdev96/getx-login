import 'package:getx_login/modules/splash/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blueGrey],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 75.0,
                  child: Icon(
                    Icons.account_balance,
                    color: Color(0xff0F2027),
                    size: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                ),
                Text(
                  "SpalshScreen",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
