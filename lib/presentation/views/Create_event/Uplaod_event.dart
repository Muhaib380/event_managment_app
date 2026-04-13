import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configurations/app_colors.dart';

class UplaodEvent extends StatefulWidget {
  const UplaodEvent({super.key});

  @override
  State<UplaodEvent> createState() => _UplaodEventState();
}

class _UplaodEventState extends State<UplaodEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Vote"
          ,style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,color: AppColors.blackColor
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Gap(31),
          Padding(
            padding: const EdgeInsets.only(right: 320),
            child: Text("Question"
              ,style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,color: AppColors.blackColor
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social,"
                  ,hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,color: AppColors.profilesetting
              ),
                  border: OutlineInputBorder(
                      borderRadius: .circular(11),
                      borderSide: BorderSide(color: AppColors.createevnt)
                  )
              ),
            ),
          ),
          Gap(24),
          Padding(
            padding: const EdgeInsets.only(right: 320),
            child: Text("Options"
              ,style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,color: AppColors.blackColor
              ),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Option 1"
                  ,hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,color: AppColors.profilesetting
              ),
                  border: OutlineInputBorder(
                      borderRadius: .circular(11),
                      borderSide: BorderSide(color: AppColors.createevnt)
                  )
              ),
            ),
          ),
          Gap(18),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Option 2"
                  ,hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,color: AppColors.profilesetting
              ),
                  border: OutlineInputBorder(
                      borderRadius: .circular(11),
                      borderSide: BorderSide(color: AppColors.createevnt)
                  )
              ),
            ),
          ),
          Gap(24),
        Padding(
          padding: const EdgeInsets.only(right: 275),
          child: Text("Upload Image"
            ,style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,color: AppColors.blackColor
            ),),
        ),
        Gap(6),
        Padding(
          padding: const EdgeInsets.only(right: 229),
          child: Container(
            height: 127,
            width: 154,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.createevnt,
                    width: 1.5
                )
            ),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.file_upload_outlined)),
                Text("Uplaod",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,color: AppColors.profilesetting
                  ),)
              ],),
          ),
        ),
          Gap(240),
          SizedBox(
            height: 56,
            width: 400,
            child: ElevatedButton(onPressed: (){},style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(11),
                )
            ), child: Text("Vote",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,color: AppColors.whiteColor
              ),)),
          ),
          Gap(20),
        ],),
      ),
    );
  }
}
