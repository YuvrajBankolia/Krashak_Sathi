// import 'package:app_project/popUpMenu/AboutUs.dart';
// import 'package:app_project/popUpMenu/ChatWithUs.dart';
// import 'package:app_project/popUpMenu/ContactUs.dart';
// import 'package:app_project/popUpMenu/DashBoard.dart';
// import 'package:app_project/popUpMenu/TestingAndReporting.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:app_project/register_view.dart';
import 'package:flutter/material.dart';
import 'package:krashak_sathi/popUpMenu/AboutUs.dart';
import 'package:krashak_sathi/popUpMenu/ContactUs.dart';
import 'package:krashak_sathi/popUpMenu/DashBoard.dart';
import 'package:krashak_sathi/popUpMenu/TestingAndReporting.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Homepage()));
        },
        child: Text('Next to the Elevation Button'));
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String value) {
                if (value == 'Home') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Homepage()));
                } else if (value == 'AboutUs') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutUs()));
                } else if (value == 'ContactUs') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                } else if (value == 'DashBoard') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                }
                // else if (value == 'ChatWithUs') {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const ChatWithUs()));
                // }
                else if (value == 'Testing&Reporting') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TestingAndReporting()));
                }
                print('You selected: $value');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                // const PopupMenuItem<String>(
                //   value: 'Home',
                //   child: Text('Home'),
                // ),
                const PopupMenuItem<String>(
                  value: 'AboutUs',
                  child: Text('AboutUs'),
                ),
                const PopupMenuItem<String>(
                  value: 'ContactUs',
                  child: Text('ContactUs'),
                  // textStyle: TextStyle(color: Colors.grey),
                ),
                const PopupMenuItem<String>(
                  value: 'DashBoard',
                  child: Text('DashBoard'),
                ),
                // const PopupMenuItem<String>(
                //   value: 'LeadForm',
                //   child: Text('LeadForm'),
                // ),
                // const PopupMenuItem<String>(
                //   value: 'ChatWithUs',
                //   child: Text('ChatWithUs'),
                // ),
                const PopupMenuItem<String>(
                  value: 'Testing&Reporting',
                  child: Text('Testing&Reporting'),
                ),
              ],
            ),
          ],
          // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text('Krashak Innovative Solution'),
          backgroundColor: Colors.green.shade400,
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
              child: Container(
                height: 0,
                child: RichText(
                  text: const TextSpan(
                    text: '',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [TextSpan(text: '')],
                  ),
                ),
              ),
            ),
            CarouselSlider(
              items: [
                //1st Image of Slider
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://fruitgrowers.com/wp-content/uploads/2019/04/fertilizers-1-1-768x433.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                //4th Image of Slider
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2024/04/05/05/17/drone-8676564_640.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.agritechtomorrow.com/images/articles/15252.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //5th Image of Slider
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2024/06/18/03/55/modern-farming-8836914_1280.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.warligarden.com/wp-content/uploads/What-is-Soil-Less-Farming-768x432.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                // height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 10,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1.0,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
              child: RichText(
                text: const TextSpan(
                  text:
                      ('  𝐖𝐞𝐥𝐜𝐨𝐦𝐞 𝐭𝐨 𝐊𝐫𝐚𝐬𝐡𝐚𝐤 𝐈𝐧𝐧𝐨𝐯𝐚𝐭𝐢𝐯𝐞 𝐒𝐨𝐥𝐮𝐭𝐢𝐨𝐧'),
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                  children: <TextSpan>[
                    TextSpan(
                      // text: ' how are you?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
              child: RichText(
                text: const TextSpan(
                  text:
                      ('  We are committed to revolutionizing agriculture by giving farmers the tools they need to optimize soil health and boost crop productivity. Our innovative portable soil testing device provides fast, reliable results on-site, allowing farmers to take control of their land’s health without the high costs and long delays of traditional methods.'),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  children: <TextSpan>[
                    TextSpan(
                      // text: ' how are you?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 12.0, 4.0),
              child: Container(
                height: 190,
                width: 250,
                color: Colors.brown.shade200,
                child: const Stack(
                  fit: StackFit.expand,
                  children: [
                    Image(
                      width: 100,
                      image: AssetImage("assets/images/slider2.jpg"),
                      // fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8.0, 10.0, 8.0, 4.0),
              child: RichText(
                text: const TextSpan(
                  text:
                      ('  Healthy soil is the backbone of successful agriculture. It impacts everything from crop yields to water retention and disease resistance, making it crucial for sustainable farming practices. By understanding your soil’s condition, you can make smarter decisions that improve productivity and protect your land for future generations.'),
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                  children: <TextSpan>[
                    TextSpan(
                      // text: ' how are you?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
