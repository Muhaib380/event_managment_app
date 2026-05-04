import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/presentation/views/admin/Home.dart';
import 'package:event_managment_app/presentation/views/admin/community.dart';
import 'package:event_managment_app/presentation/views/admin/favorite.dart';
import 'package:event_managment_app/presentation/views/admin/features.dart';
import 'package:event_managment_app/presentation/views/admin/profile/profile.dart';
import 'package:flutter/material.dart';

class Bottom_BarAdmin extends StatefulWidget {
  const Bottom_BarAdmin({super.key});

  @override
  State<Bottom_BarAdmin> createState() => _Bottom_BarAdminState();
}

class _Bottom_BarAdminState extends State<Bottom_BarAdmin> {
  List<EventModel> favoriteEvents = []; // ← yahan rakho
  int SelectedIndex = 0;

  void onFavoriteChanged(EventModel event, bool isAdding) {
    setState(() {
      if (isAdding) {
        if (!favoriteEvents.any((e) => e.docId == event.docId)) {
          favoriteEvents.add(event);
        }
      } else {
        favoriteEvents.removeWhere((e) => e.docId == event.docId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screenList = [
      HomePageAdmin(),
      FeaturesAdmin(
        onFavoriteChanged: onFavoriteChanged, // ← pass karo
        favoriteEvents: favoriteEvents, // ← pass karo
      ),
      CommunityAdmin(),
      FavoriteAdmin(favoriteEvents: favoriteEvents), // ← same list
      ProfileAdmin(),
    ];

    return Scaffold(
      body: screenList.elementAt(SelectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.profilesetting,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState(() {
            SelectedIndex = value;
          });
        },
        currentIndex: SelectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.pets), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: "Features",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_outline),
            label: "Community",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favourite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
