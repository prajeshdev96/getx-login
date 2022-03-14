import 'package:getx_login/modules/signup_screen/signup_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SighupScreen extends StatelessWidget {
  final createUserScrController = Get.put(SighupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SingUp Screen"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
              key: createUserScrController.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding:const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: createUserScrController.firstNameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10.0),
                              hintText: 'First Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 15.0),
                        Expanded(
                          child: TextField(
                            controller: createUserScrController.lastNameController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10.0),
                              hintText: 'Last name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: createUserScrController.emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15.0),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (!GetUtils.isEmail(val)) {
                          return 'Enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: createUserScrController.passwordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15.0),
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";

                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: createUserScrController.conformPasswordController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15.0),
                        hintText: 'Conform password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      validator: (val) {
                        if (val!.isEmpty) return "can't empty null";
                        if (val != createUserScrController.passwordController.text) {
                          return "your password is not match";
                        }
                        return null;
                      },
                    ),
                  ),
                  GetBuilder<SighupController>(
                    init: SighupController(),
                    builder: (radioVal) => Row(
                      children: [
                        Row(
                          children: [
                            Radio(
                                value: "male",
                                groupValue: radioVal.selectRadio,
                                onChanged: (value) {
                                  radioVal.radioButtonValue(value);
                                }),
                            const Text("Male"),
                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                                value: "female",
                                groupValue: radioVal.selectRadio,
                                onChanged: (value) {
                                  radioVal.radioButtonValue(value);
                                }),
                            const Text("Female")
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      createUserScrController.singUpButton();
                    },
                    child: const Text('Singin'),
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
