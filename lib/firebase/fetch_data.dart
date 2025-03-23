// // import 'package:app_project/firebase/update_record.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';

// class FetchData extends StatefulWidget {
//   const FetchData({super.key});

//   @override
//   State<FetchData> createState() => _FetchDataState();
// }

// class _FetchDataState extends State<FetchData> {
//   Query dbRef = FirebaseDatabase.instance.ref('soil_samples');

//   Widget listItem({required Map soil_samples}) {
//     return Container(
//       margin: const EdgeInsets.all(10),
//       padding: const EdgeInsets.all(10),
//       height: 110,
//       color: const Color.fromARGB(255, 216, 240, 136),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             padding: const EdgeInsets.all(10), // Add padding around the text
//             decoration: BoxDecoration(
//               color: Colors.blue[50], // Light background color
//               borderRadius: BorderRadius.circular(8), // Rounded corners
//               border: Border.all(
//                   color: Colors.blue, width: 1), // Border color and width
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5), // Shadow color
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // Shadow position
//                 ),
//               ],
//             ),
//             child: Text(
//               'Phosphorus: ${soil_samples['Phosphorus']?.toString() ?? 'No Data'}', // Display with the label
//               style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black),
//             ),
//           ),
//           const SizedBox(height: 5), // Space between elements
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Fetching data'),
//         backgroundColor: Colors.green,
//       ),
//       body: SizedBox(
//         height: double.infinity,
//         child: FirebaseAnimatedList(
//           query: dbRef,
//           itemBuilder: (context, snapshot, animation, index) {
//             // Convert the snapshot value to a Map (essential for retrieving data)
//             Map<dynamic, dynamic> soilSamples =
//                 snapshot.value as Map<dynamic, dynamic>;

//             // Ensure we pass the data as a map to the listItem widget
//             return listItem(soil_samples: soilSamples);
//           },
//         ),
//       ),
//     );
//   }
// }
// import 'package:app_project/firebase/LatestData.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:krashak_sathi/firebase/LatestData.dart';

class FetchData extends StatefulWidget {
  const FetchData({super.key});

  @override
  State<FetchData> createState() => _FetchDataState();
}

class _FetchDataState extends State<FetchData> {
  Query dbRef = FirebaseDatabase.instance.ref('soil_samples');
  Map<dynamic, dynamic> latestSoilSample = {};

  Widget listItem({required Map soilSamples}) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 70,
        color: const Color.fromARGB(255, 216, 240, 136),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue, width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                'Phosphorus: ${soilSamples['Phosphorus']?.toString() ?? 'No Data'}',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }

  Future<void> fetchLatestData() async {
    try {
      Query latestQuery = dbRef.orderByKey().limitToLast(1);
      DataSnapshot snapshot = await latestQuery.get();

      if (snapshot.value != null) {
        Map<dynamic, dynamic> data = snapshot.value as Map<dynamic, dynamic>;
        setState(() {
          latestSoilSample = data.values.first;
        });
      } else {
        setState(() {
          latestSoilSample = {};
        });
      }
    } catch (e) {
      print('Error fetching latest data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetching data'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: FirebaseAnimatedList(
              query: dbRef,
              itemBuilder: (context, snapshot, animation, index) {
                if (snapshot.value == null || !(snapshot.value is Map)) {
                  return const SizedBox();
                }
                Map<dynamic, dynamic> soilSamples =
                    snapshot.value as Map<dynamic, dynamic>;
                return listItem(soilSamples: soilSamples);
              },
            ),
          ),
          MaterialButton(
            onPressed: () async {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) =>
                    const Center(child: CircularProgressIndicator()),
              );

              await fetchLatestData();

              Navigator.pop(context);

              if (latestSoilSample.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LatestDataPage(
                      soilSamples: latestSoilSample,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('No data available')),
                );
              }
            },
            child: const Text('View Latest Data'),
            color: const Color.fromARGB(255, 53, 143, 43),
            textColor: Colors.white,
            minWidth: 300,
            height: 40,
          ),
        ],
      ),
    );
  }
}
