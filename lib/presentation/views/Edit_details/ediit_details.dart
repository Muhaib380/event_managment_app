import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDetails extends StatefulWidget {
  const EditDetails({super.key});

  @override
  State<EditDetails> createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Edit Detail"
          ,style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,color: AppColors.blackColor),),
      ),
      body: Column(children: [
        Gap(28),
        Center(child: Image.asset(AssetsConstants.edit_profile,width: 152,height: 152,)),
        Gap(39),
        Padding(
          padding: const EdgeInsets.only(right: 270),
          child: Text("Username"
              ,style:GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,color: AppColors.blackColor
              ) ),
        ),
        Gap(7),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            color: Colors.transparent,
            child: TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Mack_tor",
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.profilesetting)
                ),
              ),
            ),
          ),
        ),
        Gap(55),
        SizedBox(
            width: 392,
            height: 56,
            child: ElevatedButton(onPressed: (){},style: ElevatedButton
                .styleFrom(
               backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(10),
              )

            ), child: Text("Save Changes",style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,color: AppColors.whiteColor
            ),)))
      ],),
    );
  }
}
