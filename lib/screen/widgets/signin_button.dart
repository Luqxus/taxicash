import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxicash/bloc/signin/bloc.dart';
import 'package:taxicash/bloc/signin/event.dart';
import 'package:taxicash/utils/colors.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: BorderSide.none,
              ),
            ),
            onPressed: () {
              /// trigger [SignInButtonPressed] event
              BlocProvider.of<SignInBloc>(context)
                  .add(SignInButtonPressed(email));
            },
            child: const Text("Sign In"),
          ),
        ),
      ],
    );
  }
}
