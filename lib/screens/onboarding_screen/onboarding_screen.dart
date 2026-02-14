import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onboarding_screen2.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName='OnboardingScreen';
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        centerTitle: true,
        title: Image.asset('assets/images/EvenlyLogo.png'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/being-creative.png',width: double.infinity,),
              Text('Personalize Your Experience',style: GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w600,color: Color(0xFF1C1C1C),),),
              Text('Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.',
                  style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFF686868),)),
              Column(
                spacing: 10,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Lanuage',style:  GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w500,color: Color(0xFF0E3A99),),),
                      Container(
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: (){}, child: Text('English',style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.white,),
                      ),
                              style:ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),
                                  backgroundColor: Color(0xFF0E3A99)) ,),
                            SizedBox(width: 8,),
                            ElevatedButton(onPressed: (){}, child: Text('Arabic',style:  GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF1C1C1C),),),
                              style:ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadiusGeometry.circular(8)),backgroundColor:Colors.white) ,),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Theme',style:  GoogleFonts.inter(fontSize: 18,fontWeight: FontWeight.w500,color: Color(0xFF0E3A99),),),
                      Container(
                        child: Row(
                          children: [
                            ElevatedButton(onPressed: (){}, child: Image.asset('assets/images/sun.png'),style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),backgroundColor: Color(0xFF0E3A99)), ),
                            SizedBox(width: 8,),
                            ElevatedButton(onPressed: (){}, child: Image.asset('assets/images/moon.png'),style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(8)),backgroundColor: Colors.white) ,),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
                      SizedBox(
        
                        width: double.infinity,
                          child: ElevatedButton(onPressed: (){
        
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OnboardingPageTwo(),
                                ),
                              );
                            },
                           child: Text("Let's Start",style:  GoogleFonts.inter(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white,),),style:ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),padding: EdgeInsets.symmetric(vertical: 16,horizontal: 30),backgroundColor: Color(0xFF0E3A99)) ))
            ],
          ),
        ),
      ),
    );
  }
}
