// import 'package:flutter_blue_plus/flutter_blue_plus.dart'; // ✅ Correct import
// import 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart';
// // import 'package:permission_handler/permission_handler.dart'; // ✅ Import permission_handler

// class BleController extends GetxController {
//   FlutterBluePlus flutterBlue = FlutterBluePlus();
//   RxList<ScanResult> scanResultsList = <ScanResult>[].obs;
//   RxBool isScanning = false.obs;

//   // 🔹 Function to request permissions and scan nearby BLE devices
//   Future<void> scanDevices() async {
//     if (await Permission.bluetoothScan.request().isGranted &&
//         await Permission.bluetoothConnect.request().isGranted &&
//         await Permission.locationWhenInUse.request().isGranted) {
//       // 🔹 Location permission is required for BLE scanning on Android

//       isScanning.value = true;
//       scanResultsList.clear();

//       FlutterBluePlus.startScan(
//           timeout: const Duration(seconds: 15)); // ✅ Corrected instance call

//       // 🔹 Listen to scan results
//       FlutterBluePlus.scanResults.listen((results) {
//         print("run 3");
//         scanResultsList.assignAll(results);
//       });

//       // 🔹 Stop scanning after timeout
//       Future.delayed(Duration(seconds: 15), () {
//         print("run 1");
//         FlutterBluePlus.stopScan(); // ✅ Corrected instance call
//         print("run 2");
//         isScanning.value = false;
//       });
//     }
//   }

//   // 🔹 Function to connect to a BLE device
//   Future<void> connectToDevice(BluetoothDevice device) async {
//     try {
//       await device.connect(timeout: Duration(seconds: 15));

//       // 🔹 Listen to connection state changes
//       device.connectionState.listen((BluetoothConnectionState state) {
//         if (state == BluetoothConnectionState.connecting) {
//           print("🔄 Connecting to: ${device.platformName}");
//         } else if (state == BluetoothConnectionState.connected) {
//           print("✅ Connected: ${device.platformName}");
//         } else if (state == BluetoothConnectionState.disconnected) {
//           print("❌ Disconnected: ${device.platformName}");
//         }
//       });
//     } catch (e) {
//       print("⚠️ Connection Error: $e");
//     }
//   }
// }


// // import 'package:flutter/material.dart';
// // import 'package:flutter_blue_plus/flutter_blue_plus.dart';

// // void main() {
// //   runApp(BluetoothApp());
// // }

// // class BluetoothApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: BluetoothScreen(),
// //     );
// //   }
// // }

// // class BluetoothScreen extends StatefulWidget {
// //   @override
// //   _BluetoothScreenState createState() => _BluetoothScreenState();
// // }

// // class _BluetoothScreenState extends State<BluetoothScreen> {
// //   FlutterBluePlus flutterBlue = FlutterBluePlus();
// //   List<BluetoothDevice> devicesList = [];
// //   bool isScanning = false;

// //   void startScan() {
// //     setState(() {
// //       isScanning = true;
// //       devicesList.clear();
// //     });

// //     FlutterBluePlus.startScan(timeout: Duration(seconds: 5));
// //     FlutterBluePlus.scanResults.listen((results) {
// //       for (ScanResult result in results) {
// //         if (!devicesList.contains(result.device)) {
// //           setState(() {
// //             devicesList.add(result.device);
// //           });
// //         }
// //       }
// //     }).onDone(() {
// //       setState(() {
// //         isScanning = false;
// //       });
// //     });
// //   }

// //   void connectToDevice(BluetoothDevice device) async {
// //     try {
// //       await device.connect();
// //       print("Connected to ${device.name}");
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Connected to ${device.name}")),
// //       );
// //     } catch (e) {
// //       print("Connection failed: $e");
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text("Connection failed")),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("Bluetooth Devices")),
// //       body: Column(
// //         children: [
// //           ElevatedButton(
// //             onPressed: isScanning ? null : startScan,
// //             child: Text(isScanning ? "Scanning..." : "Scan Devices"),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               itemCount: devicesList.length,
// //               itemBuilder: (context, index) {
// //                 return ListTile(
// //                   title: Text(devicesList[index].name.isNotEmpty
// //                       ? devicesList[index].name
// //                       : "Unknown Device"),
// //                   subtitle: Text(devicesList[index].id.toString()),
// //                   onTap: () => connectToDevice(devicesList[index]),
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_blue/flutter_blue.dart';

// // // void main() {
// // //   runApp(MyApp());
// // // }

// // // class MyApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter ESP32 Bluetooth',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //       ),
// // //       home: BluetoothHomePage(),
// // //     );
// // //   }
// // // }

// // // class BluetoothHomePage extends StatefulWidget {
// // //   @override
// // //   _BluetoothHomePageState createState() => _BluetoothHomePageState();
// // // }

// // // class _BluetoothHomePageState extends State<BluetoothHomePage> {
// // //   FlutterBlue flutterBlue = FlutterBlue.instance;
// // //   BluetoothDevice? connectedDevice;
// // //   List<BluetoothService> services = [];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     startScan();
// // //   }

// // //   void startScan() async {
// // //     flutterBlue.startScan(timeout: Duration(seconds: 4));

// // //     flutterBlue.scanResults.listen((results) {
// // //       for (ScanResult result in results) {
// // //         print('Device found: ${result.device.name}');

// // //         // Replace 'ESP32_Device' with the name you set on your ESP32
// // //         if (result.device.name == 'ESP32Testing') {
// // //           flutterBlue.stopScan();
// // //           connectToDevice(result.device);
// // //           break;
// // //         }
// // //       }
// // //     });
// // //   }

// // //   void connectToDevice(BluetoothDevice device) async {
// // //     await device.connect();
// // //     print('Connected to ${device.name}');

// // //     setState(() {
// // //       connectedDevice = device;
// // //     });

// // //     discoverServices(device);
// // //   }

// // //   void discoverServices(BluetoothDevice device) async {
// // //     List<BluetoothService> services = await device.discoverServices();
// // //     setState(() {
// // //       this.services = services;
// // //     });

// // //     for (var service in services) {
// // //       print('Service found: ${service.uuid}');
// // //       for (var characteristic in service.characteristics) {
// // //         print('Characteristic found: ${characteristic.uuid}');
// // //       }
// // //     }
// // //   }

// // //   Future<void> sendData(String data) async {
// // //     if (connectedDevice != null) {
// // //       for (var service in services) {
// // //         for (var characteristic in service.characteristics) {
// // //           if (characteristic.properties.write) {
// // //             await characteristic.write(data.codeUnits);
// // //             print('Data sent: $data');
// // //             return;
// // //           }
// // //         }
// // //       }
// // //     } else {
// // //       print("Device not connected.");
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('ESP32 Bluetooth'),
// // //       ),
// // //       body: Center(
// // //         child: connectedDevice != null
// // //             ? Column(
// // //                 mainAxisAlignment: MainAxisAlignment.center,
// // //                 children: [
// // //                   Text('Connected to ${connectedDevice!.name}'),
// // //                   SizedBox(height: 20),
// // //                   ElevatedButton(
// // //                     onPressed: () => sendData("Hello ESP32"),
// // //                     child: Text("Send Data"),
// // //                   ),
// // //                 ],
// // //               )
// // //             : Text('Scanning for ESP32...'),
// // //       ),
// // //     );
// // //   }
// // // }
