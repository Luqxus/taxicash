import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taxicash/bloc/auth/event.dart';
import 'package:taxicash/bloc/auth/state.dart';
import 'package:taxicash/repository/authentication_repository.dart';
import 'package:taxicash/types/authentication.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationBloc(this._authenticationRepository)
      : super(AuthenticationInitial()) {
    on<AppStarted>(_appStarted);
    on<LoggedIn>(_loggedIn);
    on<LoggedOut>(_loggedOut);
    on<SetAccountType>(_setAccountType);
  }

  /// handle [AppStarted] event
  _appStarted(AppStarted event, Emitter emit) async {
    await _checkIfFirstUseAfterInstall();

    await _init(emit);
  }

  /// handle [LoggedIn] event
  _loggedIn(LoggedIn event, Emitter emit) async {
    await _init(emit);
  }

  /// handle [LoggedOut] event
  _loggedOut(LoggedOut event, Emitter emit) async {}

  /// handle [SetAccountType] event
  _setAccountType(SetAccountType event, Emitter emit) async {}

  /// check if app is authenticated or unauthenticated
  _init(Emitter emit) async {
    (await _authenticationRepository.hasPrivKey())
        ? emit(Authenticated(AccountType.taxiDriver))
        : emit(Unauthenticated());
  }

  /// check if first app usage after installation
  _checkIfFirstUseAfterInstall() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      _authenticationRepository.clearSecureStorage();

      prefs.setBool('first_run', false);
    }
  }
}
