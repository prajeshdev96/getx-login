import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

import 'login_screen_controller.dart';

class LogInScreen extends StatelessWidget {
 final ctrl = Get.put(LogInScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( leading: const Icon(Icons.account_circle),
        title: const Text("LogIn Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: ctrl.globalFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: ctrl.emailController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15.0),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (val) {
                          if (val!.isEmpty) return "can't empty null";
                          if (!GetUtils.isEmail(val)) {
                            return 'Enter a valid email address';
                          }

                          return null;
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        obscureText: true,
                        controller: ctrl.passwordController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15.0),
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        validator: (String? val) {
                          if (val!.isEmpty) return "can't empty null";

                          return null;
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("you don't have an account,"),
                      GestureDetector(
                        onTap: () {
                          Get.to(SighupScreen());
                        },
                        child: const Text(
                          "create account.",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (ctrl.globalFormKey.currentState!.validate()) {
                          ctrl.login();
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
