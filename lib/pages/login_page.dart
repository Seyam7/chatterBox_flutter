import 'package:chatter_box_flutter/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                'Welcome back, you\'ve missed!',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 25,),

            // email text field
            MyTextfield(
              hintText: 'Email',
            ),
            SizedBox(height: 10,),

            // password text field
            MyTextfield(
              hintText: 'Password',
            ),

            // login button

            // register button
          ],
        ),
      ),
    );
  }
}
