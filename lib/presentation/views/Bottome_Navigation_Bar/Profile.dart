import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Edit_details/ediit_details.dart';
import 'package:event_managment_app/presentation/views/iphone-16/notifition.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text("Setting",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
              fontSize: 18,color: AppColors.profilesetting),),
            ),
            Gap(50),
            Center(child: Image.asset(AssetsConstants.profile,width: 82,height: 82,)),
            Gap(8),
            Text("Morgan mill",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                fontSize: 18,color: AppColors.blackColor)),
            Text("example23@gmail.com",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                fontSize: 14,color: AppColors.grayColor)),
            Gap(24),
            SizedBox(
              height: 52,
              width: 160,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditDetails()));
              },style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: .circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 16),
              ), child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                Icon(Icons.mode_edit_outline,color: AppColors.whiteColor,),
                Gap(6),
                Text("Edit Profile",style: GoogleFonts.poppins(fontWeight: FontWeight.w700,
                fontSize: 14,color: AppColors.whiteColor),)
              ],)
              ),
            ),
            Gap(30),
            ListTile(
              leading: Icon(Icons.notifications_none),
              title: Text(
                "Notifications",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.blackColor
                ),
              ),
              trailing: InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Notifition()));
                  },
                  child: Icon(Icons.arrow_forward_ios_rounded,size: 16,)),
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Gap(8),
            ListTile(
              leading: Icon(Icons.insert_drive_file_outlined),
              title: Text("Privicy Policy",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blackColor
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              onTap: (){},
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Gap(8),
            ListTile(
              leading: Icon(Icons.insert_drive_file_outlined),
              title: Text("Term & Conditions",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blackColor
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              onTap: (){},
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Gap(8),
            ListTile(
              leading: Icon(Icons.help_outline_outlined),
              title: Text("Help & Support",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blackColor
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              onTap: (){},
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            Gap(8),
            ListTile(
              leading: Icon(Icons.share),
              title: Text("Invite Your Friend",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blackColor
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              onTap: (){},
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.dark_mode_outlined),
              title: Text("Dark Mode",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.blackColor
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              onTap: (){},
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),
            ListTile(
              leading: Icon(Icons.logout,color: AppColors.primaryColor,),
              title: Text("Logout",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: AppColors.primaryColor
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios,size: 16,),
              onTap: (){},
            ),
            Divider(
              color: AppColors.lightgray,
              thickness: 1,
              indent: 16,
              endIndent: 16,
            ),

          ],),
        ),
      ),
    );
  }
}
