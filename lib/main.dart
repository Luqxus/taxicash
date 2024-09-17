import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxicash/app_wrapper.dart';
import 'package:taxicash/bloc/auth/bloc.dart';
import 'package:taxicash/bloc/auth/event.dart';
import 'package:taxicash/repository/web3auth_repository.dart';

void main() {
  runApp(const TaxiCash());
}

class TaxiCash extends StatelessWidget {
  const TaxiCash({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                AuthenticationBloc(Web3AuthenticationRepository())
                  ..add(AppStarted()),
          ),
        ],
        child: const AppWrapper(),
      ),
    );
  }
}
