import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kolepto/screens/home/home_screen.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';
import 'package:kolepto/screens/shared_utils/primary_colour.dart';
import 'package:kolepto/screens/signin/signin_screen.dart';
import '../shared_utils/button.dart';

class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({super.key});

  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  final TextEditingController oldPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  bool oldPasswordobscure = false;
  bool newPasswordobscure = false;
  bool confirmPasswordobscure = false;
  bool borderColorOldPassword = false;
  bool borderColorNewPassword = false;
  bool borderColorConfirmPassword = false;
  bool isHovering = false;

  // Show SnackBar and handle navigation in sequence
  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            content: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white),
                SizedBox(width: 8),
                Expanded(child: Text('Profile updated successfully')),
              ],
            ),
            backgroundColor: Colors.green[800],
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            duration: Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Back to Login',
              textColor: Colors.black54,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SigninScreen()),
                );
              },
            ),
          ),
        )
        .closed
        .then((_) {
      if (mounted)
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SigninScreen()),
        );
    });
  }

  @override
  void dispose() {
    oldPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
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
                    HoveringContainer(
                      onTap: () {
                        Navigator.of(context).pop;
                      },
                      width: 100,
                      height: 40,
                      text: 'Back',
                      icon: Icons
                          .arrow_back_ios, // Changed to a more explicit enter/sign-in icon
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ),
                        );
                      }, // No act
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
                'Change Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
              5.vSpace,
              const Text(
                'Ensure to fill all fields correctly',
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
                          'Old Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        5.vSpace,
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => borderColorOldPassword = true),
                          onExit: (_) =>
                              setState(() => borderColorOldPassword = false),
                          child: InputField(
                            textEditingController: oldPassword,
                            hint: '********',
                            bordercolor: borderColorOldPassword
                                ? Colors.green
                                : Colors.transparent,
                            obscure: oldPasswordobscure,
                            suffixWidget: GestureDetector(
                              child: oldPasswordobscure == true
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
                                  oldPasswordobscure = !oldPasswordobscure;
                                },
                              ),
                            ),
                          ),
                        ),
                        20.vSpace,
                        const Text(
                          'New Passsword',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        5.vSpace,
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => borderColorNewPassword = true),
                          onExit: (_) =>
                              setState(() => borderColorNewPassword = false),
                          child: InputField(
                            textEditingController: newPassword,
                            hint: '********',
                            bordercolor: borderColorNewPassword
                                ? Colors.green
                                : Colors.transparent,
                            obscure: newPasswordobscure,
                            suffixWidget: GestureDetector(
                              child: newPasswordobscure == true
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
                                  newPasswordobscure = !newPasswordobscure;
                                },
                              ),
                            ),
                          ),
                        ),
                        20.vSpace,
                        const Text(
                          'Confirm Password',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        5.vSpace,
                        MouseRegion(
                          onEnter: (_) =>
                              setState(() => borderColorConfirmPassword = true),
                          onExit: (_) => setState(
                              () => borderColorConfirmPassword = false),
                          child: InputField(
                            textEditingController: confirmPassword,
                            hint: '********',
                            bordercolor: borderColorConfirmPassword
                                ? Colors.green
                                : Colors.transparent,
                            obscure: confirmPasswordobscure,
                            suffixWidget: GestureDetector(
                              child: confirmPasswordobscure == true
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
                                  confirmPasswordobscure =
                                      !confirmPasswordobscure;
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
                            buttonName: 'Change Password',
                            buttonColor: isHovering
                                ? Colors.green
                                : KoleptoColor.primaryColor,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Alert!'),
                                  content: Text('Do you wish to proceed?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          _showSuccessSnackbar();
                                        },
                                        child: Text('OK')),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        10.vSpace,
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Text.rich(
                              TextSpan(
                                text: '',
                                children: [
                                  TextSpan(
                                    text: 'Back to Dashboard',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.of(context).pop();
                                      },
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
