import 'package:flutter/material.dart';

import 'package:flutter/gestures.dart';

import '../models/profile.dart';
import '../object_box/object_box_wrapper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //final profile = ModalRoute.of(context)?.settings.arguments as Profile?;

    TextEditingController nameController = TextEditingController(text: '');
    TextEditingController phoneNumberController =
        TextEditingController(text: '');
    TextEditingController locationController = TextEditingController(text: '');
    TextEditingController passwordController = TextEditingController(text: '');
    TextEditingController confirmPasswordController =
        TextEditingController(text: '');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.indigo],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Create your account',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 50),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: const TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      //prefix: const Text('+995 '),
                      prefixStyle:
                          const TextStyle(color: Colors.white, fontSize: 18),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 30),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      // hintText: 'Phone number',
                      // hintStyle: const TextStyle(
                      //     color: Colors.white38,
                      //     fontSize: 15,
                      //     fontStyle: FontStyle.italic),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      prefix: const Text('+995 '),
                      prefixStyle:
                          const TextStyle(color: Colors.white, fontSize: 18),
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 30),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: locationController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: 'Location',
                      hintStyle: const TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      //prefix: const Text('+995 '),
                      // prefixStyle:
                      // const TextStyle(color: Colors.white, fontSize: 18),
                      prefixIcon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 30),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  obscureText: true,
                  cursorColor: Colors.white,
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: const TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _obscureText
                      //         ? Icons.visibility_off
                      //         : Icons.visibility,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       _obscureText = !_obscureText; // Toggles visibility
                      //     });
                      //   },
                      // ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(height: 30),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  obscureText: true,
                  cursorColor: Colors.white,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      hintText: 'Confirm password',
                      hintStyle: const TextStyle(
                          color: Colors.white38,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      // suffixIcon: IconButton(
                      //   icon: Icon(
                      //     _obscureText
                      //         ? Icons.visibility_off
                      //         : Icons.visibility,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {
                      //     setState(() {
                      //       _obscureText = !_obscureText; // Toggles visibility
                      //     });
                      //   },
                      // ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (passwordController.text !=
                        confirmPasswordController.text) {
                      return;
                    }

                    final profile = Profile(
                        name: nameController.text,
                        phone: phoneNumberController.text,
                        location: locationController.text,
                        password: passwordController.text);

                    final box = await ObjectBoxWrapper.getInstance();
                    await box.addProfile(profile);

                    if (context.mounted) {
                      Navigator.of(context)
                          .pushNamed('/details_screen', arguments: profile);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    elevation: 2,
                    backgroundColor: Colors.indigo.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      // side: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: 'Already have an account?   ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Login',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              phoneNumberController.clear();
                              passwordController.clear();

                              Navigator.popUntil(
                                context,
                                ModalRoute.withName('/'),
                              );
                            },
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
