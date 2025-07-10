import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/button.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';
import 'package:kolepto/screens/shared_utils/primary_colour.dart';
import 'package:kolepto/screens/signin/signin_screen.dart';
import 'package:kolepto/screens/signup/signup_screen.dart';

class ForgotpasswordScreen extends StatefulWidget {
  const ForgotpasswordScreen({super.key});

  @override
  State<ForgotpasswordScreen> createState() => _ForgotpasswordScreenState();
}

class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool passwordobscure = false;
  bool bordercolor_email = false;
  bool bordercolor_password = false;
  bool isHovering = false;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  children: [
                    Image.asset(
                      'kolepto'.toPNG(),
                      width: 150,
                    ),
                    const Spacer(),
                    HoveringContainer(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SigninScreen();
                            },
                          ),
                        );
                      },
                      width: 100,
                      height: 40,
                      text: 'Login',
                      icon: Icons
                          .login, // Changed to a more explicit enter/sign-in icon
                      entry_color: Colors.orangeAccent,
                      exit_color: Colors.transparent,
                    ),
                    10.hSpace,
                    HoveringContainer(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignupScreen();
                            },
                          ),
                        );
                      },
                      width: 100,
                      height: 40,
                      text: 'Sign Up',
                      icon: Icons
                          .app_registration, // Changed to a more explicit enter/sign-in icon
                      entry_color: Colors.green[700],
                      exit_color: Colors.green[900],
                      textColor: Colors.white,
                      iconColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 1.5,
                color: Colors.grey[200]!,
                height: 40,
                indent: 40,
                endIndent: 40,
              ),
              20.vSpace,
              const Text(
                'Reset Your Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              5.vSpace,
              const Text(
                'Enter your email to receive a password reset link \nand follow the instructions to reset your password.',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              20.vSpace,
              Container(
                width: mediaQuery.size.width * 0.4,
                height: 280,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[350]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.vSpace,
                        const Text(
                          'Email',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        5.vSpace,
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => bordercolor_email = true),
                          onExit: (_) =>
                              setState(() => bordercolor_email = false),
                          child: InputField(
                            textEditingController: _email,
                            hint: 'name@example.com',
                            bordercolor: bordercolor_email
                                ? Colors.green
                                : Colors.transparent,
                          ),
                        ),
                        5.vSpace,
                        40.vSpace,
                        MouseRegion(
                          onEnter: (_) => setState(() => isHovering = true),
                          onExit: (_) => setState(() => isHovering = false),
                          child: Button(
                            buttonName: 'Send Reset Link',
                            buttonColor: isHovering
                                ? Colors.green
                                : KoleptoColor.primaryColor,
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const SigninScreen()),
                              );
                            },
                          ),
                        ),
                        10.vSpace,
                        Center(
                          child: Text.rich(
                            TextSpan(
                              text: 'Remember Password? ',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Back to Login',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return const SigninScreen();
                                          },
                                        ),
                                      );
                                    },
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              30.vSpace,
              const Text(
                '© 2025 Kolekto. All rights reserved.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              30.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}
