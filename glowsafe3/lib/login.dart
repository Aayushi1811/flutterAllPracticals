import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glowsafe3/productscan.dart';


class LoginPage extends StatelessWidget {
  // Controllers for text fields
  final TextEditingController emailOrPhoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Firebase Auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Keep the background white
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Back button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, color: Color(0xFF937FBE)), // Custom purple for back icon
                  onPressed: () {
                    Navigator.pop(context); // Go back to the previous screen
                  },
                ),
              ),
              SizedBox(height: 20),

              // Image at the top
              Container(
                height: 200,
                child: Image.asset('assets/photo3.png'), // Add your image asset here
              ),
              SizedBox(height: 40),

              // Email or Phone Number TextField
              TextField(
                controller: emailOrPhoneController,
                decoration: InputDecoration(
                  hintText: 'EMAIL',
                  filled: true,
                  fillColor: Color(0xFFED99BB), // Custom pink background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Password TextField
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'PASSWORD',
                  filled: true,
                  fillColor: Color(0xFFED99BB), // Custom pink background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Forgot password
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    if (emailOrPhoneController.text.isNotEmpty) {
                      try {
                        await _auth.sendPasswordResetEmail(
                          email: emailOrPhoneController.text.trim(),
                        );
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Password Reset'),
                            content: Text(
                                'A password reset email has been sent to ${emailOrPhoneController.text.trim()}.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } catch (e) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text('Please enter your email address.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    'FORGOT PASSWORD?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Login button
              Container(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF937FBE), // Custom purple button color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                        email: emailOrPhoneController.text.trim(),
                        password: passwordController.text.trim(),
                      );

                      if (userCredential.user != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Login Successful'),
                            content: Text('You are now logged in as ${userCredential.user?.email}'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => ProductScanPage()), // Replace with your HomePage widget
                                  );
                                },
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    } catch (e) {
                      print("Login failed: $e");
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Error'),
                          content: Text(e.toString()),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
