import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/shared_utils/input_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _name = TextEditingController();

  final TextEditingController _email = TextEditingController();

  final TextEditingController _phoneNumber = TextEditingController();
  // Add this controller
  bool borderColorName = false;

  bool borderColorEmail = false;

  bool borderColorphoneNumber = false;

  bool isHovering = false;

  bool toggleContainer = false;

  void toggleCounter() {
    setState(() {
      toggleContainer = !toggleContainer;
    });
  }

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.green[900],
          ),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
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
                                  setState(() => borderColorName = true),
                              onExit: (_) =>
                                  setState(() => borderColorName = false),
                              child: InputField(
                                readOnly: toggleContainer ? false : true,
                                textEditingController: _name,
                                hint: toggleContainer
                                    ? _name.text.toString()
                                    : 'David Robinson',
                                hintsize: 14,
                                bordercolor: borderColorName
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
                                  setState(() => borderColorEmail = true),
                              onExit: (_) =>
                                  setState(() => borderColorEmail = false),
                              child: InputField(
                                readOnly: toggleContainer ? false : true,
                                textEditingController: _email,
                                hintsize: 14,
                                hint: toggleContainer
                                    ? _email.text.toString()
                                    : 'davidrob@example.com',
                                bordercolor: borderColorEmail
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
                                  setState(() => borderColorphoneNumber = true),
                              onExit: (_) => setState(
                                  () => borderColorphoneNumber = false),
                              child: InputField(
                                readOnly: toggleContainer ? false : true,
                                textEditingController: _phoneNumber,
                                hintsize: 14,
                                hint: toggleContainer
                                    ? _phoneNumber.text.toString()
                                    : 'e.g. +234 123 4567',
                                bordercolor: borderColorphoneNumber
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
                                  text: toggleContainer
                                      ? 'Save Changes'
                                      : 'Edit Profile',
                                  icon: toggleContainer
                                      ? Icons.done
                                      : Icons
                                          .create, // Changed to a more explicit sign-up icon
                                  entry_color: Colors.green[700],
                                  exit_color: Colors.green[900],
                                  textColor: Colors.white,
                                  iconColor: Colors.white,
                                  onTap: () {
                                    toggleCounter();
                                  }, // No act
                                ),
                                20.hSpace,
                                Visibility(
                                  visible: toggleContainer,
                                  child: HoveringContainer(
                                    onTap: () {
                                      toggleCounter();
                                    },
                                    width: 200,
                                    height: 40,
                                    text: 'Cancel',
                                    icon: Icons
                                        .cancel_outlined, // Changed to a more explicit enter/sign-in icon
                                    entry_color: Colors.orangeAccent,
                                    exit_color: Colors.transparent,
                                  ),
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
