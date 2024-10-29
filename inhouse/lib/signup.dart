import 'package:flutter/material.dart';

void main() => runApp(SignUpPage());

class SignUpPage extends StatelessWidget {
  get confirmPasswordController => null;

  get passwordController => null;

  get nameController => null;

  get emailController => null;

  get phoneController => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.purple),
                        onPressed: () {},
                      ),
                      Text(
                        "BACK",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // Image Section
                Center(
                  child: Image.asset(
                    'assets/7768476.png', // Add the image to assets
                    height: 200,
                  ),
                ),
                // Name label and field
                SizedBox(height: 20),

                // Form Fields
                TextFormField(
                  controller: nameController,  // Controller for name field
                  decoration: InputDecoration(
                    labelText: 'NAME',
                    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.pink[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                // Spacing between the fields
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,  // Controller for email field
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.pink[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: phoneController,  // Controller for phone field
                  decoration: InputDecoration(
                    labelText: 'PHONE NUMBER',
                    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.pink[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,  // Controller for password field
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.pink[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,  // Controller for confirm password field
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'CONFIRM PASSWORD',
                    labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    filled: true,
                    fillColor: Colors.pink[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Sign Up Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple, // Background color
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'SIGN UP',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}