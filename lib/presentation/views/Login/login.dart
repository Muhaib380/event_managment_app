import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Login/create_account.dart';
import 'package:event_managment_app/presentation/views/walkthrough_pages/walkthrough_1.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configurations/app_colors.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SingleChildScrollView(
        child: Container(
          decoration:BoxDecoration(
            image : DecorationImage(
                image: AssetImage("assets/images/walkingthrough_bck.png")
          )
            ,),
        child: Column(children: [
            Gap(52.38),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
            Text("Login",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 24,
            color: AppColors.primaryColor),),
              Gap(6),
              Text("To Your Account",style: GoogleFonts.poppins(fontSize: 24,fontWeight: FontWeight.w600,
              color: AppColors.blackColor),)
            ]),
        ),
        Padding(
          padding: const EdgeInsets.only(right:127),
          child: Text("Enter given detail to login to your ",style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,color: AppColors.gotamblackColor
          ),),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 315),
          child: Text(" account",style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,color: AppColors.gotamblackColor
          ),),
        ),
          Gap(114),
          Padding(
            padding: const EdgeInsets.only(right: 270),
            child: Text("Phone number",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 14,
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
          Padding(
            padding: const EdgeInsets.only(left: 230),
            child: TextButton(onPressed: (){}, child: Text("Forgot Password?",style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,fontSize: 16,color:AppColors.FpasswordColor
            ),)),
          ),
          Gap(33),
          SizedBox(
            height: 56,
            width: 392,
            child: ElevatedButton(onPressed: (){
            },style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: .circular(10),
              )
            ), child: Text("Login",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,
            fontSize: 16,color: AppColors.whiteColor),)),
          ),
          Gap(62),
          Center(
            child: Text("OR",style: GoogleFonts.poppins(fontWeight: FontWeight.w600,fontSize: 16,
            color: AppColors.blackColor),),
          ),
           Gap(43),
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
                 Text("Continue with google"
                   ,style: GoogleFonts.poppins(
                       fontWeight: FontWeight.w600
                 ,fontSize: 14,color: AppColors.gotamblackColor),),
               ],)
             ],)),
           ),
               Gap(175),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                 Text("If you don’t have an account",style: GoogleFonts.poppins(fontWeight: FontWeight.w400,
                 fontSize: 12,color: AppColors.blackColor),),
                 TextButton(onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
                 }, child: Text("Create Account",style: GoogleFonts.poppins(
                   fontWeight: FontWeight.w400,fontSize: 15,color: AppColors.primaryColor,letterSpacing: 0,
                 ),))
               ],),
               Gap(33),
        ],),
        ),
      )


    );
  }
}
