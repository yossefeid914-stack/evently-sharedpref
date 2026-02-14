import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/firebase_options.dart';
import 'package:evently/screens/authentication/loginscreen/login_screen.dart';
import 'package:evently/screens/authentication/register/register_screen.dart';
import 'package:evently/screens/home_screen/add_event/add_event.dart';
import 'package:evently/screens/home_screen/add_event/event_details_screen.dart';
import 'package:evently/screens/home_screen/home_screen.dart';
import 'package:evently/screens/onboarding_screen/onboarding_screen.dart';
import 'package:evently/screens/provider/app_language_provider.dart';
import 'package:evently/screens/provider/app_theme_provider.dart';
import 'package:evently/screens/provider/event_list_provider.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseFirestore.instance.disableNetwork();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>AppLanguageProvider()),
          ChangeNotifierProvider(create: (context)=>AppThemeProvider()),
          ChangeNotifierProvider(create: (context)=>EventListProvider()),
        ],
        child: const MyApp())
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<AppLanguageProvider>(context);
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
locale: Locale(languageProvider.appLanguage),
debugShowCheckedModeBanner: false,
initialRoute:AppRoutes.loginRoutesName ,
      routes: {
        AppRoutes.homeRouteName:(context)=>HomeScreen(),
        AppRoutes.loginRoutesName:(context)=>LoginScreen(),
        AppRoutes.registerRouterScreen:(context)=>RegisterScreen(),
        AppRoutes.addEventRouterScreen:(context)=>AddEvent(),
AppRoutes.onboardingRouterScreen:(context)=>OnboardingScreen()
      },
theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    themeMode: themeProvider.appTheme,
    );
}
}
