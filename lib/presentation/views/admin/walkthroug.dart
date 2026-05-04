import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Login/login.dart';
import 'package:event_managment_app/presentation/views/admin/Login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../configurations/app_colors.dart';

class WalkthroughAdmin extends StatefulWidget {
  const WalkthroughAdmin({super.key});

  @override
  State<WalkthroughAdmin> createState() => _WalkthroughAdminState();
}

class _WalkthroughAdminState extends State<WalkthroughAdmin> {
  final PageController Controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // ✅ Responsive helpers
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: Controller,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            children: [
              // ==================== PAGE 1 ====================
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/walkingthrough_bck.png"),
                    fit: BoxFit.cover, // ✅ background responsive
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: sh * 0.05),
                      child: Image(
                        image: const AssetImage(AssetsConstants.location),
                        width: sw * 0.85, // ✅ responsive width
                        height: sh * 0.38, // ✅ responsive height
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: sh * 0.02),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.12),
                      child: Text(
                        "Discover What's Happening Nearby",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: sw * 0.075, // ✅ font responsive
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),

                    SizedBox(height: sh * 0.015),

                    Text(
                      "Find real events from verified community groups ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: sw * 0.035,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),

                    Text(
                      " and clubs — all in one place.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: sw * 0.035,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),

              // ==================== PAGE 2 ====================
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/walkingthrough_bck.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Gap(sh * 0.1),
                    Padding(
                      padding: EdgeInsets.only(top: sh * 0.03),
                      child: Image(
                        image: const AssetImage(AssetsConstants.Calendar),
                        width: sw * 0.92, // ✅ was hardcoded 389
                        height: sh * 0.30, // ✅ was hardcoded 270
                        fit: BoxFit.contain,
                      ),
                    ),
                    Gap(sh * 0.07),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.18),
                      child: Text(
                        "Events Sync Automatically",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: sw * 0.075,
                          color: isDark ? Colors.white : AppColors.blackColor,
                        ),
                      ),
                    ),

                    SizedBox(height: sh * 0.015),

                    Text(
                      "No manual setup — we integrate directly with",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: sw * 0.035,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),

                    Text(
                      " group calendars for real-time updates.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: sw * 0.035,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),

              // ==================== PAGE 3 ====================
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/walkingthrough_bck.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Gap(sh * 0.07),
                    Padding(
                      padding: EdgeInsets.only(top: sh * 0.04),
                      child: Image(
                        image: const AssetImage(
                          AssetsConstants.Online_reminder,
                        ),
                        width: sw * 0.85,
                        height: sh * 0.35,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: sh * 0.02),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: sw * 0.14),
                      child: Text(
                        "Shape the Next",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: sw * 0.075,
                          color: isDark ? Colors.white : AppColors.blackColor,
                        ),
                      ),
                    ),

                    Text(
                      " Big Event",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: sw * 0.075,
                        color: isDark ? Colors.white : AppColors.blackColor,
                      ),
                    ),

                    SizedBox(height: sh * 0.015),

                    Text(
                      "Vote on new event ideas, favorite your picks, and ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: sw * 0.035,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),

                    Text(
                      " never miss what matters most.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: sw * 0.035,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ── Skip Button ─────────────────────────────────────
          if (_currentPage != 0)
            Positioned(
              top: sh * 0.06, // ✅ was hardcoded 50
              right: sw * 0.05, // ✅ was hardcoded 20
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text(
                  "Skip",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: sw * 0.045,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),

          // ── Indicator ───────────────────────────────────────
          Positioned(
            bottom: sh * 0.12, // ✅ was hardcoded 90
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: Controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotColor: Colors.grey.shade300,
                  dotHeight: sw * 0.025, // ✅ was hardcoded 10
                  dotWidth: sw * 0.025,
                ),
              ),
            ),
          ),

          // ── Button ──────────────────────────────────────────
          Positioned(
            bottom: sh * 0.03, // ✅ was hardcoded 20
            left: sw * 0.04, // ✅ was hardcoded 16
            right: sw * 0.04,
            child: SizedBox(
              height: sh * 0.07, // ✅ was hardcoded 56
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else {
                    Controller.animateToPage(
                      _currentPage + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _currentPage == 2 ? "Get Started" : "Next",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: sw * 0.045,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
