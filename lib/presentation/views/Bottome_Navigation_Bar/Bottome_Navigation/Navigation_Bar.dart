import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Home/Home_page.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Profile.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/community.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/favorite.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/features.dart';
import 'package:flutter/material.dart';

class Bottom_Bar extends StatefulWidget {
  const Bottom_Bar({super.key});

  @override
  State<Bottom_Bar> createState() => _Bottom_BarState();
}

class _Bottom_BarState extends State<Bottom_Bar> {
  List<Widget> ScreenList = [HomePage(),Features(),Community(),Favorite(),Profile(),];
  int SelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenList.elementAt(SelectedIndex),
      bottomNavigationBar: BottomNavigationBar(
      selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.profilesetting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value){
        setState(() {
          SelectedIndex = value;
        });
        },
          currentIndex:  SelectedIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.pets,),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.star_border),label: "Features"),
        BottomNavigationBarItem(icon: Icon(Icons.people_outline),label: "Community"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: "Favourite"),
        BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),label: "Settings")
      ]),

    );
  }
}
