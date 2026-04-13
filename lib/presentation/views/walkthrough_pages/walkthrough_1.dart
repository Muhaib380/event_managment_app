import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
import 'package:event_managment_app/presentation/views/Login/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../configurations/app_colors.dart';

class Walkthrough1 extends StatefulWidget {
  const Walkthrough1({super.key});

  @override
  State<Walkthrough1> createState() => _Walkthrough1State();
}

class _Walkthrough1State extends State<Walkthrough1> {
  final PageController Controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 38),
                      child: Image.asset(AssetsConstants.location),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 47),
                      child: Text("Discover What's Happening Nearby",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Find real events from verified community groups ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF727272),
                      ),
                    ),
                    Text(" and clubs — all in one place.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grayColor,
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Gap(108),
                      Padding(
                        padding: const EdgeInsets.only(top: 26),
                        child: Image.asset(AssetsConstants.Calendar, width: 389, height: 270.23),
                      ),
                      Gap(70),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 84),
                        child: Text("Events Sync Automatically",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 32,
                            color: AppColors.blackColor,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text("No manual setup — we integrate directly with",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.grayColor,
                        ),
                      ),
                      Text(" group calendars for real-time updates.",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.grayColor,
                        ),
                      ),
                      Gap(200),
                    ],
                  ),
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
                    Gap(67),
                    Padding(
                      padding: const EdgeInsets.only(top: 38),
                      child: Image.asset(AssetsConstants.Online_reminder),
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 62),
                      child: Text("Shape the Next",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    Text(" Big Event",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Vote on new event ideas, favorite your picks, and ",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grayColor,
                      ),
                    ),
                    Text(" never miss what matters most.",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.grayColor,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),


          if (_currentPage != 0)
            Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                child: Text("Skip",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ),

          // ✅ Smooth Page Indicator
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
                onDotClicked: (index) {
                  Controller.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
          ),

          //  Next / Get Started Button
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  } else {
                    Controller.animateToPage(
                      _currentPage + 1,
                      duration: Duration(milliseconds: 300),
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