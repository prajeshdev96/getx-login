import 'dart:ui';

import 'package:getx_login/packages/config_package.dart';
import 'package:getx_login/packages/screen_package.dart';

import 'home_screen_controller.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  var ctrl = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      drawer: drawerMenu(),
      body: GetBuilder<HomePageController>(builder: (_) {
        try {
          if (ctrl.todosApiData.isNotEmpty) {
            return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: ctrl.todosApiData.length,
              padding: const EdgeInsets.all(0),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: ctrl.todosApiData[index].completed! ? Colors.green : Colors.red,
                  child: ListTile(
                    onTap: () {
                      Get.to(DetailScreen(), arguments: ctrl.todosApiData[index].id);
                    },
                    title: Text("Id:-${ctrl.todosApiData[index].id.toString()}"),
                    subtitle: Text("Title:-${ctrl.todosApiData[index].title}\nCompleted:-${ctrl.todosApiData[index].completed}"),
                  ),
                ),
              ),
            );
          }
        } catch (e) {
          Fluttertoast.showToast(
              msg: "Oops! your network is slow",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }

  drawerMenu() {
    return Container(
      width: 300,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Color.fromARGB(180, 250, 250, 250),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(31, 38, 135, 0.4),
            blurRadius: 8.0,
          )
        ],
        border: Border(
          right: BorderSide(
            color: Colors.white70,
          ),
        ),
      ),
      child: Stack(
        children: [
          SizedBox(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 4.0,
                  sigmaY: 4.0,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.grey.withOpacity(0.0),
                      Colors.white.withOpacity(0.2),
                    ]),
                  ),
                ),
              ),
            ),
          ),
          Column(
            children: [
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      child: Icon(Icons.account_circle, size: 50.0),
                      radius: 30.0,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: GetBuilder<HomePageController>(builder: (context) {
                        return Column(
                          children: [
                            Center(
                              child: Text("${ctrl.editUser!.fristName} ${ctrl.editUser!.lastName}"),
                            ),
                            const SizedBox(height: 5),
                            Center(
                              child: Text("${ctrl.editUser!.email}"),
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
              const Divider(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        Get.to(EditProfileScreen(), arguments: ctrl.editUser);
                      },
                      leading: const Icon(
                        Icons.edit,
                        color: Colors.black,
                      ),
                      title: const Text("Edit Profile"),
                    ),
                    ListTile(
                      onTap: () {
                        Get.to(ChangePasswordScreen(), arguments: ctrl.editUser);
                      },
                      leading: const Icon(
                        Icons.change_circle,
                        color: Colors.black,
                      ),
                      title: const Text("Change password"),
                    ),
                    ListTile(
                      onTap: () async {
                        dailog();
                      },
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                      title: const Text("Log Out"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  dailog() {
    Get.defaultDialog(
      title: "Log out",
      titleStyle: const TextStyle(fontSize: 25),
      middleText: "Are you sure for logout?",
      middleTextStyle: const TextStyle(fontSize: 15),
      textCancel: "Cancel",
      cancelTextColor: Colors.blue,
      textConfirm: "Log Out",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        AppPref().removeUser();
        Get.off(LogInScreen());
      },
      barrierDismissible: false,
    );
  }
}
