import 'package:event_managment_app/infrastructure/models/user.dart';
import 'package:event_managment_app/infrastructure/services/auth.dart';
import 'package:event_managment_app/infrastructure/services/user.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
import 'package:event_managment_app/presentation/views/Login/login.dart';
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
  TextEditingController confirmpasswordController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirm = true;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
    backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,

      body: SingleChildScrollView(
      child: Container(
      decoration: BoxDecoration(
      image: const DecorationImage(
      image: AssetImage("assets/images/walkingthrough_bck.png"),
      fit: BoxFit.cover,
      ),
      ),

          child: Column(
          children: [
          const Gap(55),

          Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
          children: [
          Text(
          "Create",
          style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 26,
          color: AppColors.primaryColor,
          ),
          ),
          const Gap(6),
          Text(
          "Account",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
          ),
          ],
          ),
          ),

              Padding(
                padding: const EdgeInsets.only(right: 138),
                child: Text(
                  "Enter given detail to create your",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : AppColors.gotamblackColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 310),
                child: Text(
                  "account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : AppColors.gotamblackColor,
                  ),
                ),
              ),
            const SizedBox(height: 82),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),
            ),

            // Email Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                enableSuggestions: false,
                autocorrect: false,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter email",
                  hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.grey),
                  labelStyle: TextStyle(color: isDark ? Colors.white : AppColors.blackColor),
                  fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const Gap(16),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),
            ),
            // Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                key: const ValueKey('adminPassword'),
                controller: passwordController,
                obscureText: _isObscurePassword,
                enableSuggestions: false,
                autocorrect: false,
                autofillHints: const [AutofillHints.newPassword],
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter password",
                  hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.grey),
                  labelStyle: TextStyle(color: isDark ? Colors.white : AppColors.blackColor),
                  fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscurePassword ? Icons.visibility_off : Icons.visibility,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscurePassword = !_isObscurePassword;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const Gap(16),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Confirm Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),
            ),

            // Confirm Password Field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: TextField(
                key: const ValueKey('adminConfirmPassword'),
                controller: confirmpasswordController,
                obscureText: _isObscureConfirm,
                enableSuggestions: false,
                autocorrect: false,
                autofillHints: null,
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  hintText: "Enter confirm password",
                  hintStyle: TextStyle(color: isDark ? Colors.white54 : Colors.grey),
                  labelStyle: TextStyle(color: isDark ? Colors.white : AppColors.blackColor),
                  fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                  filled: true,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscureConfirm ? Icons.visibility_off : Icons.visibility,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscureConfirm = !_isObscureConfirm;
                      });
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const Gap(62),

               SizedBox(
                 height: 56,
                 width: 392,
                 child: isLoading ? Center(child: CircularProgressIndicator(),)
                 :ElevatedButton(
                 onPressed: ()async{
                   if(emailController.text.isEmpty || passwordController.text.isEmpty || confirmpasswordController.text.isEmpty){
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(content: Text("Fill all fields")));
                     return;
                   }
                   if(passwordController.text != confirmpasswordController.text){
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(content: Text("Password is not matching")));
                     return;
                   }
                   try{
                     isLoading = true;
                     setState(() {});
                     await AuthServices().registerUser(
                         email: emailController.text, 
                         password: passwordController.text
                     ).then((val){
                       UserServices().createUser(UserModel(
                         docId: val.uid,
                         email: emailController.text
                       )).then((val){
                         isLoading = false;
                         setState(() {});
                         Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                       });
                     });
                   }catch(e){
                     isLoading = false;
                     setState(() {});
                     ScaffoldMessenger.of(context)
                     .showSnackBar(SnackBar(content: Text(e.toString())));
                   }
                 },
                 style: ElevatedButton.styleFrom(
                 backgroundColor: AppColors.primaryColor,
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),

              const Gap(36),

              Text(
                "OR",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isDark ? Colors.white : AppColors.blackColor,
                ),
              ),

              const Gap(52),

              SizedBox(
                width: 392,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsConstants.icongoogle,
                        height: 36,
                        width: 36,
                      ),
                      const SizedBox(width: 20),
                    Text(
                    "Continue with google",
                      style: GoogleFonts.poppins(
                       fontWeight: FontWeight.w600,
                        fontSize: 14,
                         color: isDark
                          ? Colors.white
                          : AppColors.gotamblackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Gap(80),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don’t have an account",
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
