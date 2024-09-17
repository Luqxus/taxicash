import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxicash/bloc/auth/bloc.dart';
import 'package:taxicash/bloc/auth/event.dart';
import 'package:taxicash/bloc/signin/event.dart';
import 'package:taxicash/bloc/signin/state.dart';
import 'package:taxicash/repository/authentication_repository.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final AuthenticationBloc _authenticationBloc;
  final AuthenticationRepository _authenticationRepository;
  SignInBloc(this._authenticationBloc, this._authenticationRepository)
      : super(SignInInitial()) {
    on<SignInButtonPressed>(_signin);
  }

  // sign in button pressed event handler
  _signin(SignInButtonPressed event, Emitter emit) async {
    emit(SignInLoading());

    try {
      // run auth respository login function
      await _authenticationRepository.login(email: event.email);

      /// trigger [LoggedIn] event in [AuthenticationBloc]
      _authenticationBloc.add(LoggedIn());
    } catch (e) {
      /// trigger [SignInFailure] on exception
      emit(SignInFailure(e.toString()));
    }
  }
}
