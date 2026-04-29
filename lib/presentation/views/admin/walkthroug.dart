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
                  ),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 38),
                      child: Image(
                        image: AssetImage(AssetsConstants.location),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 47),
                      child: Text(
                        "Discover What's Happening Nearby",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Find real events from verified community groups ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),

                    Text(
                      " and clubs — all in one place.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
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
                  ),
                ),
                child: Column(
                  children: [
                    const Gap(108),
                    const Padding(
                      padding: EdgeInsets.only(top: 26),
                      child: Image(
                        image: AssetImage(AssetsConstants.Calendar),
                        width: 389,
                        height: 270.23,
                      ),
                    ),
                    const Gap(70),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 84),
                      child: Text(
                        "Events Sync Automatically",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: isDark ? Colors.white : AppColors.blackColor,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "No manual setup — we integrate directly with",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),

                    Text(
                      " group calendars for real-time updates.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
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
                  ),
                ),
                child: Column(
                  children: [
                    const Gap(67),
                    const Padding(
                      padding: EdgeInsets.only(top: 38),
                      child: Image(
                        image: AssetImage(AssetsConstants.Online_reminder),
                      ),
                    ),
                    const SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 62),
                      child: Text(
                        "Shape the Next",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: isDark ? Colors.white : AppColors.blackColor,
                        ),
                      ),
                    ),

                    Text(
                      " Big Event",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: isDark ? Colors.white : AppColors.blackColor,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "Vote on new event ideas, favorite your picks, and ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),

                    Text(
                      " never miss what matters most.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: isDark ? Colors.white70 : AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Skip Button
          if (_currentPage != 0)
            Positioned(
              top: 50,
              right: 20,
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
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),

          // Indicator
          Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: Controller,
                count: 3,
                effect: WormEffect(
                  activeDotColor: AppColors.primaryColor,
                  dotColor: Colors.grey.shade300,
                  dotHeight: 10,
                  dotWidth: 10,
                ),
              ),
            ),
          ),

          // Button
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginAdmin()),
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
                    fontSize: 18,
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