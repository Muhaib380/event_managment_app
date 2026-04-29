import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDetails extends StatefulWidget {
  const EditDetails({super.key});

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,

      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: isDark ? Colors.white : Colors.black,
        ),
        title: Text(
          "Edit Detail",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isDark ? Colors.white : AppColors.blackColor,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(28),

            Center(
              child: Image.asset(
                AssetsConstants.edit_profile,
                width: 152,
                height: 152,
              ),
            ),

            const Gap(39),

            Padding(
              padding: const EdgeInsets.only(right: 290),
              child: Text(
                "Username",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: isDark ? Colors.white : AppColors.blackColor,
                ),
              ),
            ),

            const Gap(7),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: usernameController,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: "Mack_tor",
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white54 : Colors.grey,
                  ),
                  fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColors.profilesetting,
                    ),
                  ),
                ),
              ),
            ),

            const Gap(55),

            SizedBox(
              width: 392,
              height: 56,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Save Changes",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}