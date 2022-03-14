import 'package:getx_login/packages/config_package.dart';

import 'edit_user_screen_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditUserController ctrl = Get.put(EditUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Edit Profile", style: TextStyle(color: Colors.black)),
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
                      _textField(ctrl.firstNameEditController, "FristName"),
                      _textField(ctrl.lastNameEditController, "LastName"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: ctrl.emailEditController,
                          decoration: InputDecoration(
                            labelText: 'Enter your email',
                            contentPadding: const EdgeInsets.all(8.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          validator: (val) {
                            if (val!.isEmail) {
                              return 'Enter a valid email address';
                            } else if (val.isEmpty) {
                              return "can't empty null'";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          // ignore: unnecessary_statements
                          ctrl.editButton();
                        },
                        child: const Text('Done'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _textField(TextEditingController _controller, String _hintText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Enter your $_hintText',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        validator: (val) {
          if (val!.isEmpty) {
            return "can't empty ${_hintText.toLowerCase()} null";
          }

          return null;
        },
      ),
    );
  }
}
