import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krashak_sathi/Views/Register_View.dart';
import 'package:krashak_sathi/homePage.dart';
import 'package:krashak_sathi/services/firebase_auth_services.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // late final TextEditingController _email;
  // late final TextEditingController _password;
// _email
  // @override
  // void initState() {
  //   _email = TextEditingController();
  //   _password = TextEditingController();
  //   super.initState();
  // }

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
        title: const Text('Login'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login to your account',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final email = _emailController.text;
                final password = _passwordController.text;

                // Perform login logic here
                print('Email: $email, Password: $password');
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Logic for forgot password
                print('Forgot Password Pressed');
              },
              child: const Text('Forgot Password?'),
            ),
            TextButton(
              onPressed: () async {
                // const RegisterView();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterView()));
              },
              child: const Text('Not registered? Register here!'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> SignIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      User? user = await _auth.signInWithEmailAndPassword(email, password);
      if (user != null) {
        print("User successfully signed in");

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const Homepage(), // Ensure HomePage is defined correctly
          ),
        );
      }
    } catch (e) {
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
                  Navigator.of(context).pop(const Homepage());
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













// import '../../api_call.dart';
// import 'package:flutter/material.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key}); // The constructor is constant

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Padding(
//         // Removed the const keyword here
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             const Text(
//                 'Please login your account in order to interact with and create notes!'),
//             const TextField(
//               decoration:
//                   InputDecoration(hintText: '  Enter your email address'),
//             ),
//             const TextField(
//               decoration: InputDecoration(
//                 hintText: '  Enter your password here  ',
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         MyHomePage(), // Navigates to RegisterView
//                   ),
//                 );
//               },
//               child: const Text('If you do not register, Register Here'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:app_project/register_view.dart';
// import 'package:flutter/material.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         backgroundColor: Colors.blue,
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(
//                 'Please login your account in order to interact with and create notes!'),
//             TextField(
//               decoration:
//                   InputDecoration(hintText: '  Enter your email address'),
//             ),
//             TextField(
//               decoration: InputDecoration(
//                 hintText: '  Enter your password here  ',
//               ),
//             ),
//             // Text(' If you dont register , Register Here'),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const RegisterView()));
//               },
//               child: const Text(' If you dont register , Register Here'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
