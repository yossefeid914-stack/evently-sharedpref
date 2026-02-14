import 'package:evently/screens/authentication/loginscreen/login_screen.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:evently/screens/onboarding_screen/onboarding_screen2.dart';
import 'package:evently/screens/onboarding_screen/onboarding_screen3.dart';
import 'package:evently/screens/profile_tab/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPageFour extends StatelessWidget {
  const OnboardingPageFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0E3A99)),
          onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
          );},
        ),
        centerTitle: true,
        title: Image.asset('assets/images/EvenlyLogo.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/onboarding4.png',
              width: double.infinity,
            ),
            Text(
              'Connect with Friends & Share Moments',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C1C1C)),
            ),
            Text(
              "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
            style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF686868)),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  HomeScreen(),
                  ),
                );},
                child: Text(
                  'Get Started',
                  style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Color(0xFF0E3A99)),
              ),
            )
          ],
        ),
      ),
    );
  }
}