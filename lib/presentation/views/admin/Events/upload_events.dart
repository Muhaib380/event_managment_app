import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../configurations/app_colors.dart';
// Note: Donon imports same file ke lag rahe hain, agar error aaye to ek remove kar dein.
// import '../../../configurations/app_colors.dart';

class UplaodEventAdmin extends StatefulWidget {
  const UplaodEventAdmin({super.key});

  @override
  State<UplaodEventAdmin> createState() => _UplaodEventAdminState();
}

class _UplaodEventAdminState extends State<UplaodEventAdmin> {
  @override
  Widget build(BuildContext context) {
    // Check if Dark Mode is active
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Dynamic Colors based on theme
    Color textColor = isDarkMode ? Colors.white : AppColors.blackColor;
    Color appBarBg = isDarkMode ? Colors.grey[900]! : AppColors.whiteColor;
    Color hintColor = isDarkMode ? Colors.white70 : AppColors.profilesetting;
    Color borderColor = AppColors.createevnt;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: appBarBg,
        iconTheme: IconThemeData(color: textColor), // Back arrow color fix
        leading: const Icon(Icons.arrow_back),
        title: Text(
          "Vote",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(31),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Question",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: textColor), // Input text color
                decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social,",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  ),
                ),
              ),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Options",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Option 1",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  ),
                ),
              ),
            ),
            const Gap(18),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Option 2",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  ),
                ),
              ),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.only(right: 275),
              child: Text(
                "Upload Image",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            const Gap(6),
            Padding(
              padding: const EdgeInsets.only(right: 229),
              child: Container(
                height: 127,
                width: 154,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor, width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.file_upload_outlined, color: textColor),
                    ),
                    Text(
                      "Upload",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: hintColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Gap(240),
            SizedBox(
              height: 56,
              width: 400,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: Text(
                  "Vote",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.whiteColor, // Button text white hi rahega
                  ),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}