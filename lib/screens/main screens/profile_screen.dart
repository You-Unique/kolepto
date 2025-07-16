import 'package:flutter/material.dart';
import 'package:kolepto/screens/home/home_screen.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';
import 'package:kolepto/screens/signup/signup_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool createCollectionText = false;

  bool previewCollectionText = false;

  bool createContainer = false;

  final TextEditingController _title = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _amount = TextEditingController();

  final TextEditingController _deadline = TextEditingController();
  // Add this controller
  bool passwordobscure = false;

  bool confirmpasswordobscure = false;

  bool borderColorTitle = false;

  bool borderColorDescription = false;

  bool borderColorAmount = false;

  bool borderColorDeadline = false;

  bool isHovering = false;

  bool toggleContainer = false;

  void toggleCounter() {
    setState(() {
      toggleContainer = !toggleContainer;
    });
  }

  @override
  void dispose() {
    _title.dispose();
    _description.dispose();
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vSpace,
              Row(
                children: [
                  CircleAvatar(
                    radius: 80,
                    child: Text(
                      'JD',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    // backgroundImage:
                    //     AssetImage('assets/images/profile_placeholder.png'),
                  ),
                  50.hSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'davidrob@example.com',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      10.vSpace,
                      const Text(
                        'joined',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      10.vSpace,
                      const Text(
                        '1 year ago',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'David',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      'Robinson',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    30.vSpace,
                    Container(
                      width: 800,
                      height: 420,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey[300]!,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Bio Details',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            10.vSpace,
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
                                  setState(() => borderColorTitle = true),
                              onExit: (_) =>
                                  setState(() => borderColorTitle = false),
                              child: InputField(
                                textEditingController: _title,
                                hint: 'David Robinson',
                                bordercolor: borderColorTitle
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
                                  setState(() => borderColorDescription = true),
                              onExit: (_) => setState(
                                  () => borderColorDescription = false),
                              child: InputField(
                                textEditingController: _description,
                                hint: 'davidrob@example.com',
                                bordercolor: borderColorDescription
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
                                  setState(() => borderColorDeadline = true),
                              onExit: (_) =>
                                  setState(() => borderColorDeadline = false),
                              child: InputField(
                                textEditingController: _deadline,
                                hint: 'e.g. +234 123 4567',
                                bordercolor: borderColorDeadline
                                    ? Colors.green
                                    : Colors.transparent,
                              ),
                            ),
                            40.vSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                HoveringContainer(
                                  width: 200,
                                  height: 40,
                                  text: 'Edit Profile',
                                  icon: Icons
                                      .create, // Changed to a more explicit sign-up icon
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
                                20.hSpace,
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
                                  width: 200,
                                  height: 40,
                                  text: 'Cancel',
                                  icon: Icons
                                      .cancel_outlined, // Changed to a more explicit enter/sign-in icon
                                  entry_color: Colors.orangeAccent,
                                  exit_color: Colors.transparent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
