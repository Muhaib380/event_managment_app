import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupProfileAdmin extends StatefulWidget {
  const GroupProfileAdmin({super.key});

  @override
  State<GroupProfileAdmin> createState() => _GroupProfileAdminState();
}

class _GroupProfileAdminState extends State<GroupProfileAdmin> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Group Profile",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: const [Icon(Icons.more_vert_outlined, color: Colors.white)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(40),
            const Gap(24),
            Image.asset(AssetsConstants.Ellipse, width: 94, height: 94),
            const Gap(8),
            Text(
              "Business group",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            const Gap(6),
            Text(
              "Lorem ipsum dolor sit amet consectetur. Cras elit",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: isDark ? Colors.white70 : AppColors.profilesetting,
              ),
            ),
            Text(
              "volutpat morbi mauris tincidunt lacus.",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: isDark ? Colors.white70 : AppColors.profilesetting,
              ),
            ),
            const Gap(12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.groupprofile,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                "14K Members",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            const Gap(33),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text(
                "Group Events",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),
            const Gap(16),

            // ---- Card 1 ----
            Container(
              width: 392,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDark ? Colors.black : Colors.white,
                border: Border.all(
                  color: isDark ? Colors.white12 : AppColors.borderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      AssetsConstants.blackday,
                      width: 368,
                      height: 210,
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(right: 34),
                      child: Text(
                        "Made in Melanin! Black History Month",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 283),
                      child: Text(
                        "Social.....",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: ImageIcon(
                        const AssetImage(AssetsConstants.icon_calendar),
                        size: 18,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      title: Text(
                        "28 October 2025 6:00pm GMT",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: ImageIcon(
                        const AssetImage(AssetsConstants.icon_location),
                        size: 18,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      title: Text(
                        "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 368,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Add to my calendar",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Gap(24),

            // ---- Card 2 ----
            Container(
              width: 392,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isDark ? Colors.black : Colors.white,
                border: Border.all(
                  color: isDark ? Colors.white12 : AppColors.borderColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Image.asset(
                      AssetsConstants.blackday,
                      width: 368,
                      height: 210,
                    ),
                    const Gap(10),
                    Padding(
                      padding: const EdgeInsets.only(right: 34),
                      child: Text(
                        "Made in Melanin! Black History Month",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 283),
                      child: Text(
                        "Social.....",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: ImageIcon(
                        const AssetImage(AssetsConstants.icon_calendar),
                        size: 18,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      title: Text(
                        "28 October 2025 6:00pm GMT",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: ImageIcon(
                        const AssetImage(AssetsConstants.icon_location),
                        size: 18,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      title: Text(
                        "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 368,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Add to my calendar",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Gap(24),
          ],
        ),
      ),
    );
  }
}
