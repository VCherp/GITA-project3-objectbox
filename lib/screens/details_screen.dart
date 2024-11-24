import 'package:flutter/material.dart';

import '../models/profile.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = ModalRoute.of(context)?.settings.arguments as Profile?;

    return Scaffold(
      body: (profile == null)
          ? const Center(child: Text('Data not found'))
          : Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.indigo],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome ${profile.name}',
                    style: const TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Your details are',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                  ListTile(
                    leading: _leadingBuilder(Icons.person),
                    title: Text(
                      profile.name,
                      style: const TextStyle(color: Colors.white70, fontSize: 20),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  ListTile(
                    leading: _leadingBuilder(Icons.phone),
                    title: (profile.phone == '')
                        ? null
                        : Text(
                            '+995 ${profile.phone}',
                            style: const TextStyle(
                                color: Colors.white70, fontSize: 20),
                          ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  ListTile(
                    leading: _leadingBuilder(Icons.location_on),
                    title: Text(
                      profile.location,
                      style: const TextStyle(color: Colors.white70, fontSize: 20),
                    ),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(
                        context,
                        ModalRoute.withName('/'),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 50),
                      elevation: 2,

                      backgroundColor: Colors.indigo.withOpacity(0.1),
                      //foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        // side: const BorderSide(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    child: const Text(
                      'Sign out',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _leadingBuilder(IconData i) => Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.2),
        ),
        child: Icon(
          i,
          color: Colors.white,
        ),
      );
}
