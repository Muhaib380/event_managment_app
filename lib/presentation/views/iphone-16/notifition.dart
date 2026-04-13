import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Notifition extends StatefulWidget {
  const Notifition({super.key});

  @override
  State<Notifition> createState() => _NotifitionState();
}

class _NotifitionState extends State<Notifition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text("Notification"
          ,style:GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,color: AppColors.blackColor
          ) ,),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Gap(32),
          Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                color: AppColors.listtile,
                height: 70,
                width: 392,
                child: ListTile(
                  leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                  title: Text("Lorem ipsum dolor sit amet consectetur.,"
                    ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                    ),),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Icon(Icons.circle,color: AppColors.primaryColor,),
                    Gap(6),
                    Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400
                        ,fontSize: 14,color: AppColors.blackColor
                    ),)
                  ],),
                ),
                   ),
             ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,color: AppColors.primaryColor,),
                    Gap(6),
                    Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                          ,fontSize: 14,color: AppColors.blackColor
                      ),)
                  ],),
              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.circle,color: AppColors.primaryColor,),
                    Gap(6),
                    Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                          ,fontSize: 14,color: AppColors.blackColor
                      ),)
                  ],),
              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing: Text("4:00pm"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.profilesetting
                  ),),
              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing:
                    Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                          ,fontSize: 14,color: AppColors.profilesetting
                      ),)

              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing:
                      Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                          ,fontSize: 14,color: AppColors.profilesetting
                      ),)

              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing:
                    Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                          ,fontSize: 14,color: AppColors.profilesetting
                      ),)

              ),
            ),
          ),
          Gap(16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppColors.listtile,
              height: 70,
              width: 392,
              child: ListTile(
                leading: Image.asset(AssetsConstants.notification,height: 54,width: 60,),
                title: Text("Lorem ipsum dolor sit amet consectetur.,"
                  ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400
                      ,fontSize: 14,color: AppColors.blackColor
                  ),),
                trailing:
                    Text("4:00pm"
                      ,style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400
                          ,fontSize: 14,color: AppColors.profilesetting
                      ),)

              ),
            ),
          ),
          
        
        
        ],),
      ),
    );
  }
}
