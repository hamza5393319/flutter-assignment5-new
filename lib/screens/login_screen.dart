import 'package:flutter/material.dart';

import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Medical Icon
              Icon(
                Icons.health_and_safety,
                size: 80,
                color: Colors.blue,
              ),

              SizedBox(height: 16),

              // Title
              Text(
                'Quick Medical',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 8),

              // Subtitle
              Text(
                'Please Enter your Mobile Number to Login/Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              SizedBox(height: 24),

              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: '+91 9265614292',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),

              SizedBox(height: 24),

              // Continue Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                child: Center(
                  child: Text(
                    'CONTINUE',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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