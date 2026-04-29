import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationAdmin extends StatefulWidget {
  const NotificationAdmin({super.key});

  @override
  State<NotificationAdmin> createState() => _NotificationAdminState();
}

class _NotificationAdminState extends State<NotificationAdmin> {
  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,

      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        leading: Icon(Icons.arrow_back,
            color: isDark ? Colors.white : Colors.black),

        title: Text(
          "Notification",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(32),

            _tile(isDark),
            const Gap(16),
            _tile(isDark),
            const Gap(16),
            _tile(isDark),
            const Gap(16),
            _tile(isDark),
            const Gap(16),
            _tile(isDark),
            const Gap(16),
            _tile(isDark),
            const Gap(16),
            _tile(isDark),
          ],
        ),
      ),
    );
  }

  Widget _tile(bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 70,
        width: 392,
        color: isDark ? const Color(0xFF1E1E1E) : AppColors.listtile,
        child: ListTile(
          leading: Image.asset(
            AssetsConstants.notification,
            height: 54,
            width: 60,
          ),

          title: Text(
            "Lorem ipsum dolor sit amet consectetur.,",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: isDark ? Colors.white : AppColors.blackColor,
            ),
          ),

          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.circle,
                color: AppColors.primaryColor,
              ),
              const Gap(6),
              Text(
                "4:00pm",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isDark
                      ? Colors.white70
                      : AppColors.profilesetting,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}