import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/infrastructure/services/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/admin/Events.dart';
import 'package:event_managment_app/presentation/views/event/evets_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FeaturesAdmin extends StatefulWidget {
  final Function(EventModel, bool) onFavoriteChanged;
  final List<EventModel> favoriteEvents;

  const FeaturesAdmin({
    super.key,
    required this.onFavoriteChanged,
    required this.favoriteEvents,
  });

  @override
  State<FeaturesAdmin> createState() => _FeaturesAdminState();
}

class _FeaturesAdminState extends State<FeaturesAdmin> {
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // ✅ Responsive helpers
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Gap(sh * 0.035),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: sw * 0.05),
                    child: Text(
                      "Features",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: sw * 0.045,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(right: sw * 0.04),
                    child: Image.asset(
                      AssetsConstants.feature_icon,
                      height: sw * 0.1,
                      width: sw * 0.1,
                    ),
                  ),
                ],
              ),

              Gap(sh * 0.025),

              StreamBuilder<List<EventModel>>(
                stream: EventServices().getEvent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No events found",
                        style: GoogleFonts.poppins(fontSize: sw * 0.035),
                      ),
                    );
                  }

                  List<EventModel> events = snapshot.data!;

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: events.length,
                    itemBuilder: (context, index) {
                      EventModel event = events[index];
                      bool isFav = widget.favoriteEvents.any(
                        (e) => e.docId == event.docId,
                      );

                      return Column(
                        children: [
                          Card(
                            color: isDark ? Colors.black : Colors.white,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.borderColor,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(sw * 0.02),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: event.image != null &&
                                                  event.image!.isNotEmpty
                                              ? Image.network(
                                                  event.image!,
                                                  width: sw * 0.9,
                                                  height: sh * 0.25,
                                                  fit: BoxFit.cover,
                                                  errorBuilder: (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) {
                                                    return Image.asset(
                                                      AssetsConstants.blackday,
                                                      width: sw * 0.9,
                                                      height: sh * 0.25,
                                                      fit: BoxFit.cover,
                                                    );
                                                  },
                                                )
                                              : Image.asset(
                                                  AssetsConstants.blackday,
                                                  width: sw * 0.9,
                                                  height: sh * 0.25,
                                                  fit: BoxFit.cover,
                                                ),
                                        ),
                                        Positioned(
                                          top: sw * 0.025,
                                          right: sw * 0.025,
                                          child: GestureDetector(
                                            onTap: () {
                                              widget.onFavoriteChanged(
                                                event,
                                                !isFav,
                                              );
                                            },
                                            child: Icon(
                                              isFav
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: isFav
                                                  ? Colors.red
                                                  : (isDark
                                                        ? Colors.white70
                                                        : Colors.grey),
                                              size: sw * 0.055,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(sh * 0.012),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: sw * 0.02,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          event.title ?? '',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: sw * 0.04,
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(sh * 0.012),
                                    ListTile(
                                      leading: ImageIcon(
                                        const AssetImage(
                                          AssetsConstants.icon_calendar,
                                        ),
                                        size: sw * 0.045,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Text(
                                        event.dateTime.toString(),
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: sw * 0.032,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: ImageIcon(
                                        const AssetImage(
                                          AssetsConstants.icon_location,
                                        ),
                                        size: sw * 0.045,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Text(
                                        event.location ?? "",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: sw * 0.032,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                    // ── Add to Calendar Button ──────────
                                    SizedBox(
                                      width: double.infinity,
                                      height: sh * 0.06,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // ✅ Ab specific event pass ho raha hai
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EventsPageAdmin(
                                                event: event, // ✅ EVENT PASS
                                              ),
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
                                            fontSize: sw * 0.038,
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
                          Gap(sh * 0.03),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}