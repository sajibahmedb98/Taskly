import 'package:flutter/material.dart';
import 'package:task_app/pages/login_page.dart';
import 'package:task_app/util/button.dart';
import 'package:task_app/util/user_textfield.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //create new account text
                  Column(
                    children: [
                      const Text(
                        'Create new account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Please fill in the form to continue',
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),

                  //user information text field
                  Column(
                    children: const [
                      UserTextfiled(hintText: 'Full Name'),
                      SizedBox(
                        height: 15,
                      ),
                      UserTextfiled(hintText: 'Email Address'),
                      SizedBox(
                        height: 15,
                      ),
                      UserTextfiled(hintText: 'Phone Number'),
                      SizedBox(
                        height: 15,
                      ),
                      UserTextfiled(hintText: 'Password'),
                    ],
                  ),

                  //sign up button
                  GestureDetector(
                    child: const Button(
                        buttonName: 'Sign Up',
                        buttonColor: Colors.blue,
                        textColor: Colors.white),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    ),
                  ),

                  //have an account?sign in
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have an Acoount?',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      GestureDetector(
                        child: const Text(
                          ' Sign In',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPage())),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
