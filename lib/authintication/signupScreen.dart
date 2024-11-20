import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment_5_new/authintication/signinScreen.dart';
import 'package:flutter_assignment_5_new/authintication/textFieldReusable.dart';
import 'AuthServices.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  final GlobalKey<FormState> formKeySignUp = GlobalKey<FormState>();
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
                      "Sign-Up",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Form(
                      key: formKeySignUp,
                      child: Column(
                        children: [
                          TextFieldReusable(
                            controller: nameController,
                            labelText: 'Full Name',
                            hintText: 'Enter your full name',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your name";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 15),
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
                          const SizedBox(height: 15),
                          TextFieldReusable(
                            controller: confirmPassController,
                            labelText: 'Confirm Password',
                            hintText: 'Re-enter your password',
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please confirm your password";
                              } else if (value != passController.text) {
                                return "Passwords do not match";
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
                                if (formKeySignUp.currentState!.validate()) {
                                  await authServices.signUp(
                                    emailController.text.trim(),
                                    passController.text.trim(),
                                  );
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SignInScreen(),
                                    ),
                                  );
                                }
                              } on FirebaseAuthException catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(e.message ?? "Sign-Up Failed"),
                                  ),
                                );
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Error: $e")),
                                );
                              }
                            },
                            child: const Text(
                              "Sign Up",
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
