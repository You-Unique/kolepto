// ignore_for_file: non_constant_identifier_names

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kolepto/screens/home/home_screen.dart';
import 'package:kolepto/screens/shared_utils/button.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';
import 'package:kolepto/screens/shared_utils/primary_colour.dart';
import 'package:kolepto/screens/signin/signin_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  bool passwordobscure = false;
  bool confirmpasswordobscure = false;
  bool bordercolor_name = false;
  bool bordercolor_email = false;
  bool bordercolor_password = false;
  bool bordercolor_confirmpassword = false;
  bool bordercolor_phonenumber = false;
  bool isHovering = false;

  @override
  void dispose() {
    _fullName.dispose();
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
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
                        width: 100,
                        height: 40,
                        text: 'Home',
                        icon: Icons
                            .home, // Changed to a more explicit sign-up icon
                        entry_color: Colors.green[700],
                        exit_color: Colors.green[900],
                        textColor: Colors.white,
                        iconColor: Colors.white,
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ),
                          );
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
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                5.vSpace,
                const Text(
                  'Start collecting payments from your group with ease',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.black54,
                  ),
                ),
                20.vSpace,
                Container(
                  width: mediaQuery.size.width * 0.4,
                  height: 630,
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
                            'Full Name',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          5.vSpace,
                          MouseRegion(
                            onEnter: (_) =>
                                setState(() => bordercolor_name = true),
                            onExit: (_) =>
                                setState(() => bordercolor_name = false),
                            child: InputField(
                              textEditingController: _fullName,
                              hint: 'John Doe',
                              bordercolor: bordercolor_name
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
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
                          20.vSpace,
                          const Text(
                            'Phone Number',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          5.vSpace,
                          MouseRegion(
                            onEnter: (_) =>
                                setState(() => bordercolor_phonenumber = true),
                            onExit: (_) =>
                                setState(() => bordercolor_phonenumber = false),
                            child: InputField(
                              textEditingController: _phoneNumber,
                              hint: '+234 123 456 7890',
                              bordercolor: bordercolor_phonenumber
                                  ? Colors.green
                                  : Colors.transparent,
                            ),
                          ),
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
                          20.vSpace,
                          const Text(
                            'Confirm Passsword',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          // 5.vSpace,
                          MouseRegion(
                            onEnter: (_) => setState(
                                () => bordercolor_confirmpassword = true),
                            onExit: (_) => setState(
                                () => bordercolor_confirmpassword = false),
                            child: InputField(
                              textEditingController: _confirmpassword,
                              hint: '********',
                              bordercolor: bordercolor_confirmpassword
                                  ? Colors.green
                                  : Colors.transparent,
                              obscure: confirmpasswordobscure,
                              suffixWidget: GestureDetector(
                                child: confirmpasswordobscure == true
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
                                    confirmpasswordobscure =
                                        !confirmpasswordobscure;
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
                              buttonName: 'Sign Up',
                              buttonColor: isHovering
                                  ? Colors.green
                                  : KoleptoColor.primaryColor,
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SigninScreen()),
                                );
                              },
                            ),
                          ),
                          10.vSpace,
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: 'Already have an account? ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Sign In',
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
      ),
    );
  }
}
