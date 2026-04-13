import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configurations/app_colors.dart';
import '../../constants/assets_constants.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body:  SingleChildScrollView(
            child: Column(children: [
              Gap(29.38),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Favoruite"
                      ,style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,fontSize: 18,
                      color: AppColors.blackColor),),
                  ),
                ],),
              Gap(22),
              Card(
                child: Container(
                  height: 445,
                  width: 392,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        // ✅ Stack for image + icon
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                AssetsConstants.blackday,
                                width: 368,
                                height: 210,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 10,
                              right: 10,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                child: Container(
                                  child:  Icon(
                                    isFavorite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: isFavorite ? Colors.red : Colors.grey,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              AssetsConstants.blackday,
                              width: 368,
                              height: 210,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Container(
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
              Gap(10)
            ],),
          )
      ),
    );
  }
}
