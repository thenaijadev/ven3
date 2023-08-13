// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthRepository repo) : super(AuthInitial()) {
    on<AuthEventRegister>((event, emit) async {
      final String email = event.email;
      final String fullName = event.fullName;
      final String password = event.password;
      emit(AuthStateIsRegistering());
      final user = await repo.signUpWithEmailAndPassword(
          email: email, password: password, fullName: fullName);
      user.fold((l) {
        emit(AuthStateRegistrationError());
      }, (r) {
        emit(AuthStateUserRegistered(user: r!));
      });
    });

    on<AuthEventRegisterWithGoogle>((event, emit) async {
      // final supabase = Supabase.instance.client;
      emit(AuthStateIsRegisteringwithGoogle());
      final user = await repo.signUpWithGoogle();
      user.fold((l) {
        emit(AuthStateRegistrationError());
      }, (r) {
        emit(AuthStateUserRegistered(user: r!));
      });
    });
  }
}
