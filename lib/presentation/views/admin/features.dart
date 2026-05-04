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

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
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
                  ),
                ],
              ),
              const Gap(22),

              StreamBuilder<List<EventModel>>(
                stream: EventServices().getEvent(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text("No events found"));
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
                              width: 392,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.white
                                      : AppColors.borderColor,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child:
                                              event.image != null &&
                                                  event.image!.isNotEmpty
                                              ? Image.network(
                                                  event.image!,
                                                  width: 368,
                                                  height: 210,
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) {
                                                        return Image.asset(
                                                          AssetsConstants
                                                              .blackday,
                                                          width: 368,
                                                          height: 210,
                                                          fit: BoxFit.cover,
                                                        );
                                                      },
                                                )
                                              : Image.asset(
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
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Gap(10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          event.title ?? '',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(10),
                                    ListTile(
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
                                        event.dateTime.toString(),
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
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
                                        size: 18,
                                        color: isDark
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                      title: Text(
                                        event.location ?? "",
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
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
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  EventsPageAdmin(),
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
