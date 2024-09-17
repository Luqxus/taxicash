import 'package:equatable/equatable.dart';
import 'package:taxicash/types/authentication.dart';

class AuthenticationEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {}

class LoggedOut extends AuthenticationEvent {}

class SetAccountType extends AuthenticationEvent {
  final AccountType accountType;

  SetAccountType(this.accountType);

  @override
  List<Object?> get props => [accountType];
}
