import 'package:flutter/material.dart';
import 'login.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top Purple Curved Shape (Shorter curve)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipPath(
              clipper: CustomShapeClipper(),
              child: Container(
                height: 320, // Shorter curve
                color: Color(0xFF937FBE), // Custom Purple
              ),
            ),
          ),

          // Main content of the screen
          Column(
            children: [
              Spacer(flex: 2), // Spacer for top padding

              // Center the Logo Image
              Center(
                child: Image.asset(
                  'assets/logo.png', // Your logo path
                  height: 150, // Adjust to match the image proportions
                ),
              ),

              SizedBox(height: 20), // Space between logo and text

              // Pink Banner Text
              Container(
                width: double.infinity, // Full width banner
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Color(0xFFED99BB), // Custom Pink
                child: Text(
                  "JOIN ON THE JOURNEY TOWARDS BETTER GLOW",
                  style: TextStyle(
                    color: Colors.white, // White text
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Full Purple Background after Pink Banner
              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Color(0xFF937FBE), // Custom Purple
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Sign Up Button (White border, white text, purple background)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              // Handle Sign Up action
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 2), // White border
                              backgroundColor: Colors.transparent, // Transparent to show purple background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30), // Rounded edges
                              ),
                            ),
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // White text
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 15), // Space between buttons

                      // Login Button (White border, white text, purple background)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );

                              // Handle Login action
                            },
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.white, width: 2), // White border
                              backgroundColor: Colors.transparent, // Transparent to show purple background
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30), // Rounded edges
                              ),
                            ),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // White text
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for the Curved Top Shape (Shorter curve)
class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height - 100); // Reduced curve height

    var firstControlPoint = Offset(size.width / 4, size.height - 50);
    var firstEndPoint = Offset(size.width / 2, size.height - 100);

    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 150);
    var secondEndPoint = Offset(size.width, size.height - 100);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}