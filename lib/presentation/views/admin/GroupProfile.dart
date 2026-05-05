import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/infrastructure/services/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/admin/Events.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class GroupProfileAdmin extends StatefulWidget {
  const GroupProfileAdmin({super.key});

  @override
  State<GroupProfileAdmin> createState() => _GroupProfileAdminState();
}

class _GroupProfileAdminState extends State<GroupProfileAdmin> {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final hPad = screenWidth * 0.04;
    final cardImageHeight = screenWidth * 0.52;

    // Profile image size
    const double avatarRadius = 47; // diameter = 94
    const double avatarDiameter = avatarRadius * 2;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: StreamProvider.value(
        value: EventServices().getEvent(),
        initialData: [EventModel()],
        builder: (context, child) {
          List<EventModel> eventList = context.watch<List<EventModel>>();

          return SingleChildScrollView(
            child: Column(
              children: [
                // ════════════════════════════════════
                // ── HERO HEADER — fixed layout ──
                // ════════════════════════════════════
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    // ── Red background section ──
                    Column(
                      children: [
                        // Red top part
                        Container(
                          height: screenHeight * 0.20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            image: DecorationImage(
                              image: AssetImage(AssetsConstants.Ellipse),
                              fit: BoxFit.cover,
                              opacity: 0.15,
                            ),
                          ),
                          child: SafeArea(
                            bottom: false,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: hPad),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    "Group Profile",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        // White curved bottom — height = half avatar
                        Container(
                          height: avatarRadius + 20,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: isDark
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Colors.white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(28),
                              topRight: Radius.circular(28),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // ── Profile Avatar — centered on the join line ──
                    Positioned(
                      // sits right on the red/white boundary
                      bottom: 20, // same as extra white height
                      child: Container(
                        width: avatarDiameter,
                        height: avatarDiameter,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            AssetsConstants.Ellipse,
                            width: avatarDiameter,
                            height: avatarDiameter,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // ── Group Name ──
                const Gap(12),
                Text(
                  "Business group",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),
                const Gap(6),

                // ── Description ──
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: hPad * 2),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Cras elit volutpat morbi mauris tincidunt lacus.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: isDark ? Colors.white70 : AppColors.profilesetting,
                    ),
                  ),
                ),
                const Gap(12),

                // ── Members Badge ──
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
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
                const Gap(28),

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

                // ════════════════════════════════════
                // ── Dynamic Firebase Event Cards ──
                // ════════════════════════════════════
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: eventList.length,
                  itemBuilder: (context, i) {
                    final event = eventList[i];

                    String formattedDate = '';
                    String formattedTime = '';
                    if (event.dateTime != null) {
                      formattedDate = DateFormat(
                        'dd MMMM yyyy',
                      ).format(event.dateTime!);
                      formattedTime = DateFormat(
                        'hh:mm a',
                      ).format(event.dateTime!);
                    }

                    bool isFav = event.isFavorite;

                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: hPad),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EventsPageAdmin(event: event),
                                ),
                              );
                            },
                            child: Container(
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
                                    // ── Image + Favorite ──
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                          child:
                                              event.image != null &&
                                                  event.image!.isNotEmpty
                                              ? Image.network(
                                                  event.image!,
                                                  width: double.infinity,
                                                  height: cardImageHeight,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (_, __, ___) =>
                                                      Image.asset(
                                                        AssetsConstants
                                                            .blackday,
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
                                        Positioned(
                                          top: 10,
                                          right: 10,
                                          child: InkWell(
                                            onTap: () async {
                                              try {
                                                await EventServices()
                                                    .toggleFavorite(
                                                      event.docId.toString(),
                                                      !isFav,
                                                    );
                                              } catch (e) {
                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    content: Text(e.toString()),
                                                  ),
                                                );
                                              }
                                            },
                                            child: Icon(
                                              isFav
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFav
                                                  ? Colors.red
                                                  : Colors.white,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    const Gap(10),

                                    // ── Title ──
                                    Text(
                                      event.title ?? '',
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
                                        const AssetImage(
                                          AssetsConstants.icon_calendar,
                                        ),
                                        size: 18,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Text(
                                        '$formattedDate  $formattedTime',
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
                                        const AssetImage(
                                          AssetsConstants.icon_location,
                                        ),
                                        size: 18,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Text(
                                        event.location ?? '',
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

                                    // ── Button ──
                                    SizedBox(
                                      width: double.infinity,
                                      height: 48,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (_) =>
                                                  EventsPageAdmin(event: event),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor,
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
                            ),
                          ),
                          const Gap(24),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
