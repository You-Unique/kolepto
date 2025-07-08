import 'package:flutter/material.dart';
import 'package:kolepto/screens/shared_utils/extension.dart';
import 'package:kolepto/screens/shared_utils/primary_colour.dart';

class GoogleSignInButton extends StatefulWidget {
  final VoidCallback onTap;

  const GoogleSignInButton({
    super.key,
    required this.onTap,
  });

  @override
  State<GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool googleBorder = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (_) => setState(() => googleBorder = true),
        onExit: (_) => setState(() => googleBorder = false),
        child: Container(
          height: 56,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color:
                  googleBorder ? KoleptoColor.primaryColor : Colors.transparent,
              width: 2,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
              ),
            ],
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Google'.toPNG(),
                  width: 24,
                  height: 24,
                ),
                10.hSpace,
                const Text(
                  'Sign In With Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
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
