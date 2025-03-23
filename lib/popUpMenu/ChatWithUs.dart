import 'package:flutter/material.dart';

class ChatWithUs extends StatefulWidget {
  const ChatWithUs({super.key});

  @override
  State<ChatWithUs> createState() => _ChatWithUsState();
}

class _ChatWithUsState extends State<ChatWithUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //     onSelected: (String value) {
        //       if (value == 'Home') {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => const Homepage()));
        //       } else if (value == 'AboutUs') {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => const AboutUs()));
        //       } else if (value == 'ContactUs') {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => const ContactUs()));
        //       } else if (value == 'DashBoard') {
        //         Navigator.push(context,
        //             MaterialPageRoute(builder: (context) => const Dashboard()));
        //       } else if (value == 'Testing & Reporting') {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const TestingAndReporting()));
        //       }
        //       print('You selected: $value');
        //     },
        //     itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        //       const PopupMenuItem<String>(
        //         value: 'Home',
        //         child: Text('Home'),
        //         textStyle: TextStyle(color: Colors.grey),
        //       ),
        //       const PopupMenuItem<String>(
        //         value: 'AboutUs',
        //         child: Text('About Us'),
        //       ),
        //       const PopupMenuItem<String>(
        //         value: 'ContactUs',
        //         child: Text('Contact Us'),
        //       ),
        //       const PopupMenuItem<String>(
        //         value: 'DashBoard',
        //         child: Text('DashBoard'),
        //       ),
        //       const PopupMenuItem<String>(
        //         value: 'Testing & Reporting',
        //         child: Text('Testing & Reporting'),
        //       ),
        //     ],
        //   ),
        // ],
        title: const Text('Chat Bot'),
        backgroundColor: Colors.green.shade400,
      ),
    );
  }
}
