import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/event/evets_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesAdmin extends StatefulWidget {
  const FeaturesAdmin({super.key});

  @override
  State<FeaturesAdmin> createState() => _FeaturesAdminState();
}

class _FeaturesAdminState extends State<FeaturesAdmin> {
  bool isFavorite = false;
  bool isfavorite = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(children: [
            const Gap(29.38),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Features",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                const Gap(257),
                Image.asset(
                  AssetsConstants.feature_icon,
                  height: 42,
                  width: 42,
                )
              ],
            ),
            const Gap(22),

            _buildCard(context, isDark, true),
            const Gap(24),
            _buildCard(context, isDark, false),
          ]),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, bool isDark, bool flag) {
    return Card(
      color: isDark ? Colors.black : Colors.white,
      child: Container(
        width: 392,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.white : AppColors.borderColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    AssetsConstants.blackday,
                    width: 368,
                    height: 210,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (flag) {
                          isfavorite = !isfavorite;
                        } else {
                          isFavorite = !isFavorite;
                        }
                      });
                    },
                    child: Icon(
                      flag
                          ? (isfavorite
                          ? Icons.favorite
                          : Icons.favorite_border)
                          : (isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      color: (flag ? isfavorite : isFavorite)
                          ? Colors.red
                          : (isDark ? Colors.white70 : Colors.grey),
                      size: 20,
                    ),
                  ),
                ),
              ],
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EventsPage()),
                  );
                },
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
          ]),
        ),
      ),
    );
  }
}
