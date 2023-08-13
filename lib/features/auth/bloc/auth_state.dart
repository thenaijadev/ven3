part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthStateIsRegistering extends AuthState {}

class AuthStateIsRegisteringwithGoogle extends AuthState {}

class AuthStateUserRegistered extends AuthState {
  AuthStateUserRegistered({required this.user});
  final User user;
}

class AuthStateSignedUpWithGoogle extends AuthState {}

class AuthStateRegistrationError extends AuthState {}

class AuthStateIsloggingIn extends AuthState {}

class AuthStateisLoggedIn extends AuthState {}

class AuthStateLogInError extends AuthState {}
