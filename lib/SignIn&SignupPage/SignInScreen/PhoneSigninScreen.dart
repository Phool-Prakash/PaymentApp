import 'package:app_online_payment/SignIn&SignupPage/SignInScreen/PasswordScreen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhoneSignIn extends StatefulWidget {
  const PhoneSignIn({super.key});

  @override
  State<PhoneSignIn> createState() => _PhoneSignInState();
}

class _PhoneSignInState extends State<PhoneSignIn> {
  final phoneNumberController = TextEditingController();
  bool _isContinueEnable = false;
  String? _errorText;
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Indio",
      example: "Indio",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");
  void _validateInput(String value) {
    if (value.isEmpty) {
      setState(() {
        _errorText = ""; // No error if the input is empty
      });
    } else if (value.contains(RegExp(r'[a-zA-Z]')) ||
        phoneNumberController.text.length > 10) {
    } else if (value.contains(RegExp(r'[a-zA-Z]')) ||
        phoneNumberController.text.length > 10) {
      setState(() {
        _errorText = 'Please enter only numbers'; // Display error message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          width: screenWidth,
          height: screenHeight,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                  'Enter your phone \nnumber to get started',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      height: 0,
                      decoration: TextDecoration.none),
                ),
              ),
            ),
            const SizedBox(
              height: 76,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    _validateInput(value);
                    setState(() {
                      phoneNumberController.text = value;
                      _isContinueEnable = isValidPhoneNumber(value);
                    });
                  },
                  controller: phoneNumberController,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54),
                  decoration: InputDecoration(
                      labelText: 'Phone number',
                      hintText: 'Enter your number',
                      hintStyle: const TextStyle(
                        color: Color(0xFFA4A7B0),
                        fontSize: 17,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      labelStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                      contentPadding: const EdgeInsets.all(10),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      prefix: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextButton.icon(
                          onPressed: () {
                            showCountryPicker(
                                countryListTheme: CountryListThemeData(
                                  inputDecoration: InputDecoration(
                                    contentPadding:
                                        const EdgeInsets.only(left: 20),
                                    hintText: 'Search',
                                    hintStyle: const TextStyle(
                                        color: Colors.black45,
                                        letterSpacing: .5),
                                    label: const Text(
                                      'Search',
                                    ),
                                    labelStyle: const TextStyle(
                                        color: Colors.black,
                                        letterSpacing: .5,
                                        fontSize: 15),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7),
                                      borderSide: const BorderSide(
                                          color: Colors.black45),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black45),
                                      borderRadius: BorderRadius.circular(7),
                                    ),
                                  ),
                                  searchTextStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.black45,
                                  ),
                                  flagSize: 15,
                                  bottomSheetHeight: 400,
                                ),
                                context: context,
                                onSelect: (value) {
                                  setState(() {
                                    selectedCountry = value;
                                  });
                                });
                          },
                          label: Text(
                            "${selectedCountry.phoneCode} +",
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 0, 0, .50)),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Color.fromRGBO(0, 0, 0, .50),
                            textDirection: TextDirection.ltr,
                          ),
                        ),
                      ),
                      suffixIcon: phoneNumberController.text.length > 9
                          ? const Icon(
                              Icons.done,
                              color: Colors.black54,
                              size: 25,
                            )
                          : null),
                )),
            const SizedBox(
              height: 76,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        disabledBackgroundColor:
                            const Color.fromRGBO(221, 221, 221, 1),
                        disabledForegroundColor:
                            const Color.fromRGBO(221, 221, 221, 1)),
                    onPressed: _isContinueEnable
                        ? () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PasswordScreen()),
                                (Route route) => false);
                          }
                        : null,
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .5),
                    )),
              ),
            ),
          ])),
    );
  }

  bool isValidPhoneNumber(String phoneNumber) {
    final phoneRegExp = RegExp(r'^[0-9]+$');
    return phoneRegExp.hasMatch(phoneNumber) && phoneNumber.length >= 10;
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
