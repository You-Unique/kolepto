import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:kolepto/screens/signin/signin_screen.dart';
import 'package:kolepto/screens/signup/signup_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHovering = false;
  // This variable is used to track whether the button is being hovered over.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      text: 'Sign Up',
                      icon: Icons
                          .app_registration, // Changed to a more explicit sign-up icon
                      entry_color: Colors.green[700],
                      exit_color: Colors.green[900],
                      textColor: Colors.white,
                      iconColor: Colors.white,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const SignupScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              20.vSpace,
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Collect Group Payments with Ease',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      20.vSpace,
                      const Text(
                        'Kolekto is a smart, modern platform that allows organizers to collect \ngroup payments while capturing participant details in a single flow.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.white70,
                        ),
                      ),
                      40.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HoveringContainer(
                            width: 150,
                            height: 50,
                            text: 'Get Started',
                            icon: Icons
                                .arrow_forward, // Changed to a more explicit get-started icon
                            entry_color: Colors.orangeAccent,
                            exit_color: Colors.orange,
                            textColor: Colors.green[900],
                            iconColor: Colors.green[900],
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignupScreen();
                                  },
                                ),
                              );
                            },
                          ),
                          20.hSpace,
                          HoveringContainer(
                            width: 150,
                            height: 50,
                            text: 'Learn More',
                            icon: Icons
                                .info, // Changed to a more explicit learn-more icon
                            entry_color: Colors.green[700],
                            exit_color: Colors.white70,
                            textColor: Colors.orange,
                            iconColor: Colors.orange,
                            onTap: () {
                              // Add your learn more logic here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              60.vSpace,
              const Text(
                'Why Kolepto?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              10.vSpace,
              const Text(
                'Kolekto is designed to simplify group payments and participant management. \nHere’s how it works:',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                ),
              ),
              40.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...List.generate(
                    3,
                    (index) => TaskContainer(
                      width: 300,
                      height: 200,
                      textAlign: TextAlign.center,
                      title: index == 0
                          ? '1. Create Event'
                          : index == 1
                              ? '2. Share Link'
                              : '3. Collect Payments',
                      description: index == 0
                          ? 'Set up your event details and payment options.'
                          : index == 1
                              ? 'Share the event link with participants'
                              : 'Collect payments securely and \ntrack participant details',
                      icon: index == 0
                          ? Icons.event
                          : index == 1
                              ? Icons.share
                              : Icons.payment,
                    ),
                  ),
                ],
              ),
              60.vSpace,
              Container(
                height: 600,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Perfect For',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      30.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(
                            3,
                            (index) => TaskContainer(
                              width: 300,
                              height: 200,
                              // textAlign: TextAlign.start,
                              title: index == 0
                                  ? 'Students'
                                  : index == 1
                                      ? 'Community Groups'
                                      : 'Transport Organizers',
                              description: index == 0
                                  ? 'Class dues, project contributions, or event fees with detailed participant tracking.'
                                  : index == 1
                                      ? 'Organize contributions for community initiatives with transparent record-keeping.'
                                      : 'Manage passenger payments and details for group transportation services.',
                              icon: index == 0
                                  ? Icons.school
                                  : index == 1
                                      ? Icons.payment
                                      : Icons.event,
                            ),
                          ),
                        ],
                      ),
                      30.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ...List.generate(
                            3,
                            (index) => TaskContainer(
                              width: 300,
                              height: 200,
                              // textAlign: TextAlign.start,
                              title: index == 0
                                  ? 'Church Contributions'
                                  : index == 1
                                      ? 'Project Organizers'
                                      : 'Crowdfunding',
                              description: index == 0
                                  ? 'Effective for collecting church contributions and managing member details.'
                                  : index == 1
                                      ? 'To get project funding, organize contributions for great ideas/initiatives with transparent record-keeping.'
                                      : 'For crowdfunding campaigns, manage contributions and participant details seamlessly.',
                              icon: index == 0
                                  ? Icons.church_outlined
                                  : index == 1
                                      ? Icons.work_outline // Project icon
                                      : Icons
                                          .volunteer_activism, // Crowdfunding icon
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              40.vSpace,
              const Text('Frequently Asked Questions',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
              const Text(
                'Kolekto is a smart, modern platform that allows organizers to collect group payments while capturing participant details in a single flow.',
              ),
              20.vSpace,
              FAQ(
                title: 'What is Kolekto?',
                description:
                    'Kolekto is a smart group payment platform that helps organizers collect payments from multiple people easily. Whether you\'re a class rep collecting for handouts or a friend organizing group transport, Kolekto simplifies the process.',
              ),
              20.vSpace,
              FAQ(
                title: 'Do I need to create an account to pay?',
                description:
                    'No! Contributors don\'t need to create an account. You can simply use the payment link or scan a QR code to make your payment—fast, secure, and stress-free.',
              ),
              20.vSpace,
              FAQ(
                title: 'Can I pay for more than one person?',
                description:
                    'Yes. Kolekto allows you to pay for multiple people in one transaction. You\'ll be asked to fill in each person\'s details like name, matric number, or location depending on the organizer\'s requirements.',
              ),
              20.vSpace,
              FAQ(
                title: 'What payment methods are supported?',
                description:
                    'We support multiple secure options including Opay, Flutterwave, card payments, and bank transfers. More mobile wallets and local options will be added soon.',
              ),
              20.vSpace,
              FAQ(
                title: 'How do I know my payment was successful?',
                description:
                    'Once your payment is completed, you\'ll receive a confirmation message or email (if provided). The organizer also gets your details in real-time.',
              ),
              20.vSpace,
              FAQ(
                title: 'How much does Kolekto charge?',
                description:
                    'We only take a small service fee per transaction to maintain the platform. There are no hidden charges.',
              ),
              20.vSpace,
              FAQ(
                title: 'Is Kolekto only for students?',
                description:
                    'No. While students are a major use case, anyone can use Kolekto—church groups, office teams, event organizers, and more.',
              ),
              20.vSpace,
              FAQ(
                title: 'Is my information safe?',
                description:
                    'Absolutely. We prioritize security and privacy, following best practices to keep your data and payments secure at all times.',
              ),
              40.vSpace,
              Container(
                height: 360,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[900],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Ready to Start Collecting?',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      20.vSpace,
                      const Text(
                        'Join thousands of organizers across Africa who use Kolekto to simplify \ngroup payments.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white70,
                        ),
                      ),
                      40.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          HoveringContainer(
                            width: 150,
                            height: 50,
                            text: 'Create Account',
                            icon: Icons.person_add_alt_1, // Create account icon
                            entry_color: Colors.orangeAccent,
                            exit_color: Colors.orange,
                            textColor: Colors.green[900],
                            iconColor: Colors.green[900],
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return const SignupScreen();
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      40.vSpace,
                      const Text(
                        '& explore our features:',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                      20.vSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          HoveringContainer(
                            width: 150,
                            height: 50,
                            text: 'Create Event',
                            icon: Icons.event,
                            entry_color: Colors.blueAccent,
                            exit_color: Colors.blue[700],
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            onTap: () {
                              // Add your create event logic here
                            },
                          ),
                          HoveringContainer(
                            width: 150,
                            height: 50,
                            text: 'Share Link',
                            icon: Icons.share,
                            entry_color: Colors.purpleAccent,
                            exit_color: Colors.purple[700],
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            onTap: () {
                              // Add your share link logic here
                            },
                          ),
                          HoveringContainer(
                            width: 150,
                            height: 50,
                            text: 'Collect Payments',
                            icon: Icons.payment,
                            entry_color: Colors.greenAccent,
                            exit_color: Colors.green[700],
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            onTap: () {
                              // Add your collect payments logic here
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              20.vSpace,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'kolepto'.toPNG(),
                          width: 150,
                        ),
                        const Text(
                          'Smart payment collection \nfor communities across Africa.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Quick Links',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.vSpace,
                        const Text(
                          'Home',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        5.vSpace,
                        const Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        5.vSpace,
                        const Text(
                          'Contact Us',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Company',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        10.vSpace,
                        const Text(
                          'Careers',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        5.vSpace,
                        const Text(
                          'Terms of Service',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        5.vSpace,
                        const Text(
                          'Privacy Policy',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Follow Us',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.facebook),
                              onPressed: () {
                                // Add your Facebook link here
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.alternate_email),
                              onPressed: () {
                                // Add your Twitter link here
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                // Add your Instagram link here
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              40.vSpace,
              // Divider line to visually separate sections
              Divider(
                thickness: 1.5,
                color: Colors.grey[200]!,
                height: 40,
                indent: 40,
                endIndent: 40,
              ),
              20.vSpace,
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

class TaskContainer extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final TextAlign? textAlign;
  final double width;
  final double height;

  const TaskContainer({
    required this.title,
    required this.description,
    required this.icon,
    required this.width,
    required this.height,
    this.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.white12,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green[900],
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          20.vSpace,
          Text(
            title,
            textAlign: textAlign ?? TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          10.vSpace,
          Text(
            description,
            textAlign: textAlign ?? TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class FAQ extends StatefulWidget {
  final String title;
  late String? description;
  final IconData? suffixicon;
  final TextAlign? textAlign;
  // final double width;
  // final double height;

  FAQ({
    required this.title,
    this.description,
    this.suffixicon,
    // required this.width,
    // required this.height,
    this.textAlign,
    super.key,
  });

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  bool faq = false;
  bool faqline = false;

  void toggleFaq() {
    setState(() {
      faq = !faq;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: toggleFaq,
      child: MouseRegion(
        onEnter: (_) => setState(() => faqline = true),
        onExit: (_) => setState(() => faqline = false),
        child: Container(
          width: mediaQuery.size.width * 0.8,
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
                color: Colors.white12,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.vSpace,
                Row(
                  children: [
                    Text(
                      widget.title,
                      textAlign: widget.textAlign ?? TextAlign.start,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: faqline ? TextDecoration.underline : null,
                        decorationThickness: faqline ? 2 : null,
                        decorationColor: faqline ? Colors.black : null,
                      ),
                    ),
                    const Spacer(),
                    if (faq)
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.green[900],
                        size: 30,
                      )
                    else
                      Icon(
                        Icons.keyboard_arrow_up_outlined,
                        color: Colors.green[900],
                        size: 30,
                      ),
                  ],
                ),
                10.vSpace,
                if (faq)
                  Text(
                    widget.description ?? '',
                    textAlign: widget.textAlign ?? TextAlign.start,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
