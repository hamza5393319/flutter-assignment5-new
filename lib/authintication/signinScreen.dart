import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../authintication/textFieldReusable.dart';
import '../screens/splash_screen.dart';
import 'AuthServices.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<FormState> formKeySignIn = GlobalKey<FormState>();
  final AuthServices authServices = AuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "Sign-In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formKeySignIn,
                      child: Column(
                        children: [
                          TextFieldReusable(
                            controller: emailController,
                            labelText: 'Email',
                            hintText: 'Enter your email',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              } else if (!value.contains('@')) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
                          TextFieldReusable(
                            controller: passController,
                            labelText: 'Password',
                            hintText: 'Enter your password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your password";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 50,
                                vertical: 15,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () async {
                              try {
                                if (formKeySignIn.currentState!.validate()) {
                                  await authServices.signIn(
                                    emailController.text.trim(),
                                    passController.text.trim(),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                      const SplashScreen(),
                                    ),
                                  );
                                }
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        e.message ?? "Sign-In Failed"),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error: $e")),
                                );
                              }
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
