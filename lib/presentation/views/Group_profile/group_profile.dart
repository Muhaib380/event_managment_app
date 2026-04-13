import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupProfile extends StatefulWidget {
  const GroupProfile({super.key});

  @override
  State<GroupProfile> createState() => _GroupProfileState();
}

class _GroupProfileState extends State<GroupProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back,color: AppColors.whiteColor,)),
        title: Text("Group Profile"
          ,style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600
            ,fontSize: 18,color: AppColors.whiteColor
          ),),
        actions: [
          IconButton(icon: Icon(Icons.more_vert_outlined,color: AppColors.whiteColor,),
            onPressed: () {},)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Gap(40),
          Gap(24),
          Image.asset(AssetsConstants.Ellipse,width: 94,height: 94,),
          Gap(8),
          Text("Business group"
            ,style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,color: AppColors.blackColor,
          ),),
          Gap(6),
          Text("Lorem ipsum dolor sit amet consectetur. Cras elit ",
          style: GoogleFonts.poppins
            (fontWeight: FontWeight.w400,
          fontSize: 14,color: AppColors.profilesetting),),
          Text("volutpat morbi mauris tincidunt lacus. ",
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
          fontSize: 14,color: AppColors.profilesetting),),
          Gap(12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.groupprofile,
              borderRadius: BorderRadius.circular(15),
            ),
            child:
            Text("14K Members"
              ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,color: AppColors.primaryColor
            ),),
          ),
          Gap(33),
          Padding(
            padding: const EdgeInsets.only(right: 250),
            child: Text("Group Events"
            ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w600,fontSize: 16
             ,color: AppColors.blackColor
            ),),
          ),
          Gap(16),
          Card(
            child: Container(
              height: 445,
              width: 392,
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                border: Border.all(color: AppColors.borderColor),
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Image.asset(AssetsConstants.blackday,width: 368,height: 210,),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(right: 34),
                    child: Text("Made in Melanin! Black History Month "
                      ,style: GoogleFonts.poppins(
                       fontWeight: FontWeight.w600,
                       fontSize: 16,color: AppColors.blackColor
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 283),
                    child: Text(" Social....."
                      ,style: GoogleFonts.poppins(
                       fontWeight: FontWeight.w600,
                       fontSize: 16,color: AppColors.blackColor
                    ),),
                  ),
                  ListTile(
                    leading: Image.asset(AssetsConstants.icon_calendar,height: 18,width: 18,),
                    title: Text("28 October 2025 6:00pm GMT"
                      ,style: GoogleFonts.poppins(
                       fontWeight: FontWeight.w300,
                       fontSize: 14,color: AppColors.blackColor),),
                  ),
                  ListTile(
                    leading: Image.asset(AssetsConstants.icon_location,height: 18,width: 18,),
                    title: Text("1901 Thornridge Cir. Shiloh, Hawaii 81063"
                      ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,color: AppColors.blackColor),),
                  ),
                  SizedBox(
                    width: 368,
                    height: 48,
                    child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: .circular(10),
                        )
                    ), child: Text("Add to my calendar"
                      ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600
                      ,fontSize: 16,color: AppColors.whiteColor),)
                    ),
                  )
                ],),
              ),
            ),
          ),
          Gap(24),
          Card(
            child: Container(
              height: 445,
              width: 392,
              decoration: BoxDecoration(
                borderRadius: .circular(12),
                border: Border.all(color: AppColors.borderColor),
              ),
              child:
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  Image.asset(AssetsConstants.blackday,width: 368,height: 210,),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(right: 34),
                    child: Text("Made in Melanin! Black History Month "
                      ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,color: AppColors.blackColor
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 283),
                    child: Text(" Social....."
                      ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600
                      ,fontSize: 16,color: AppColors.blackColor
                    ),),
                  ),
                  ListTile(
                    leading: Image.asset(AssetsConstants.icon_calendar,height: 18,width: 18,),
                    title: Text("28 October 2025 6:00pm GMT"
                    ,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,color: AppColors.blackColor),),
                  ),
                  ListTile(
                    leading: Image.asset(AssetsConstants.icon_location,height: 18,width: 18,),
                    title: Text("1901 Thornridge Cir. Shiloh, Hawaii 81063"
                    ,style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,color: AppColors.blackColor),),
                  ),
                  SizedBox(
                    width: 368,
                    height: 48,
                    child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                      borderRadius: .circular(10),
                    )
                    ), child: Text("Add to my calendar"
                      ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600
                      ,fontSize: 16,color: AppColors.whiteColor),)
                    ),
                  )
                ],),
              ),
            ),
          ),
        ],),
      ),
    );
  }
}
