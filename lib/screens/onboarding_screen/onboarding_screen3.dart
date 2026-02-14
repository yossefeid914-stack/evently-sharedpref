import 'package:evently/screens/onboarding_screen/onboarding_screen4.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPageThree extends StatelessWidget {
  const OnboardingPageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0E3A99)),
          onPressed: () {},
        ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/onboarding3.png',
              width: double.infinity,
            ),
            Text(
              'Effortless Event Planning',
              style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF1C1C1C)),
            ),
            Text(
              "Take the hassle out of organizing events with our all-in-one planning tools."
                  " From setting up invites and managing RSVPs to scheduling reminders and coordinating details,"
                  " we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF686868)),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  OnboardingPageFour(),
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
    );
  }
}