import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Group_profile/group_profile.dart';
import 'package:event_managment_app/presentation/views/admin/Events/create_events.dart';
import 'package:event_managment_app/presentation/views/admin/Events/upload_events.dart';
import 'package:event_managment_app/presentation/views/admin/GroupProfile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityAdmin extends StatefulWidget {
  const CommunityAdmin({super.key});

  @override
  State<CommunityAdmin> createState() => _CommunityAdminState();
}

class _CommunityAdminState extends State<CommunityAdmin> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: AppColors.primaryColor, elevation: 0),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UplaodEventAdmin()),
              );
            },
            heroTag: "vote",
            backgroundColor: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.how_to_vote, color: AppColors.whiteColor, size: 20),
                Text(
                  "Vote",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Gap(16),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateEventAdmin()),
              );
            },
            heroTag: "event",
            backgroundColor: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: AppColors.whiteColor, size: 20),
                Text(
                  "Evets",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.primaryColor,
                child: ListTile(
                  leading: Image.asset(
                    AssetsConstants.Ellipse,
                    width: 54,
                    height: 54,
                  ),
                  title: Text(
                    "Business group",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.more_vert_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              const Gap(30),
              _buildEventCard(context),
              const Gap(16),
              _buildEventCard(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 394,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.black : Colors.white,
        border: Border.all(
          color: isDark ? Colors.white : AppColors.borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: InkWell(
              child: Image.asset(
                AssetsConstants.blackday,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GroupProfileAdmin(),
                  ),
                );
              },
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Made in Melanin! Black History Month Social",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          const Gap(12),

          _buildOption(
            context,
            "A.",
            "Made in Melanin! Black History Month Social",
            "12k Votes",
            true,
          ),

          const Gap(10),

          _buildOption(
            context,
            "B.",
            "Made in Melanin! Black History Month Social",
            "12k Votes",
            false,
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "12hr ago",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption(
    BuildContext context,
    String label,
    String text,
    String votes,
    bool isChecked,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          const Gap(8),
          Icon(
            isChecked
                ? Icons.radio_button_checked_outlined
                : Icons.radio_button_off,
            color: isChecked
                ? AppColors.primaryColor
                : Theme.of(context).iconTheme.color,
            size: 20,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  votes,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
