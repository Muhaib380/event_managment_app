import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Group_profile/group_profile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
        body: SafeArea(
          child: SingleChildScrollView(
          child: Column(children: [
          Container(
          color: AppColors.primaryColor,
          child:
             ListTile(
             leading: Image.asset(AssetsConstants.Ellipse,width: 54,height: 54,),
             title: Text("Business group"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w600,
             fontSize: 18,color: AppColors.whiteColor),),
             trailing: Icon(Icons.more_vert_outlined,color: AppColors.whiteColor,),
          ),
          ),
             Gap(30),
             Container(
             width: 394,
             height: 400,
             decoration: BoxDecoration(
             borderRadius: .circular(12),
             border: Border.all(color: AppColors.borderColor),
          ),
             child: Column(
             children: [
             InkWell(
               child: Image.asset(
               AssetsConstants.blackday,
               width:double.infinity
                ),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => GroupProfile()));
               },
             ),
             Gap(10),
             Text(
             "Made in Melanin! Black History Month Social",
             style: GoogleFonts.poppins(
             fontWeight: FontWeight.w600,
             fontSize: 16,
             color: AppColors.blackColor,
          ),
          ),
             Row(
             children: [
             Gap(8),
             Text("A.",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,
             color: AppColors.blackColor),),
             Gap(6),
             Icon(Icons.radio_button_checked_outlined,color: AppColors.primaryColor,),
             Gap(6),
             Column(
             children: [
             Padding(
             padding: const EdgeInsets.only(top: 14),
             child: Text("Made in Melanin! Black History Month Social"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 14,color: AppColors.melaninBlack
          ),),
          ),
             Padding(
             padding: const EdgeInsets.only(right: 270),
             child: Text("12k Votes"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 10,color: AppColors.lightgray
          ),),
          )
          ],
          ),
          ],),
             Row(
             children: [
             Gap(10),
             Text("B.",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,
             color: AppColors.blackColor),),
             Gap(6),
             Icon(Icons.radio_button_off),
             Gap(6),
             Column(
             children: [
             Padding(
             padding: const EdgeInsets.only(top: 14),
             child: Text("Made in Melanin! Black History Month Social"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 14,color: AppColors.melaninBlack
          ),),
          ),
             Padding(
             padding: const EdgeInsets.only(right: 270),
             child: Text("12k Votes",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
             fontSize: 10,color: AppColors.lightgray
          ),),
          )
          ],
          ),
          ],),
             Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
             Padding(
             padding: const EdgeInsets.only(right: 10),
             child: Text("12hr ago"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 12,color: AppColors.melaninBlack),),
          )
          ],)
          ],
          ),
          ),
             Gap(16),
             Container(
             width: 394,
             height: 400,
             decoration: BoxDecoration(
             borderRadius: .circular(12),
             border: Border.all(color: AppColors.borderColor),
          ),
             child: Column(
             children: [
             InkWell(
               child: Image.asset(
               AssetsConstants.blackday,
               width:double.infinity
                         ),
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => GroupProfile()));
               },
             ),
             Gap(10),
             Text(
             "Made in Melanin! Black History Month Social",
             style: GoogleFonts.poppins(
             fontWeight: FontWeight.w600,
             fontSize: 16,
             color: AppColors.blackColor,
          ),
          ),
             Row(
             children: [
             Gap(8),
             Text("A.",
             style: GoogleFonts.poppins(
             fontWeight: FontWeight.w500,fontSize: 14,
             color: AppColors.blackColor),),
             Gap(6),
             Icon(Icons.radio_button_checked_outlined,color: AppColors.primaryColor,),
             Gap(6),
             Column(
             children: [
             Padding(
             padding: const EdgeInsets.only(top: 14),
             child: Text("Made in Melanin! Black History Month Social",
             style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 14,color: AppColors.melaninBlack
          ),),
          ),
             Padding(
             padding: const EdgeInsets.only(right: 270),
             child: Text("12k Votes"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 10,color: AppColors.lightgray
          ),),
          )
          ],
          ),
          ],),
             Row(
             children: [
             Gap(10),
             Text("B.",style: GoogleFonts.poppins(
             fontWeight: FontWeight.w500,fontSize: 14,
             color: AppColors.blackColor),),
             Gap(6),
             Icon(Icons.radio_button_off),
             Gap(6),
             Column(
             children: [
             Padding(
             padding: const EdgeInsets.only(top: 14),
             child: Text("Made in Melanin! Black History Month Social",
             style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 14,color: AppColors.melaninBlack
          ),),
          ),
             Padding(
             padding: const EdgeInsets.only(right: 270),
             child: Text("12k Votes"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 10,color: AppColors.lightgray
          ),),
          )
          ],
          ),
          ],),
             Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
             Padding(
             padding: const EdgeInsets.only(right: 10),
             child: Text("12hr ago"
             ,style: GoogleFonts.poppins(
             fontWeight: FontWeight.w400,
             fontSize: 12,color: AppColors.melaninBlack),),
          )
          ],)
          ],
          ),
          ),


          ],),
          ),
        ),
    );
  }
}
