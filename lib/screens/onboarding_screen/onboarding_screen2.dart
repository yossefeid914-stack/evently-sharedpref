import 'package:evently/screens/onboarding_screen/onboarding_screen3.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/app_colors.dart';

class OnboardingPageTwo extends StatelessWidget {
  static const String routeName='OnboardingScreen2';

  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,

        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Skip',
                style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF0E3A99))),
          )
        ],
        centerTitle: true,
        title: Image.asset('assets/images/EvenlyLogo.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            // spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/onboarding2.png',
                width: double.infinity,
              ),
              Text(
                'Find Events That Inspire You',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1C1C1C)),
              ),
              Text("Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
                style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF686868)),
              ),
              // const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnboardingPageThree(),
                      ),
                    );
                  },
                  child: Text(
                    'Next',
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
      ),
    );
  }
}