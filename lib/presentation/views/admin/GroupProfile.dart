import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/infrastructure/services/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/admin/Events.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupProfileAdmin extends StatefulWidget {
  const GroupProfileAdmin({super.key});

  @override
  State<GroupProfileAdmin> createState() => _GroupProfileAdminState();
}

class _GroupProfileAdminState extends State<GroupProfileAdmin> {
  // ── Favorite events ka state maintain rakhne ke liye Set banaya hai ──
  final Set<String> _favoriteEvents = {};

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final hPad = screenWidth * 0.04;
    final cardImageHeight = screenWidth * 0.52;

    // Header aur Avatar ki heights set ki gayi hain overlap ke liye
    final double headerHeight = 220.0;
    final double avatarSize = 94.0;
    final double topMarginForCurve = headerHeight - (avatarSize / 2) - 20;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // SafeArea top pe false taake red color bilkul screen ke top se start ho
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // ── 1. Red Background Header (Jaise design mein hai) ──
            Container(
              width: double.infinity,
              height: headerHeight,
              decoration: BoxDecoration(color: AppColors.primaryColor),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          "Group Profile",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ── 2. White Curved Container & Baki Ka Content ──
            Container(
              margin: EdgeInsets.only(top: topMarginForCurve),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30), // Curved edges
                ),
              ),
              child: Column(
                children: [
                  // Profile picture overlap ke liye space
                  Gap((avatarSize / 2) + 16),

                  // ── Group Name ──
                  Text(
                    "Business group",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const Gap(6),

                  // ── Group Bio ──
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: hPad),
                    child: Text(
                      "Lorem ipsum dolor sit amet consectetur. Cras elit volutpat morbi mauris tincidunt lacus.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: isDark
                            ? Colors.white70
                            : AppColors.profilesetting,
                      ),
                    ),
                  ),
                  const Gap(12),

                  // ── Members Count ──
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
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

                  // ── Group Events Label ──
                  Padding(
                    padding: EdgeInsets.only(left: hPad),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Group Events",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),

                  // ── Dynamic Events from Firebase ──
                  StreamBuilder<List<EventModel>>(
                    stream: EventServices().getEvent(),
                    builder: (context, snapshot) {
                      // Loading
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // Error
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            "Error loading events",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        );
                      }

                      // Empty
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(
                          child: Text(
                            "No events found",
                            style: GoogleFonts.poppins(fontSize: 14),
                          ),
                        );
                      }

                      final events = snapshot.data!;

                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.symmetric(horizontal: hPad),
                        itemCount: events.length,
                        separatorBuilder: (_, __) => const Gap(24),
                        itemBuilder: (context, index) {
                          final event = events[index];

                          // Unique identifier for favorite logic
                          String eventId = event.title ?? index.toString();
                          bool isFavorite = _favoriteEvents.contains(eventId);

                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: isDark ? Colors.black : Colors.white,
                              border: Border.all(
                                color: isDark
                                    ? Colors.white12
                                    : AppColors.borderColor,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ── Event Image & Favorite Icon Stack ──
                                  Stack(
                                    children: [
                                      // Image
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child:
                                            event.image != null &&
                                                event.image!.isNotEmpty
                                            ? Image.network(
                                                event.image!,
                                                width: double.infinity,
                                                height: cardImageHeight,
                                                fit: BoxFit.cover,
                                                errorBuilder:
                                                    (
                                                      context,
                                                      error,
                                                      stackTrace,
                                                    ) => Image.asset(
                                                      AssetsConstants.blackday,
                                                      width: double.infinity,
                                                      height: cardImageHeight,
                                                      fit: BoxFit.cover,
                                                    ),
                                              )
                                            : Image.asset(
                                                AssetsConstants.blackday,
                                                width: double.infinity,
                                                height: cardImageHeight,
                                                fit: BoxFit.cover,
                                              ),
                                      ),

                                      // ── Updated Favorite Icon ──
                                      Positioned(
                                        top: 5,
                                        right: 5,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (isFavorite) {
                                                _favoriteEvents.remove(
                                                  eventId,
                                                ); // Deselect
                                              } else {
                                                _favoriteEvents.add(
                                                  eventId,
                                                ); // Select
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            isFavorite
                                                ? Icons
                                                      .favorite // Jab select ho to full icon
                                                : Icons
                                                      .favorite_border, // Jab unselect ho to border
                                            // Yahan color logic update ki gai hai 👇
                                            color: isFavorite
                                                ? Colors.red
                                                : Colors.white,
                                            size: 28,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Gap(10),

                                  // ── Event Title ──
                                  Text(
                                    event.title ?? 'No Title',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),

                                  // ── Date ──
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: ImageIcon(
                                      AssetImage(AssetsConstants.icon_calendar),
                                      size: 18,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    title: Text(
                                      event.dateTime != null
                                          ? event.dateTime.toString()
                                          : 'No Date',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),

                                  // ── Location ──
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: ImageIcon(
                                      AssetImage(AssetsConstants.icon_location),
                                      size: 18,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                    title: Text(
                                      event.location ?? 'No Location',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                  ),

                                  // ── Add to Calendar Button ──
                                  SizedBox(
                                    width: double.infinity,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EventsPageAdmin(event: event),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
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
                          );
                        },
                      );
                    },
                  ),
                  const Gap(24),
                ],
              ),
            ),

            // ── 3. Overlapping Group Avatar ──
            Positioned(
              top: topMarginForCurve - (avatarSize / 2),
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: avatarSize,
                  height: avatarSize,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipOval(
                    child: Image.asset(
                      AssetsConstants.Ellipse,
                      fit: BoxFit.cover,
                    ),
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
