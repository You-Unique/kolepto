import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kolepto/screens/google/google_sign_in_button.dart';
import 'package:kolepto/screens/shared_utils/button.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';
import 'package:kolepto/screens/shared_utils/primary_colour.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
                    // Enter button starts here
                    const HoveringContainer(
                      width: 100,
                      height: 40,
                      text: 'Sign Up',
                      icon: Icons
                          .app_registration, // Changed to a more explicit enter/sign-in icon
                      entry_color: Colors.orangeAccent,
                      exit_color: Colors.transparent,
                    ),
                    10.hSpace,
                    HoveringContainer(
                      width: 100,
                      height: 40,
                      text: 'Home',
                      icon:
                          Icons.home, // Changed to a more explicit sign-up icon
                      entry_color: Colors.green[700],
                      exit_color: Colors.green[900],
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
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
                'Welcome back',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              5.vSpace,
              const Text(
                'Sign in to your account to continue',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              20.vSpace,
              Container(
                width: mediaQuery.size.width * 0.4,
                height: 500,
                // No height specified, so it will size to fit its child
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
                        20.vSpace,
                        const Text(
                          'Passsword',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => bordercolor_password = true),
                          onExit: (_) =>
                              setState(() => bordercolor_password = false),
                          child: InputField(
                            textEditingController: _password,
                            hint: '********',
                            bordercolor: bordercolor_password
                                ? Colors.green
                                : Colors.transparent,
                            obscure: passwordobscure,
                            suffixWidget: GestureDetector(
                              child: passwordobscure == true
                                  ? const Icon(
                                      Icons.visibility_off,
                                      size: 14,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      size: 14,
                                    ),
                              onTap: () => setState(
                                () {
                                  passwordobscure = !passwordobscure;
                                },
                              ),
                            ),
                          ),
                        ),
                        40.vSpace,
                        MouseRegion(
                          onEnter: (_) => setState(() => isHovering = true),
                          onExit: (_) => setState(() => isHovering = false),
                          child: Button(
                            buttonName: 'Sign In',
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
                              text: 'Don\'t have an account? ',
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                              children: [
                                TextSpan(
                                  text: ' Sign Up',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.of(context).pop();
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
                        10.vSpace,
                        Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: Colors.grey[200],
                                height: 40,
                                endIndent: 10,
                              ),
                            ),
                            Text(
                              'or',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: Colors.grey[200],
                                height: 40,
                                indent: 10,
                              ),
                            ),
                          ],
                        ),
                        10.vSpace,
                        GoogleSignInButton(
                          onTap: () {
                            // Handle Google Sign In
                          },
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
