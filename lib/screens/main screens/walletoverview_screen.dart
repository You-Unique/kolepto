import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';

class WalletoverviewScreen extends StatefulWidget {
  const WalletoverviewScreen({super.key});

  @override
  State<WalletoverviewScreen> createState() => _WalletoverviewScreenState();
}

class _WalletoverviewScreenState extends State<WalletoverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wallet Overview',
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
              const Text(
                'Wallet Overview',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              5.vSpace,
              const Text(
                'Manage and track your funds effectively.',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              30.vSpace,
              const WalletOverviewContainer(
                  title: 'Collection Earnings',
                  subtitle1: 'COLLECTION',
                  subtitle2: 'AMOUNT',
                  subtitle3: 'PARTICIPANTS',
                  subtitle4: 'EARNINGS',
                  subtitle5: 'TOTAL EARNINGS'),
              30.vSpace,
              const WalletOverviewContainer(
                  title: 'Wallet Balance',
                  subtitle1: 'CURRENCY',
                  subtitle2: 'BALANCE',
                  subtitle3: 'AVAILABLE',
                  subtitle4: 'PENDING',
                  subtitle5: 'TOTAL'),
              30.vSpace,
              const WalletOverviewContainer(
                  title: 'Withdrawal History',
                  subtitle1: 'DATE',
                  subtitle2: 'COLLECTION',
                  subtitle3: 'DESCRIPTION',
                  subtitle4: 'AMOUNT',
                  subtitle5: 'STATUS'),
            ],
          ),
        ),
      ),
    );
  }
}

class WalletOverviewContainer extends StatefulWidget {
  final String? title;
  final String? subtitle1;
  final String? subtitle2;
  final String? subtitle3;
  final String? subtitle4;
  final String? subtitle5;

  const WalletOverviewContainer(
      {required this.title,
      this.subtitle1,
      this.subtitle2,
      this.subtitle3,
      this.subtitle4,
      this.subtitle5,
      super.key});

  @override
  State<WalletOverviewContainer> createState() =>
      _WalletOverviewContainerState();
}

class _WalletOverviewContainerState extends State<WalletOverviewContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 800,
          height: 110,
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
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.vSpace,
                Text(
                  widget.title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 65,
          child: Container(
            width: 740,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.grey[300]!,
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
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.subtitle1 ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    widget.subtitle2 ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    widget.subtitle3 ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    widget.subtitle4 ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  Text(
                    widget.subtitle5 ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.black54,
                        size: 20,
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black54,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
