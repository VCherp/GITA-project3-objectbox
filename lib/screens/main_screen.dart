import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import '../object_box/object_box_wrapper.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  final TextEditingController phoneNumberController =
      TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _obscureText = true;
  bool _notRegistered = false;
  bool _passIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Welcome Back',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Login to your account',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                const SizedBox(height: 50),
                TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                  controller: widget.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
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
                  obscureText: _obscureText,
                  cursorColor: Colors.white,
                  controller: widget.passwordController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.2),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText; // Toggles visibility
                          });
                        },
                      ),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                (_notRegistered)
                    ? const Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Phone number not registered',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                        ],
                      )
                    : (_passIncorrect)
                        ? const Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Password incorrect',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 60,
                              ),
                            ],
                          )
                        : const SizedBox(
                            height: 100,
                          ),
                ElevatedButton(
                  onPressed: () async {
                    final box = await ObjectBoxWrapper.getInstance();
                    final profile = box
                        .getProfileByPhone(widget.phoneNumberController.text);

                    if (profile == null) {
                      setState(() {
                        _notRegistered = true;
                      });
                      return;
                    }

                    if (profile.password != widget.passwordController.text) {
                      setState(() {
                        _passIncorrect = true;
                      });
                      return;
                    }

                    setState(() {
                      _notRegistered = false;
                      _passIncorrect = false;
                    });

                    widget.passwordController.clear();

                    if (context.mounted) {
                      Navigator.of(context)
                          .pushNamed('/details_screen', arguments: profile);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: const Size(300, 50),
                    elevation: 2,

                    backgroundColor: Colors.indigo.withOpacity(0.1),
                    //foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      // side: const BorderSide(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Sign in',
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
                      text: 'Don\'t have an account?   ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign up',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              widget.phoneNumberController.clear();
                              widget.passwordController.clear();

                              setState(() {
                                _notRegistered = false;
                                _passIncorrect = false;
                              });

                              Navigator.of(context)
                                  .pushNamed('/sign-up-screen');
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
