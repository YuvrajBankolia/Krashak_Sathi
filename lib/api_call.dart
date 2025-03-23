import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krashak_sathi/Esp32.dart';
import 'package:krashak_sathi/firebase_options.dart';
import 'package:krashak_sathi/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 199, 109, 77)),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Krashak'),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:krashak_sathi/Esp32.dart';
// import 'package:krashak_sathi/popUpMenu/TestingAndReporting.dart';
// // import 'ble_controller.dart'; // ✅ Correct import

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'BLE Scanner',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final BleController controller =
//         Get.put(BleController()); // ✅ Initialize controller

//     return Scaffold(
//       appBar: AppBar(title: Text("BLE SCANNER")),
//       body: Column(
//         children: [
//           Expanded(
//             child: Obx(() {
//               if (controller.isScanning.value) {
//                 return Center(
//                     child:
//                         CircularProgressIndicator()); // ✅ Show loading when scanning
//               }

//               if (controller.scanResultsList.isEmpty) {
//                 return Center(child: Text("No Device Found"));
//               }

//               return ListView.builder(
//                 itemCount: controller.scanResultsList.length,
//                 itemBuilder: (context, index) {
//                   final data = controller.scanResultsList[index];
//                   return Card(
//                     elevation: 2,
//                     child: ListTile(
//                       title: Text(data.device.name.isNotEmpty
//                           ? data.device.name
//                           : "Unknown Device"),
//                       subtitle: Text(data.device.id.toString()),
//                       trailing: Text("RSSI: ${data.rssi}"),
//                       onTap: () => controller.connectToDevice(data.device),
//                     ),
//                   );
//                 },
//               );
//             }),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton(
//             onPressed: () async {
//               controller.scanDevices();
//             },
//             child: Text("SCAN"),
//           ),
//           SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }
