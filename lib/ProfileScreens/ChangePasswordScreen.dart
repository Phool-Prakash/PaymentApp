import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Controllers for text fields
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();

  // Flags to toggle password visibility
  bool showCurrentPassword = false;
  bool showNewPassword = false;
  bool showConfirmNewPassword = false;

  bool isCurrentPasswordValid = false;
  bool isNewPasswordValid = false;
  String errorText = '';

  @override
  void initState() {
    super.initState();
    currentPasswordController.addListener(validateForm);
    newPasswordController.addListener(validateForm);
    confirmNewPasswordController.addListener(validateForm);
  }

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    super.dispose();
  }

  void validateForm() {
    setState(() {
      isCurrentPasswordValid = currentPasswordController.text.isNotEmpty;
      isNewPasswordValid = newPasswordController.text.isNotEmpty &&
          confirmNewPasswordController.text.isNotEmpty &&
          newPasswordController.text == confirmNewPasswordController.text;
      if (!isCurrentPasswordValid) {
        errorText = 'Current Password is required';
      } else if (!isNewPasswordValid) {
        errorText = 'Password do not match';
      } else {
        errorText = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change password',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFieldWithVisibilityToggle(
              controller: currentPasswordController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFA4A7B0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFA4A7B0),
                      ),
                      borderRadius: BorderRadius.circular(8))),
              labelText: 'Current Password',
              isPasswordVisible: showCurrentPassword,
              toggleVisibility: () {
                setState(() {
                  showCurrentPassword = !showCurrentPassword;
                });
              },
            ),
            const SizedBox(height: 40.0),
            TextFieldWithVisibilityToggle(
              controller: newPasswordController,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFA4A7B0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFA4A7B0),
                      ),
                      borderRadius: BorderRadius.circular(8))),
              labelText: 'New Password',
              isPasswordVisible: showNewPassword,
              toggleVisibility: () {
                setState(() {
                  showNewPassword = !showNewPassword;
                });
              },
            ),
            const SizedBox(height: 40.0),
            TextFieldWithVisibilityToggle(
              controller: confirmNewPasswordController,
              labelText: 'Confirm New Password',
              isPasswordVisible: showConfirmNewPassword,
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xFFA4A7B0))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFA4A7B0),
                      ),
                      borderRadius: BorderRadius.circular(8))),
              toggleVisibility: () {
                setState(() {
                  showConfirmNewPassword = !showConfirmNewPassword;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            if (errorText.isNotEmpty)
              Text(
                errorText,
                style: const TextStyle(color: Colors.red),
              ),
            const SizedBox(height: 40.0),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: 56,
                  width: screenWidth,
                  child: ElevatedButton(
                    onPressed: isNewPasswordValid
                        ? () {
                            // Implement password change logic here
                            String currentPassword =
                                currentPasswordController.text;
                            String newPassword = newPasswordController.text;
                            String confirmNewPassword =
                                confirmNewPasswordController.text;

                            // Add  password change validation and logic here
                            if (newPassword == confirmNewPassword) {
                              // Passwords match, perform password change
                              print('Password changed successfully');
                            } else {
                              // Passwords do not match, show an error message
                              print('Passwords do not match');
                            }
                          }
                        : null,
                    child: const Text(
                      'Confirm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWithVisibilityToggle extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPasswordVisible;
  final VoidCallback toggleVisibility;
  final InputDecoration decoration;

  const TextFieldWithVisibilityToggle(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.isPasswordVisible,
      required this.toggleVisibility,
      this.decoration = const InputDecoration()});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: !isPasswordVisible,
      decoration: decoration.copyWith(
        border: OutlineInputBorder(),
        labelText: labelText,
        suffixIcon: IconButton(
          icon:
              Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
          onPressed: toggleVisibility,
        ),
      ),
    );
  }
}
