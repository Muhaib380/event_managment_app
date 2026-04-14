import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Group_profile/group_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: AppColors.primaryColor,
                child: ListTile(
                  leading: Image.asset(AssetsConstants.Ellipse, width: 54, height: 54),
                  title: Text(
                    "Business group",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  trailing: const Icon(Icons.more_vert_outlined, color: Colors.white),
                ),
              ),
              const Gap(30),

              // Pehla Card
              _buildEventCard(context, isDark),

              const Gap(16),

              // Dusra Card
              _buildEventCard(context, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context, bool isDark) {
    return Container(
      width: 394,
      // background color set karna zaruri hai taake card alag nazar aaye
      decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: isDark ? Colors.white12 : AppColors.borderColor),
          boxShadow: [
            if(!isDark) BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10)
          ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Text alignment sahi karne ke liye
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: InkWell(
              child: Image.asset(AssetsConstants.blackday, width: double.infinity, fit: BoxFit.cover),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupProfile()));
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
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
          ),
          const Gap(12),

          // Option A
          _buildOption(isDark, "A.", "Made in Melanin! Black History Month Social", "12k Votes", true),

          const Gap(10),

          // Option B
          _buildOption(isDark, "B.", "Made in Melanin! Black History Month Social", "12k Votes", false),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("12hr ago",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 12,
                        color: isDark ? Colors.white54 : AppColors.melaninBlack)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Options ke liye ek chota widget taake color handle karna asaan ho
  Widget _buildOption(bool isDark, String label, String text, String votes, bool isChecked) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 14,
              color: isDark ? Colors.white : AppColors.blackColor)),
          const Gap(8),
          Icon(
            isChecked ? Icons.radio_button_checked_outlined : Icons.radio_button_off,
            color: isChecked ? AppColors.primaryColor : (isDark ? Colors.white54 : Colors.black54),
            size: 20,
          ),
          const Gap(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(text,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 13,
                        color: isDark ? Colors.white70 : AppColors.melaninBlack)),
                Text(votes,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400, fontSize: 10,
                        color: isDark ? Colors.white38 : AppColors.lightgray)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}