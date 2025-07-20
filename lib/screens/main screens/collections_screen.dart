import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/hovering_container.dart';
import 'package:provider/provider.dart';

import '../../provider/navigation_state.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({super.key});

  @override
  State<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends State<CollectionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Collections',
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
                    'Collections',
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
              30.vSpace,
              Container(
                width: 800,
                height: 200,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'You don\'t have any collections yet',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      20.vSpace,
                      HoveringContainer(
                        exit_color: Colors.green[900],
                        entry_color: Colors.green[700],
                        width: 220,
                        height: 40,
                        text: 'Create A New Collection',
                        textColor: Colors.white,
                        icon: Icons.add_box,
                        iconColor: Colors.white,
                        onTap: () {
                          final navState = Provider.of<NavigationState>(context,
                              listen: false);
                          navState.setIndex(2);
                        },
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
