import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class UpdateRecord extends StatefulWidget {
  const UpdateRecord({Key? key, required this.Soil_samplesKey})
      : super(key: key);

  final String Soil_samplesKey;

  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}

class _UpdateRecordState extends State<UpdateRecord> {
  final userNameController = TextEditingController();
  final userAgeController = TextEditingController();
  // final userSalaryController = TextEditingController();

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Soil Samples');
    getSoil_samplesData();
  }

  void getSoil_samplesData() async {
    DataSnapshot snapshot = await dbRef.child(widget.Soil_samplesKey).get();

    Map soil_samples = snapshot.value as Map;

    userNameController.text = soil_samples['No.'];
    userAgeController.text = soil_samples['Phosphorus'];
    // userSalaryController.text = soil_samples['salary'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Updating data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter the number',
                  hintText: 'value of Phosporus',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userAgeController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter the number',
                  hintText: 'value of Phosporus',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextField(
                // controller: userSalaryController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'enter the number',
                  hintText: 'value of Phosporus',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
                  Map<String, String> Soil_samples = {
                    'No.': userNameController.text,
                    'Phosporus': userAgeController.text,
                    // 'salary': userSalaryController.text
                  };

                  dbRef
                      .child(widget.Soil_samplesKey)
                      .update(Soil_samples)
                      .then((value) => {Navigator.pop(context)});
                },
                child: Text('Update Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
