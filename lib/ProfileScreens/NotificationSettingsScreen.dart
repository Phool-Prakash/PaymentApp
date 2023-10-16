import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool isNotificationEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Push notification settings',
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
      body: Column(
        children: <Widget>[
          const SizedBox(height: 10,),
          ListTile(
            title: const Text(
              'Chat notification',
              style: TextStyle(
                color: Color(0xFF2A2C33),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            subtitle: const Text(
              'Receive push notifications for new messages',
              style: TextStyle(
                color: Color(0xFFA4A7B0),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            trailing: Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
          ),
          // if (isNotificationEnabled)
          //   ListTile(
          //     title: Text('Notification Frequency'),
          //     // Add code for selecting notification frequency here
          //     trailing: Icon(Icons.arrow_forward_ios),
          //     onTap: () {
          //       // Navigate to notification frequency settings screen
          //     },
          //   ),
          const SizedBox(height: 10,),
          const Divider(
            color: Color(0xFFEAEEE7),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: const Text(
              'Notification sounds',
              style: TextStyle(
                color: Color(0xFF2A2C33),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            subtitle: const Text(
              'Play sounds for new messages',
              style: TextStyle(
                color: Color(0xFFA4A7B0),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            trailing: Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
          ),
          // if (isNotificationEnabled)
          //   ListTile(
          //     title: Text('Notification Frequency'),
          //     // Add code for selecting notification frequency here
          //     trailing: Icon(Icons.arrow_forward_ios),
          //     onTap: () {
          //       // Navigate to notification frequency settings screen
          //     },
          //   ),
          const SizedBox(height: 10,),
          const Divider(
            color: Color(0xFFEAEEE7),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: const Text(
              'Chat banner notification',
              style: TextStyle(
                color: Color(0xFF2A2C33),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            subtitle: const Text(
              'Show chat banner notification in the app\nwhen messages arrive',
              style: TextStyle(
                color: Color(0xFFA4A7B0),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            trailing: Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
          ),
          // if (isNotificationEnabled)
          //   ListTile(
          //     title: Text('Notification Frequency'),
          //     // Add code for selecting notification frequency here
          //     trailing: Icon(Icons.arrow_forward_ios),
          //     onTap: () {
          //       // Navigate to notification frequency settings screen
          //     },
          //   ),
          const SizedBox(height: 10,),
          const Divider(
            color: Color(0xFFEAEEE7),
            height: 1,
            thickness: 1,
          ),
          const SizedBox(height: 10,),
          ListTile(
            title: const Text(
              'In-app sounds',
              style: TextStyle(
                color: Color(0xFF2A2C33),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            subtitle: const Text(
              'Play sounds for in-app banner notifications',
              style: TextStyle(
                color: Color(0xFFA4A7B0),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            trailing: Switch(
              value: isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  isNotificationEnabled = value;
                });
              },
            ),
          ),
          // if (isNotificationEnabled)
          //   ListTile(
          //     title: Text('Notification Frequency'),
          //     // Add code for selecting notification frequency here
          //     trailing: Icon(Icons.arrow_forward_ios),
          //     onTap: () {
          //       // Navigate to notification frequency settings screen
          //     },
          //   ),
          const Divider(
            color: Color(0xFFEAEEE7),
            height: 1,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
