import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'About Us',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const Image(
                width: 300,
                height: 80,
                image: AssetImage("assets/images/3.jpg"),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Container(
                height: 150,
                width: 200,
                child: const Image(
                  width: 300,
                  height: 200,
                  image: AssetImage("assets/images/krashak.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Healthy soil is the backbone of successful agriculture. It impacts everything from crop yields to water retention and disease resistance, making it crucial for sustainable farming practices. By understanding your soil’s condition, you can make smarter decisions that improve productivity and protect your land for future generations. Empowering Farmers with Quick, Affordable, and Accurate Soil Health Testing',
                style:
                    TextStyle(fontSize: 16.0, color: Colors.black87, height: 2),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: const Text(
                  'support : krashakinnovatisolution@gmail.com',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

























    // return Scaffold(
    //   appBar: AppBar(
    //     leading: PopupMenuButton<String>(
    //       icon: Icon(Icons.menu), // Icon for the leading button
    //       onSelected: (String value) {
    //         if (value == 'Home') {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => const Homepage()));
    //         } else if (value == 'Chat With Us') {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => const ChatWithUs()));
    //         } else if (value == 'Contact Us') {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => const ContactUs()));
    //         } else if (value == 'DashBoard') {
    //           Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => const Dashboard()));
    //         } else if (value == 'Testing & Reporting') {
    //           Navigator.push(
    //               context,
    //               MaterialPageRoute(
    //                   builder: (context) => const TestingAndReporting()));
    //         }
    //       },
    //       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
    //         const PopupMenuItem<String>(
    //           value: 'Home',
    //           child: Text('Home'),
    //         ),
    //         const PopupMenuItem<String>(
    //           value: 'Chat With Us',
    //           child: Text('Chat With Us'),
    //         ),
    //         const PopupMenuItem<String>(
    //           value: 'Contact Us',
    //           child: Text('Contact Us'),
    //         ),
    //         const PopupMenuItem<String>(
    //           value: 'DashBoard',
    //           child: Text('DashBoard'),
    //         ),
    //         const PopupMenuItem<String>(
    //           value: 'Testing & Reporting',
    //           child: Text('Testing & Reporting'),
    //         ),
    //       ],
    //     ),
    //     title: const Text('About Us'),
    //     backgroundColor: Colors.green.shade400,
    //   ),
    // );
