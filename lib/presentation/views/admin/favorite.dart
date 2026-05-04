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
              Gap(sh * 0.035), // ✅ was Gap(29.38)

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: sw * 0.05), // ✅ was left: 20
                    child: Text(
                      "Favourite",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: sw * 0.045, // ✅ was 18
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(sh * 0.025), // ✅ was Gap(22)

              widget.favoriteEvents.isEmpty
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: sh * 0.1),
                        child: Text(
                          "No favourites yet",
                          style: GoogleFonts.poppins(
                            fontSize: sw * 0.04,
                            color: isDark ? Colors.white54 : Colors.grey,
                          ),
                        ),
                      ),
                    )
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
                              margin: EdgeInsets.symmetric(
                                horizontal: sw * 0.03, // ✅ side spacing
                              ),
                              child: Container(
                                width: double.infinity, // ✅ was hardcoded 392
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: isDark
                                        ? Colors.white
                                        : AppColors.borderColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(
                                    sw * 0.02,
                                  ), // ✅ was 8.0
                                  child: Column(
                                    children: [
                                      // ── Event Image ──────────────────
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child:
                                            event.image != null &&
                                                event.image!.isNotEmpty
                                            ? Image.network(
                                                event.image!,
                                                width: double
                                                    .infinity, // ✅ was 368
                                                height: sh * 0.25, // ✅ was 210
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
                                                        width: double.infinity,
                                                        height: sh * 0.25,
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                              )
                                            : Image.asset(
                                                AssetsConstants.blackday,
                                                width: double.infinity,
                                                height: sh * 0.25,
                                                fit: BoxFit.cover,
                                              ),
                                      ),

                                      Gap(sh * 0.012), // ✅ was Gap(10)
                                      // ── Title ────────────────────────
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
                                              fontSize: sw * 0.04, // ✅ was 16
                                              color: isDark
                                                  ? Colors.white
                                                  : Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),

                                      // ── Date ─────────────────────────
                                      ListTile(
                                        leading: ImageIcon(
                                          AssetImage(
                                            AssetsConstants.icon_calendar,
                                          ),
                                          size: sw * 0.045, // ✅ was 18
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        title: Text(
                                          event.dateTime.toString(),
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            fontSize: sw * 0.032, // ✅ was 14
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),

                                      // ── Location ─────────────────────
                                      ListTile(
                                        leading: ImageIcon(
                                          AssetImage(
                                            AssetsConstants.icon_location,
                                          ),
                                          size: sw * 0.045,
                                          color: isDark
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                        title: Text(
                                          event.location ?? '',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w300,
                                            fontSize: sw * 0.032,
                                            color: isDark
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      ),

                                      // ── Button ───────────────────────
                                      SizedBox(
                                        width: double.infinity, // ✅ was 368
                                        height: sh * 0.06, // ✅ was 48
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
                                              fontSize: sw * 0.038, // ✅ was 16
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
                            Gap(sh * 0.03), // ✅ was Gap(24)
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
