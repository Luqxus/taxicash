import 'package:flutter/material.dart';
import 'package:taxicash/screen/widgets/signin_button.dart';
import 'package:taxicash/screen/widgets/textform_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  // email text form field controller
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // device screen size
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // email text field
            CustomTextFormField(
              controller: _emailController,
              hintText: "Email",
              obscureText: false,
            ),

            // spacing
            const SizedBox(
              height: 20.0,
            ),

            // login button
            SignInButton(
              email: _emailController.text,
            ),
          ],
        ),
      ),
    );
  }
}
