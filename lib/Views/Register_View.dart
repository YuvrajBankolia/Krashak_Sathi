// // import 'package:app_project/Views/Login_View.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:krashak_sathi/api_call.dart';
// import 'package:krashak_sathi/services/firebase_auth_services.dart';
// // import 'package:krashak_sathi/Views/Login_View.dart';

// class RegisterView extends StatefulWidget {
//   const RegisterView({super.key});

//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }

// // @override
// // void dispose() {
// //   _emailController.dispose();
// //   _passwordController.dispose();
// //   super.dispose();
// // }
// //  @override
// //   void initState() {
// //     _emailController = TextEditingController();
// //     _passwordController = TextEditingController();
// //     super.initState();
// //   }

// // @override
// // void dispose() {
// //   _email.dispose();
// //   _password.dispose();
// //   super.dispose();
// // }
// class _RegisterViewState extends State<RegisterView> {
//   FirebaseAuthService _auth = FirebaseAuthService();
// // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Register Here'),
//           backgroundColor: Colors.brown.shade400,
//         ),
//         body: Column(
//           children: [
//             const TextField(
//               // controller: _password,
//               decoration: InputDecoration(
//                 hintText: 'Enter the password to Register here',
//               ),
//             ),
//             const TextField(
//               // controller: _email,
//               decoration:
//                   InputDecoration(hintText: 'Enter the Email to Register here'),
//             ),
//             TextButton(
//               onPressed: () async {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const RegisterView(),
//                     ));
//               },
//               child: const Text('Regsiter'),
//             ),
//           ],
//         ));
//   }

//   Future<void> _RegisterView() async {
//     String email = _emailController.text;
//     String password = _passwordController.text;

//     User? user = await _auth.RegisterWithEmailAndPassword(email, password);
//     if (user != null) {
//       print("User is successfully signed in");
//       // Navigator.pushNamed(context, MyHomePage() as String);
//       Navigator.pushNamed(context, MyHomePage() as String);
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:krashak_sathi/api_call.dart';
import 'package:krashak_sathi/popUpMenu/TestingAndReporting.dart';
import 'package:krashak_sathi/services/firebase_auth_services.dart';
// import 'package:krashak_sathi/MyHomePage.dart'; // Assuming this is your homepage

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register Here'),
        backgroundColor: Colors.brown.shade400,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController, // Fixed the controller
              decoration: const InputDecoration(
                hintText: 'Enter your email to register',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController, // Fixed the controller
              obscureText: true, // To make the password hidden
              decoration: const InputDecoration(
                hintText: 'Enter your password to register',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                await _registerUser(); // Call the register function
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      User? user = await _auth.RegisterWithEmailAndPassword(email, password);
      if (user != null) {
        // Successful registration
        print("User successfully signed in");

        // Use MaterialPageRoute to navigate to MyHomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const MyApp(), // Correctly navigate to MyHomePage
          ),
        );
      }
    } catch (e) {
      // Handle registration error
      print("Error: $e");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Registration Failed'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
