import 'package:flutter/material.dart';
import 'package:chatter_box_flutter/components/my_button.dart';
import 'package:chatter_box_flutter/components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and pw text controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();

  RegisterPage({super.key});

  // register method
  void register(){}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            SizedBox(height: 50,),

            // welcome back to message
            Text(
              'Let\'s create an account for you',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25,),

            // email text field
            MyTextfield(
              hintText: 'Email',
              obscureText: false,
              controller: _emailController,
            ),
            SizedBox(height: 10,),

            // password text field
            MyTextfield(
              hintText: 'Password',
              obscureText: true,
              controller: _passwordController,
            ),
            SizedBox(height: 10,),

            // confirm password text field
            MyTextfield(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: _confirmPwController,
            ),
            SizedBox(height: 25,),

            // login button
            MyButton(
              text: 'Register',
              onTap: register,
            ),
            SizedBox(height: 25,),

            // register button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Text(
                  'Login now',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
