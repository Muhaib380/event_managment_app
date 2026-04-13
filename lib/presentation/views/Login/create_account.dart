import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
import 'package:event_managment_app/presentation/views/walkthrough_pages/walkthrough_1.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configurations/app_colors.dart';
import '../../constants/assets_constants.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        child: Container(
          decoration:BoxDecoration(
            image : DecorationImage(
                image: AssetImage("assets/images/walkingthrough_bck.png")
            )
            ,),
          child: Column(children: [
            Gap(55.38),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                  children: [
                    Text("Create",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 26,
                        color: AppColors.primaryColor),),
                    Gap(6),
                    Text("Account",style: GoogleFonts.poppins(fontSize: 26,fontWeight: FontWeight.w600,
                        color: AppColors.blackColor),)
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.only(right:129),
              child: Text("Enter given detail to create your ",style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,color: AppColors.gotamblackColor
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 309),
              child: Text(" account",style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,color: AppColors.gotamblackColor
              ),),
            ),
            Gap(40),
            Padding(
              padding: const EdgeInsets.only(right: 340),
              child: Text("Email",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,
                  color: AppColors.blackColor),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: .circular(10)
                    )
                ),
              ),
            ),
            Gap(16),
            Padding(
              padding: const EdgeInsets.only(right: 316),
              child: Text("Password",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,
                  color: AppColors.blackColor),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: (){
                        setState(() {
                          _isObscure = ! _isObscure;
                        });
                      },
                    ),
                    hintText: "Password",
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: .circular(10)
                    )
                ),
              ),
            ),
            Gap(16),
            Padding(
              padding: const EdgeInsets.only(right: 250),
              child: Text("Confirm Password",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,
                  color: AppColors.blackColor),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: passwordController,
                obscureText: _isObscure,
                decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                      onPressed: (){
                        setState(() {
                          _isObscure = ! _isObscure;
                        });
                      },
                    ),
                    hintText: "Condfirm Password",
                    fillColor: AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: .circular(10)
                    )
                ),
              ),
            ),
            Gap(62),
            SizedBox(
              height: 56,
              width: 392,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Bottom_Bar()));
              },style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(10),
                  )
              ), child: Text("Continue",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
                  fontSize: 16,color: AppColors.whiteColor),)),
            ),
            Gap(36),
            Center(
              child: Text("OR",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,
                  color: AppColors.blackColor),),
            ),
            Gap(52),
            SizedBox(
              width: 392,
              height: 56,
              child: ElevatedButton(onPressed: (){},style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: .circular(10),
                  )
              ), child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(

                    children: [
                      Image.asset(AssetsConstants.icongoogle,height: 36,width: 36,),
                      SizedBox(width: 61,),
                      Text("Continue with google",style: GoogleFonts.poppins(fontWeight: FontWeight.w600
                          ,fontSize: 14,color: AppColors.gotamblackColor),),
                    ],)
                ],)),
            ),
            Gap(113),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("If you don’t have an account",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                    fontSize: 12,color: AppColors.blackColor),),
                TextButton(onPressed: (){}, child: Text("Login",style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,fontSize: 15,color: AppColors.primaryColor,letterSpacing: 0,
                ),))
              ],),Gap(30)
            
          ],),
        ),
      ),
    );
  }
}
