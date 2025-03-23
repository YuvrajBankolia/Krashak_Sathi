// import 'package:app_project/homePage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});
  @override
  State<DashBoard> createState() => _DashBoardState();
}

//  = FirebaseFirestore.instance;
class _DashBoardState extends State<DashBoard> {
  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Controllers to hold the form data
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  // GlobalKey to manage form state
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to validate the phone number
  String? _validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Enter the Phone number';
    }
    if (value.length != 10) {
      return 'Please enter a 10-digit Phone Number';
    }
    return null;
  }

  String? _validatePincode(String? value) {
    if (value!.isEmpty) {
      return 'Enter the Pincode';
    }
    if (value.length != 6) {
      return 'Please enter the PinCode';
    }
    return null;
  }

  // Function to submit the form and write data to Firestore
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Create a user data map
      final userData = {
        'username': _usernameController.text,
        'father_name': _fatherNameController.text,
        'phone_number': _phoneNumberController.text,
        'address': _addressController.text,
        'pincode': _pincodeController.text,
        'location': _locationController.text,
        'createdAt': FieldValue.serverTimestamp(), // Add timestamp
      };

      // Write data to Firestore (users collection)
      _firestore.collection('users').add(userData).then((_) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data submitted successfully!')),
        );
      }).catchError((error) {
        // Handle errors
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to submit data: $error')),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DashBoard'),
        backgroundColor: Colors.green.shade400,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                'Fill the details for Check your soil health',
                style: TextStyle(
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _usernameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Username';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _fatherNameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Father's Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter Father's Name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneNumberController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: _validatePhoneNumber,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                  hintText: 'Address',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _pincodeController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Pincode',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: _validatePincode,
              ),

              // validator: (value) {
              //   if (value!.isEmpty) {
              //     return 'Please enter PinCode';
              //   }
              //   return null;
              // },
              // ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Location',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter Location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text('Submit'),
                  // onLongPress: () => Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const Homepage()))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
