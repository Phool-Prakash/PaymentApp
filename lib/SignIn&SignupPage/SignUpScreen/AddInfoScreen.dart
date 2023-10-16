import 'package:app_online_payment/UserProfilePage/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddInfoScreen extends StatefulWidget {
  const AddInfoScreen({super.key});

  @override
  State<AddInfoScreen> createState() => _AddInfoScreenState();
}

class _AddInfoScreenState extends State<AddInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  // bool _isConfirmPasswordVisible = false;
  // bool _passwordMatch = true;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: screenWidth,
          height: screenHeight,
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 84,
                    height: 33,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 32.44,
                          height: 50,
                          child: Stack(
                            children: [
                              SvgPicture.asset(
                                'Assets/interest.svg',
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  'Assets/Line 1 (Stroke).svg',
                                  width: 25,
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                        SvgPicture.asset(
                          'Assets/walt.svg',
                          width: 50,
                          height: 19,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 16),
                child: SizedBox(
                    width: screenWidth,
                    child: const Text(
                      'Hello there',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 16),
                child: SizedBox(
                  width: screenWidth,
                  child: const Text(
                    'Fill in the following details to get \nyou started',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: _buildTextField(
                      controller: nameController,
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      validationMessage: 'Name is required')),
              const SizedBox(
                height: 12,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: _buildTextField(
                    controller: emailController,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    validationMessage: 'Email is required',
                  )),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    obscureText: _isPasswordVisible,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Password',
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      hintText: 'Enter password',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA4A7B0),
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(color: Color(0xFFA4A7B0), width: 1)),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide:
                              BorderSide(color: Color(0xFFA4A7B0), width: 1)),
                      suffixIcon: GestureDetector(
                        onTap: _togglePasswordVisibility,
                        child: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: _buildTextField(
                  controller: confirmPasswordController,
                  labelText: "Confirm Password",
                  hintText: 'Enter Confirm Password',
                  validationMessage: 'Confirm Password is required',
                  isPassword: true,
                  confirmPassword: true,
                ),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: SizedBox(
                  width: screenWidth,
                  height: 48,
                  child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Form is valid, you can proceed with your logic here
                        String name = nameController.text;
                        String email = emailController.text;
                        String password = passwordController.text;
                        print(
                            'Name: $name, Email: $email, Password: $password');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfileScreen(
                                      name: name,
                                      email: email,
                                    )));
                      }
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]),
          )),
    ));
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required String validationMessage,
    bool isPassword = false,
    bool confirmPassword = false,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        labelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.blue, width: 2.0),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey, width: 1.0),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return validationMessage;
        }
        if (confirmPassword && value != passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }
}
