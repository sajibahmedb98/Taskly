import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:task_app/pages/create_account_page.dart';
import 'package:task_app/util/button.dart';
import 'package:task_app/util/user_textfield.dart';

import 'completed_task_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //welcome back text
              const Center(
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                  'Please log in to your account',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),

              //gmail text field
              const UserTextfiled(hintText: 'Email'),

              const SizedBox(
                height: 15,
              ),
              const UserTextfiled(hintText: 'Password'),

              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 200),
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 140,
              ),
              GestureDetector(
                child: const Button(
                  buttonName: 'Sign In',
                  buttonColor: Colors.blue,
                  textColor: Colors.white,
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CompletedTask(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Button(
                buttonName: ' Sign in with google',
                buttonColor: Colors.white,
                textColor: Colors.black,
                iconText: Icon(
                  EvaIcons.google,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dont have an Account?',
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    child: const Text(
                      ' Sign Up',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                    ),
                  ),
                ],
              )

              //password text filed
            ],
          ),
        ),
      ),
    );
  }
}
