import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPageAdmin extends StatefulWidget {
  final EventModel event;

  const EventsPageAdmin({super.key, required this.event});

  @override
  State<EventsPageAdmin> createState() => _EventsPageAdminState();
}

class _EventsPageAdminState extends State<EventsPageAdmin> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final event = widget.event;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final hPad = screenWidth * 0.05;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Hero Image ──
            SizedBox(
              height: screenHeight * 0.42,
              width: double.infinity,
              child: event.image != null && event.image!.isNotEmpty
                  ? Image.network(
                      event.image!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AssetsConstants.evets,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(AssetsConstants.evets, fit: BoxFit.cover),
            ),

            const Gap(24),

            // ── Event Title ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              child: Center(
                child: Text(
                  event.title ?? 'No Title',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),

            const Gap(9),

            // ── Date ListTile ──
            ListTile(
              leading: ImageIcon(
                const AssetImage(AssetsConstants.icon_calendar),
                size: 18,
                color: isDark ? Colors.white : Colors.black,
              ),
              title: Text(
                event.dateTime != null ? event.dateTime.toString() : 'No Date',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            // ── Location ListTile ──
            ListTile(
              leading: ImageIcon(
                const AssetImage(AssetsConstants.icon_location),
                size: 18,
                color: isDark ? Colors.white : Colors.black,
              ),
              title: Text(
                event.location ?? 'No Location',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
            ),

            // ── Event Detail Label ──
            Padding(
              padding: EdgeInsets.only(left: hPad),
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

            // ── Detail Container ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black : AppColors.eventContainer,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDark ? Colors.white12 : AppColors.borderColor,
                  ),
                ),
                child: Text(
                  event.eventdetails ??
                      'No Description Available', // ✅ FIXED HERE
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
            ),

            const Gap(30),

            // ── Add to Calendar Button ──
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hPad),
              child: SizedBox(
                width: double.infinity,
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
            ),

            const Gap(50),
          ],
        ),
      ),
    );
  }
}
