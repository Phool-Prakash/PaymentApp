import 'package:flutter/material.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Terms & conditions',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body:const Padding(
        padding: EdgeInsets.only(left: 16.0,right:16,bottom:16,top:16),
        child: SizedBox(
          width: 343,
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Please read these terms and conditions carefully before using our website and services. By accessing or using any part of our website and services, you agree to be bound by these terms and conditions. If you do not agree to all the terms and conditions of this agreement, then you may not access our website and services.\n\n',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'General',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '             \n',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'a. The website and services provided by Walt are intended for personal and non-commercial use only. Any use of our website and services for commercial purposes is strictly prohibited.             \nb. We reserve the right to modify or terminate our website and services at any time, without notice.             \nc. Walt is not responsible for any errors, inaccuracies, or omissions on our website or any damages resulting from the use of our website.              \n',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '2. Accounts',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '             \na. In order to use certain features of our website and services, you may be required to create an account.             \nb. You are responsible for maintaining the confidentiality of your account information, including your username and password.             \nc. You agree to provide accurate and complete information when creating an account, and to update your information as necessary.             \nd. Walt reserves the right to terminate your account at any time, without notice, if we believe that you have violated these terms and conditions.              \n',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '3. Intellectual Property',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '             \na. All content on our website and services, including text, graphics, logos, images, and software, is the property of Walt or its licensors and is protected by intellectual property laws.             \nb. You may not reproduce, distribute, or display any content from our website and services without our prior written permission.              \n',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: '4. Disclaimers             \n',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                TextSpan(
                  text: 'a. Walt makes no representations or warranties of any kind, express or implied, as to the operation of our website or the information, content, materials, or products included on our website.             \nb. Walt does not warrant that our website or its servers are free of viruses or other harmful components.',
                  style: TextStyle(
                    color: Color(0xFF5A6071),
                    fontSize: 11,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
