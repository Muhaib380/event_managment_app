import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
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

      body:
      SingleChildScrollView(
        child: Column(children: [
        SizedBox(
          height: 404,
          width: double.infinity,
          child: Image.asset(
            AssetsConstants.evets
          ),
        ),
        Gap(24),
        Center(
          child: Text("Made in Melanin! Black History Month Social.....",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
          fontSize: 15,color: AppColors.blackColor),),
        ),
          Gap(9),
          ListTile(
            leading: Image.asset(AssetsConstants.icon_calendar,height: 18,width: 18,),
            title: Text("28 October 2025 6:00pm GMT"
              ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,color: AppColors.blackColor),),
          ),
          ListTile(
            leading: Image.asset(AssetsConstants.icon_location,height: 18,width: 18,),
            title: Text("1901 Thornridge Cir. Shiloh, Hawaii 81063"
              ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              fontSize: 14,color: AppColors.blackColor),),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 275),
            child: Text("Event Detail"
              ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
                fontSize: 16,color: AppColors.blackColor
            ),),
          ),
          Gap(14),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 390,
              height: 246,
              color: AppColors.eventContainer,
              child:
              Text("Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan quam posuere. Tortor pretium lorem dui metus amet in sed. Sodales volutpat maecenas et quisque nibh ultrices in nulla. Enim fames quam turpis pellentesque vivamus massa.Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan quam posuere. Tortor pretium lorem dui metus amet in sed. Sodales volutpat maecenas et quisque nibh ultrices in nulla. Enim fames quam turpis pellentesque vivamus massa.Lorem ipsum dolor sit amet consectetur. Sed volutpat euismod enim accumsan "),
            ),
          ),
          Gap(30),
          SizedBox(
              width: 400,
              height: 56,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape:RoundedRectangleBorder(
                  borderRadius: .circular(10),
                )
              ),  child: Text("Add to my calendar"
                ,style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 16,color: AppColors.whiteColor),)
              ),
          ),
          Gap(50),

        ],),
      )
    );
  }
}