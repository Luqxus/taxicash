import 'package:equatable/equatable.dart';
import 'package:taxicash/types/authentication.dart';

class AuthenticationState extends Equatable {
  @override
  List<Object?> get props => [];
}

class Authenticated extends AuthenticationState {
  final AccountType accountType;

  Authenticated(this.accountType);

  @override
  List<Object?> get props => [accountType];
}

class AuthenticatedMissingType extends AuthenticationState {}

class Unauthenticated extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure(this.message);

  @override
  List<Object?> get props => [message];
}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}
