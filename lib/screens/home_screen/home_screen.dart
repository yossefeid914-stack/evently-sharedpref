import 'package:evently/l10n/app_localizations.dart';
// import 'package:evently/screens/loginscreen/login_screen.dart';
import 'package:evently/screens/profile_tab/favorite/favorite_tab.dart';
import 'package:evently/screens/profile_tab/home/home_tab.dart';
import 'package:evently/screens/profile_tab/profile_tab.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName='HomeScreen';
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedIndex=0;
List<Widget>tabList=[
  HomeTab(),FavoriteTab(),ProfileTab()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabList[selectedIndex],
bottomNavigationBar: BottomNavigationBar(
  currentIndex: selectedIndex,
onTap: (index){
    selectedIndex=index;
setState(() {

});
},
items: [
  builtBottomNavBarItem(index: 0,unSelectedIcon: Icons.home_filled,selectedIcon:Icons.home, label:AppLocalizations.of(context)!.home,),
  builtBottomNavBarItem(index: 1,unSelectedIcon: CupertinoIcons.heart,selectedIcon: Icons.favorite, label:AppLocalizations.of(context)!.favorite),
  builtBottomNavBarItem(index: 2,unSelectedIcon: Icons.person_2_outlined,selectedIcon: Icons.person, label:AppLocalizations.of(context)!.profile)
]
),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
Navigator.of(context).pushNamed(AppRoutes.addEventRouterScreen);
      },child: Icon(Icons.add,size: 30,color: AppColors.whiteColor,),),

    );
  }

  BottomNavigationBarItem builtBottomNavBarItem(
  {required IconData selectedIcon,required IconData unSelectedIcon,required String label,required int index}){

    return BottomNavigationBarItem(icon: selectedIndex==index?

    Icon(selectedIcon):Icon(unSelectedIcon),
        label:label);
  }
}
