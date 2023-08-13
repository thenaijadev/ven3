import 'package:the_food_hub_nsk_nig/core/network/typedef.dart';
import 'package:the_food_hub_nsk_nig/features/auth/data/interfaces/auth_provider.dart';

class AuthRepository {
  AuthRepository({required this.provider});

  final AuthProvider provider;
  EitherUser signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String fullName}) async {
    return provider.signUpWithEmail(
        fullName: fullName, email: email, password: password);
  }

  EitherAuthResponse signUpWithGoogle() {
    return provider.signUpWithGoogle();
  }
}
