import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/config/router/routes.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_option_label.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/oauth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/registration/sign_in_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/signup_signin_opotion_text.dart';

class SignInOptions extends StatelessWidget {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AuthOptionLabel(),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            OAuthButton(
              onTap: () {},
              image: "google",
              label: "Google",
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        SignInButton(
          onTap: () {
            Navigator.pushNamed(context, Routes.registration);
          },
        ),
        SignInSignUpOptionText(
          label: "Already have an account?",
          alternative: "Login",
          onAlternative: () {
            Navigator.pushNamed(context, Routes.login);
          },
        )
      ],
    );
  }
}
