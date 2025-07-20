import 'package:flutter/material.dart';
import 'package:kolepto/provider/navigation_state.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool obscure = false;

  void toggleobscure() {
    setState(() {
      obscure = !obscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
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
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.vSpace,
              Row(
                children: [
                  const Text(
                    'Dashboard View',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  HoveringContainer(
                    exit_color: Colors.green[900],
                    entry_color: Colors.green[700],
                    width: 150,
                    height: 40,
                    text: 'New Collection',
                    textColor: Colors.white,
                    icon: Icons.add,
                    iconColor: Colors.white,
                    onTap: () {
                      final navState =
                          Provider.of<NavigationState>(context, listen: false);
                      navState.setIndex(2);
                    },
                  ),
                ],
              ),
              40.vSpace,
              Row(
                children: [
                  Container(
                    width: 180,
                    height: 130,
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
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Total Collections',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              Icon(
                                Icons.trending_up,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ],
                          ),
                          10.vSpace,
                          const Text(
                            '0',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.hSpace,
                  Container(
                    width: 180,
                    height: 130,
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Active \nCollections',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: toggleobscure,
                                child: obscure
                                    ? Icon(
                                        Icons.visibility_outlined,
                                        color: Colors.grey,
                                        size: 18,
                                      )
                                    : Icon(
                                        Icons.visibility_off_outlined,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                              ),
                            ],
                          ),
                          10.vSpace,
                          obscure
                              ? Text(
                                  '0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                  ),
                                )
                              : Text(
                                  '****',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              20.vSpace,
              Container(
                width: 380,
                height: 130,
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Recent Collections',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.receipt_long,
                            color: Colors.grey,
                            size: 24,
                          ),
                        ],
                      ),
                      30.vSpace,
                      const Text(
                        'No collections yet',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
