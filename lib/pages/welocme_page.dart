import 'package:flutter/material.dart';
import 'package:task_app/pages/home_pages.dart';
import 'package:task_app/util/button.dart';

import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.height;
    return Scaffold(
      //Background fullscreen image
      body: Container(
        height: deviceHeight,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Taskly',
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    "Create your daily task and get reward",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 50,
                  ),

                  //get started button

                  GestureDetector(
                    child: const Button(
                      buttonName: 'Get started',
                      buttonColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
