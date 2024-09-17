import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxicash/bloc/auth/bloc.dart';
import 'package:taxicash/bloc/auth/state.dart';
import 'package:taxicash/screen/error_screen.dart';
import 'package:taxicash/screen/home_screen.dart';
import 'package:taxicash/screen/loading_screen.dart';
import 'package:taxicash/screen/set_account_type_screen.dart';
import 'package:taxicash/screen/signin_screen.dart';

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated) {
        return HomeScreen();
      } else if (state is AuthenticatedMissingType) {
        return const SetAccountTypeScreen();
      } else if (state is Unauthenticated) {
        return SignInScreen();
      } else if (state is AuthenticationFailure) {
        return const ErrorScreen();
      }

      return const LoadingScreen();
    });
  }
}
