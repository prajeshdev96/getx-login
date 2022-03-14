import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'edit_password_screen_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  final  ctrl = Get.put(EditPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Change Password",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: ctrl.editFormKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: ctrl.oldPasswordController,
                            decoration: InputDecoration(
                              labelText: "Old password",
                              contentPadding: const EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return "can't empty null";
                              if (val != ctrl.user.password) {
                                return "enter a valid password";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: ctrl.newPasswordController,
                            decoration: InputDecoration(
                              labelText: "New password",
                              contentPadding: const EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return "can't empty null";
                              if (val == ctrl.user.password) {
                                return "please,enter a new password";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: ctrl.newPasswordMatchController,
                            decoration: InputDecoration(
                              labelText: "New password",
                              contentPadding: const EdgeInsets.all(15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            validator: (val) {
                              if (val!.isEmpty) return "can't empty null";
                              if (val == ctrl.user.password) {
                                return "please,enter a new password";
                              }
                              if (val != ctrl.newPasswordController.text) {
                                return "Not Match";
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ctrl.editPasswordButton();
                          },
                          child: const Text('Done'),
                        ),
                      ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
