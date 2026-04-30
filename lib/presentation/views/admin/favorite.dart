import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteAdmin extends StatefulWidget {
  final List<EventModel> favoriteEvents;
  const FavoriteAdmin({super.key, required this.favoriteEvents});

  @override
  State<FavoriteAdmin> createState() => _FavoriteAdminState();
}

class _FavoriteAdminState extends State<FavoriteAdmin> {
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
                      "Favourite",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(22),

              widget.favoriteEvents.isEmpty
                  ? const Center(child: Text("No favourites yet"))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.favoriteEvents.length,
                      itemBuilder: (context, index) {
                        EventModel event = widget.favoriteEvents[index];
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
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
                                      ListTile(
                                        leading: ImageIcon(
                                          AssetImage(
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
                                          AssetImage(
                                            AssetsConstants.icon_location,
                                          ),
                                          size: 18,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        title: Text(
                                          event.location ?? '',
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
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColors.primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
