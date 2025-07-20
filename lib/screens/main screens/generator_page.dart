import 'package:flutter/material.dart';
import 'package:kolepto/provider/navigation_state.dart';
import 'package:kolepto/screens/main%20screens/collections_screen.dart';
import 'package:kolepto/screens/main%20screens/createcolections_screen.dart';
import 'package:kolepto/screens/main%20screens/dashboard._screen.dart';
import 'package:kolepto/screens/home/home_screen.dart';
import 'package:kolepto/screens/main%20screens/profile_screen.dart';
import 'package:kolepto/screens/main%20screens/settings_screen.dart';
import 'package:kolepto/screens/main%20screens/walletoverview_screen.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:provider/provider.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({
    super.key,
    required int selectedIndex,
  });

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  // int selectedIndex = 0;
  bool dashboardContainer = false;
  bool collectionsContainer = false;
  bool createcollectionContainer = false;
  bool walletContainer = false;
  bool profileContainer = false;
  bool settingsContainer = false;
  bool signOutContainer = false;

  final List<Widget> screens = [
    const DashboardScreen(),
    const CollectionsScreen(),
    const CreatecolectionsScreen(),
    const WalletoverviewScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navState = Provider.of<NavigationState>(context, listen: true);
    return Scaffold(
      body: Row(
        children: [
          SafeArea(
            child: Expanded(
              child: NavigationRail(
                unselectedIconTheme: const IconThemeData(
                  color: Colors.orange, // Color when selected
                  size: 24, // Size when selected
                  opacity: 1.0, // Opacity when selected
                ),
                extended: true,
                backgroundColor: const Color.fromRGBO(27, 94, 32, 1),
                unselectedLabelTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white,
                  // backgroundColor: Colors.grey,
                ),
                selectedLabelTextStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white70,
                ),
                indicatorColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(right: 100),
                  child: Image.asset(
                    'kolepto'.toPNG(), // or your logo/image path
                    height: 40,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 180),
                  child: Column(
                    children: [
                      MouseRegion(
                        onEnter: (_) => setState(() => signOutContainer = true),
                        onExit: (_) => setState(() => signOutContainer = false),
                        child: signOutContainer
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()),
                                  );
                                },
                                child: Container(
                                  width: 160,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey[50],
                                    borderRadius: BorderRadius.circular(
                                        20), // Your background color
                                    border: Border(
                                        right: BorderSide(
                                            color: Colors.grey[300]!)),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.logout),
                                        10.hSpace,
                                        Text(
                                          'Sign Out',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: signOutContainer
                                                ? Colors.black
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  const Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                  ),
                                  10.hSpace,
                                  const Text(
                                    'Sign Out',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ],
                  ),
                ),
                destinations: [
                  NavigationRailDestination(
                    icon: const Icon(
                      Icons.home,
                    ),
                    label: MouseRegion(
                      onEnter: (_) => setState(() => dashboardContainer = true),
                      onExit: (_) => setState(() => dashboardContainer = false),
                      child: dashboardContainer
                          ? Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(
                                    20), // Your background color
                                border: Border(
                                    right:
                                        BorderSide(color: Colors.grey[300]!)),
                              ),
                              child: Center(
                                child: Text(
                                  'Dashboard',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                    color: dashboardContainer
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                            )
                          : const Text(
                              'Dashboard',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 14,
                                // color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.collections),
                    label: MouseRegion(
                      onEnter: (_) =>
                          setState(() => collectionsContainer = true),
                      onExit: (_) =>
                          setState(() => collectionsContainer = false),
                      child: collectionsContainer
                          ? Container(
                              width: 120,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(
                                    20), // Your background color
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.grey[300]!,
                                  ),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Collections',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                    color: collectionsContainer
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                            )
                          : const Text(
                              'Collections',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 14,
                                // color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.add_circle_outline),
                    label: MouseRegion(
                      onEnter: (_) =>
                          setState(() => createcollectionContainer = true),
                      onExit: (_) =>
                          setState(() => createcollectionContainer = false),
                      child: createcollectionContainer
                          ? Container(
                              width: 160,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(
                                    20), // Your background color
                                border: Border(
                                    right:
                                        BorderSide(color: Colors.grey[300]!)),
                              ),
                              child: Center(
                                child: Text(
                                  'Create Collection',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                    color: createcollectionContainer
                                        ? Colors.black
                                        : null,
                                  ),
                                ),
                              ),
                            )
                          : const Text(
                              'Create Collection',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 14,
                                // color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.account_balance_wallet_outlined),
                    label: MouseRegion(
                      onEnter: (_) => setState(() => walletContainer = true),
                      onExit: (_) => setState(() => walletContainer = false),
                      child: walletContainer
                          ? Container(
                              width: 160,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(
                                    20), // Your background color
                                border: Border(
                                    right:
                                        BorderSide(color: Colors.grey[300]!)),
                              ),
                              child: Center(
                                child: Text(
                                  'Wallet Overview',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                    color:
                                        walletContainer ? Colors.black : null,
                                  ),
                                ),
                              ),
                            )
                          : const Text(
                              'Wallet Overview',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 14,
                                // color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.person),
                    label: MouseRegion(
                      onEnter: (_) => setState(() => profileContainer = true),
                      onExit: (_) => setState(() => profileContainer = false),
                      child: profileContainer
                          ? Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(
                                    20), // Your background color
                                border: Border(
                                    right:
                                        BorderSide(color: Colors.grey[300]!)),
                              ),
                              child: Center(
                                child: Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                    color:
                                        profileContainer ? Colors.black : null,
                                  ),
                                ),
                              ),
                            )
                          : const Text(
                              'Profile',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 14,
                                // color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                  NavigationRailDestination(
                    icon: const Icon(Icons.settings),
                    label: MouseRegion(
                      onEnter: (_) => setState(() => settingsContainer = true),
                      onExit: (_) => setState(() => settingsContainer = false),
                      child: settingsContainer
                          ? Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey[50],
                                borderRadius: BorderRadius.circular(
                                    20), // Your background color
                                border: Border(
                                    right:
                                        BorderSide(color: Colors.grey[300]!)),
                              ),
                              child: Center(
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    // fontSize: 14,
                                    color:
                                        settingsContainer ? Colors.black : null,
                                  ),
                                ),
                              ),
                            )
                          : const Text(
                              'Settings',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // fontSize: 14,
                                // color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
                selectedIndex: navState.selectedIndex,
                onDestinationSelected: (int index) {
                  navState.setIndex(index);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: screens[navState.selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
