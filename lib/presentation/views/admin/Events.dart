import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPageAdmin extends StatefulWidget {
  const EventsPageAdmin({super.key});

  @override
  State<EventsPageAdmin> createState() => _EventsPageAdminState();
}

class _EventsPageAdminState extends State<EventsPageAdmin> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            onPressed: () => setState(() => isFavorite = !isFavorite),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 404,
              width: double.infinity,
              child: Image.asset(AssetsConstants.evets, fit: BoxFit.cover),
            ),

            const Gap(24),

            Center(
              child: Text(
                "Made in Melanin! Black History Month Social.....",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            const Gap(9),

            ListTile(
              leading: ImageIcon(
                const AssetImage(AssetsConstants.icon_calendar),
                size: 18,
                color: isDark ? Colors.white : Colors.black,
              ),
              title: Text(
                "28 October 2025 6:00pm GMT",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
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
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 275),
              child: Text(
                "Event Detail",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            const Gap(14),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 390,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : AppColors.eventContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark ? Colors.white12 : AppColors.borderColor,
                  ),
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan quam posuere. Tortor pretium lorem dui metus amet in sed. Sodales volutpat maecenas et quisque nibh ultrices in nulla.",
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
            ),

            const Gap(30),

            SizedBox(
              width: 400,
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
                  "Add to my calendar",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const Gap(50),
          ],
        ),
      ),
    );
  }
}
