import 'package:flutter/material.dart';
import 'package:the_food_hub_nsk_nig/core/constants/app_colors.dart';
import 'package:the_food_hub_nsk_nig/core/widgets/text_widget.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/auth_option_label.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/oauth_button.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/signup_signin_opotion_text.dart';
import 'package:the_food_hub_nsk_nig/features/auth/presentation/widgets/home/text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormFieldState> key_2 = GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> key_3 = GlobalKey<FormFieldState>();
  bool obscureText = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: "Login",
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            InputFieldWidget(
                label: "E-mail",
                hintText: "eg: example@gmail.com",
                onChanged: (val) {},
                textFieldkey: key_2),
            InputFieldWidget(
                obscureText: obscureText,
                label: "Password",
                hintText: "Password",
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  child: Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                  ),
                ),
                onChanged: (val) {},
                textFieldkey: key_3),
            AuthButton(
              label: "SIGN UP",
              onTap: () {},
            ),
            SignInSignUpOptionText(
                labelColor: Colors.black,
                altColor: AppColors.orange,
                label: "Don't have an account?",
                alternative: "Sign Up",
                onAlternative: () {
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 20,
            ),
            const AuthOptionLabel(
              line: "assets/images/line_grey.png",
              color: Colors.black,
              label: "Login with",
            ),
            const SizedBox(
              height: 20,
            ),
            OAuthButton(
              image: "google",
              label: "Google",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
