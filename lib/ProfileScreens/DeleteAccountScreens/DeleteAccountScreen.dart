import 'package:flutter/material.dart';

class DeleteAcScreen extends StatefulWidget {
  const DeleteAcScreen({super.key});

  @override
  State<DeleteAcScreen> createState() => _DeleteAcScreenState();
}

class _DeleteAcScreenState extends State<DeleteAcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Delete account',
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
      body: const Column(
        children: [
           ListTile(
            title: Text(
              'We are sad to see you go',
              style: TextStyle(
                color: Color(0xFF2A2C33),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            subtitle: Text(
              'Please select why you are deleting your account',
              style: TextStyle(
                color: Color(0xFFA4A7B0),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
          // Container(child: SelectReasonScreen(),height: 300,)
        ],
      ),
    );
  }
}

