// // import 'package:app_project/register_view.dart';
// // import 'dart:math';
// // import 'dart:developer';
// import 'dart:convert';

// // import 'package:app_project/splash_screen.dart';
// import 'package:app_project/api_call.dart';
// import 'package:app_project/register_view.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(
//             seedColor: const Color.fromARGB(255, 199, 109, 77)),
//         useMaterial3: true,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final scrollController = ScrollController();
//   List<dynamic> users = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text('hwllo'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // Container(
//                     //   margin: EdgeInsets.only(bottom: 11),
//                     //   height: 200,
//                     //   color: Colors.deepPurple,
//                     // ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.blue,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.red,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.grey,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.blue,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.red,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.grey,
//                             ),
//                             Container(
//                               margin: EdgeInsets.only(right: 11),
//                               height: 200,
//                               width: 200,
//                               color: Colors.blue,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.pink,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.black,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.red,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.blue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.yellow,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.black,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.brown,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.pink,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.lightBlue,
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: 11),
//                       height: 200,
//                       color: Colors.white,
//                     ),
//                     //  Navigator.push(
//                     //   context,
//                     //   MaterialPageRoute(
//                     //     builder: (context) => MyHomePage(),
//                     //   ));
//                     // ElevatedButton(
//                     //   onPressed: () {
//                     //     Navigator.push(
//                     //         context,
//                     //         MaterialPageRoute(
//                     //           builder: (context) => RegisterView(),
//                     //         ));
//                     //   },
//                     //   child: Text('This is my Page'),
//                     // ),
//                   ],
//                 ),

//                 // body:
//                 //     //  Align(
//                 //     //   alignment: Alignment(0.0, 0.5),
//                 //     // child: OutlinedButton(
//                 //     //   onPressed: () {
//                 //     ListView.builder(
//                 //   itemCount: users.length,
//                 //   itemBuilder: (context, index) {
//                 //     final user = users[index];
//                 //     final url = user['url'];
//                 //     return ListTile(
//                 //       title: Text(url),
//                 //     );
//                 //   },

//                 // print('Clicked Done');
//                 // },
//                 // child: Container(
//                 //   width: 150,
//                 //   height: 350,
//                 //   alignment: Alignment.center,
//                 //   child: const Text(
//                 //     'Tap for Soil Testing',
//                 //     style: TextStyle(fontSize: 25),
//                 //   ),
//                 // ),

//                 // ),
//                 // floatingActionButton: FloatingActionButton(
//                 //   onPressed: fetchUsers,
//               )),
//         ],
//       ),
//     );
//     // );
//   }
// }
// // void fetchUsers() async {
// //   print('fetchUser Called');

// //   const url = 'https://api.artic.edu/api/v1/artworks/search?q=cats';
// //   // 'https://www.themealdb.com/api/json/v1/1/search.php?ss'; // Corrected the URL assignment
// //   // 'https://api.apis.guru/v2/list.json';
// //   // 'https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/random?tags=vegetarian%2Cdessert&number=10'; // Corrected the URL assignment
// //   final uri = Uri.parse(url);
// //   final response = await http.get(uri);

// //   if (response.statusCode == 200) {
// //     final json = jsonDecode(response.body);
// //     setState(() {
// //       users = json[
// //           'x-origin']; // Ensure 'users' is properly initialized in your class
// //     });
// //     setState(() {});
// //   } else {
// //     print(
// //         'Failed to fetch users. Status code: ${response.statusCode}'); // Fixed typo in the error message
// //   }

// //   print('FetchUsers Completed');
// // }

// // void _scrollListner() {
// //   if (ScrollController.position.pixels ==
// //       ScrollController.position.maxScrollExtent) {
// //     // page = page + 1;
// //    fetchUsers();
// //   }
// // }
// // }


