import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.green.shade400,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                  child: Container(
                    height: 250,
                    width: 300,
                    color: Colors.brown.shade200,
                    child: const Stack(
                      fit: StackFit.expand,
                      children: [
                        Image(
                          width: 100,
                          image: AssetImage("assets/images/krashak.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
                  child: Container(
                    height: 300,
                    width: 250,
                    color: Colors.brown.shade200,
                    child: const Stack(
                      fit: StackFit.expand,
                      children: [
                        Image(
                          width: 100,
                          image: AssetImage("assets/images/slider1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildIconButton(
                      url:
                          'https://www.linkedin.com/company/krashak-innovative-solutions/',
                      icon: FontAwesomeIcons.linkedin,
                    ),
                    buildIconButton(
                      url:
                          'https://www.instagram.com/krashak_innovative_solutions?igsh=eWNyZGRzZ3h2a2lm',
                      icon: FontAwesomeIcons.instagram,
                    ),
                    buildIconButton(
                      url:
                          'https://www.youtube.com/channel/UCTitp5bMsIRAedl1zans2fw',
                      icon: FontAwesomeIcons.youtube,
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Email reference at the bottom
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: InkWell(
              onTap: () async {
                await Clipboard.setData(
                    ClipboardData(text: "krashakinnovativesolution.com"));
                // print('inkwell Tapped');
              },
              child: Text(
                'For more inquiries, contact us at: krashakinnovativesolution@gmail.com',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIconButton({required String url, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.grey.shade300,
        child: IconButton(
          onPressed: () async {
            final Uri uri = Uri.parse(url);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not launch $url')),
              );
            }
          },
          icon: Icon(icon, size: 20),
        ),
      ),
    );
  }
}

























// import 'package:app_project/homePage.dart';
// import 'package:app_project/popUpMenu/AboutUs.dart';
// import 'package:app_project/popUpMenu/ChatWithUs.dart';
// import 'package:app_project/popUpMenu/DashBoard.dart';
// import 'package:app_project/popUpMenu/TestingAndReporting.dart';
// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:url_launcher/url_launcher.dart';

// class ContactUs extends StatefulWidget {
//   const ContactUs({super.key});

//   @override
//   State<ContactUs> createState() => _ContactUsState();
// }

// class _ContactUsState extends State<ContactUs> {
//   // List imageList = [
//   //   {
//   //     "id": 1,
//   //     "image_path": 'assets/images/green-bokeh-nature-blur-element-design.jpg'
//   //   },
//   //   {"id": 2, "image_path": 'assets/images/landscape-8592826.jpg'},
//   //   {"id": 3, "image_path": 'assets/images/slider1.jpg'},
//   //   {"id": 4, "image_path": 'assets/images/slider2.jpg'},
//   //   {"id": 5, "image_path": 'assets/images/slider3.jpg'},
//   // ];
//   final CarouselController carouselController = CarouselController();
//   // final scrollController = ScrollController();
//   bool isLoadingMore = false;
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     // scrollController.addListener(_scrollListener);
//     // fetchPosts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: <Widget>[
//           PopupMenuButton<String>(
//             onSelected: (String value) {
//               if (value == 'Home') {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const Homepage()));
//               } else if (value == 'About Us') {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const AboutUs()));
//               } else if (value == 'DashBoard') {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => const Dashboard()));
//               } else if (value == 'Chat With Us') {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const ChatWithUs()));
//               } else if (value == 'Testing & Reporting') {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const TestingAndReporting()));
//               }
//             },
//             itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//               const PopupMenuItem<String>(
//                 value: 'Home',
//                 child: Text('Home'),
//               ),
//               const PopupMenuItem<String>(
//                 value: 'About Us',
//                 child: Text('About Us'),
//               ),
//               const PopupMenuItem<String>(
//                 value: 'DashBoard',
//                 child: Text('DashBoard'),
//               ),
//               const PopupMenuItem<String>(
//                 value: 'Chat With Us',
//                 child: Text('Chat With Us'),
//               ),
//               const PopupMenuItem<String>(
//                 value: 'Testing & Reporting',
//                 child: Text('Testing & Reporting'),
//               ),
//             ],
//           ),
//         ],
//         title: const Text('Contact Us'),
//         backgroundColor: Colors.green.shade400,
//       ),
//       body: ListView(
//         padding: EdgeInsets.zero, // Adjust padding if needed
//         children: [
//           Padding(
//             padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
//             child: Container(
//               height: 200,
//               width: 250,
//               color: Colors.brown.shade200,
//               child: const Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   Image(
//                     image: AssetImage("assets/images/slider1.jpg"),
//                     fit: BoxFit.cover,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // LinkedIn IconButton
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   color: Colors.white,
//                   child: IconButton(
//                     onPressed: () async {
//                       final Uri url = Uri.parse(
//                           'https://www.linkedin.com/company/krashak-innovative-solutions/');
//                       if (await url_launcher(url)) {
//                         await launchUrl(url);
//                       } else {
//                         throw 'Could not launch $url';
//                       }
//                     },
//                     icon: const Icon(
//                       FontAwesomeIcons.linkedin,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               // Instagram IconButton
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   color: Colors.white,
//                   child: IconButton(
//                     onPressed: () async {
//                       final Uri url = Uri.parse(
//                           'https://www.instagram.com/krashak_innovative_solutions?igsh=eWNyZGRzZ3h2a2lm');
//                       if (await canLaunchUrl(url)) {
//                         // 'https://www.linkedin.com/company/krashak-innovative-solutions/');
//                         await launchUrl(url);
//                       } else {
//                         throw 'Could not launch $url';
//                       }
//                     },
//                     icon: const Icon(
//                       FontAwesomeIcons.instagram,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//               // Facebook IconButton
//               // Padding(
//               //   padding: const EdgeInsets.all(10.0),
//               //   child: Container(
//               //     color: Colors.white,
//               //     child: IconButton(
//               //       onPressed: () async {
//               //         final Uri url = Uri.parse(
//               //             'https://www.facebook.com/your_facebook_page/');
//               //         if (await canLaunchUrl(url)) {
//               //           await launchUrl(url);
//               //         } else {
//               //           throw 'Could not launch $url';
//               //         }
//               //       },
//               //       icon: const Icon(
//               //         FontAwesomeIcons.facebook,
//               //         size: 20,
//               //       ),
//               //     ),
//               //   ),
//               // ),
//               // Twitter IconButton (optional example)
//               Padding(
//                 padding: const EdgeInsets.all(10.0),
//                 child: Container(
//                   color: Colors.white,
//                   child: IconButton(
//                     onPressed: () async {
//                       final Uri url =
//                           Uri.parse('https://twitter.com/your_twitter_handle');
//                       if (await canLaunchUrl(url)) {
//                         await launchUrl(url);
//                       } else {
//                         throw 'Could not launch $url';
//                       }
//                     },
//                     icon: const Icon(
//                       FontAwesomeIcons.twitter,
//                       size: 20,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

          // CarouselSlider(
          //   items: [
          //     //1st Image of Slider
          //     Container(
          //       margin: EdgeInsets.all(8.0),
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10.0),
          //         image: const DecorationImage(
          //           image: NetworkImage(
          //               "https://images.pexels.com/photos/974314/pexels-photo-974314.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          //           fit: BoxFit.cover,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // //4th Image of Slider
          // Container(
          //   margin: EdgeInsets.all(8.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://i.pinimg.com/236x/d1/42/d8/d142d8b7a2e493ab8e6523ec42a5c420.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          // //5th Image of Slider
          // Container(
          //   margin: EdgeInsets.all(8.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     image: const DecorationImage(
          //       image: NetworkImage(
          //           "https://i.pinimg.com/236x/9e/b0/68/9eb06848cce89fc5d8f48e50bcea269e.jpg"),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          // options: CarouselOptions(
          //   height: 200.0,
          //   enlargeCenterPage: true,
          //   autoPlay: true,
          //   aspectRatio: 16 / 10,
          //   autoPlayCurve: Curves.fastOutSlowIn,
          //   enableInfiniteScroll: true,
          //   autoPlayAnimationDuration: Duration(milliseconds: 800),
          //   viewportFraction: 0.8,
          // ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
          //   child: RichText(
          //     text: const TextSpan(
          //       text: (''),
          //       style: TextStyle(color: Colors.black, fontSize: 18.0),
          //       children: <TextSpan>[
          //         TextSpan(
          //           // text: ' how are you?',
          //           style: TextStyle(fontWeight: FontWeight.bold),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
   // Padding(
          //   padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
          //   child: Container(
          //     height: 200,
          //     child: ListView(
          //       scrollDirection: Axis.horizontal,
          //       children: [
          //         Padding(
          //           padding: EdgeInsets.all(5.0),
          //           child: Container(
          //             height: 150,
          //             width: 200,
          //             color: Colors.blueGrey,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(5.0),
          //           child: Container(
          //             height: 150,
          //             width: 200,
          //             color: Colors.blueGrey,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
          //   child: Container(
          //     height: 200,
          //     color: Colors.blueGrey,
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
          //   child: Container(
          //     height: 200,
          //     color: Colors.blueGrey,
          //   ),
          // ),