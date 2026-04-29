import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Login/create_account.dart';
import 'package:event_managment_app/presentation/views/admin/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configurations/app_colors.dart';

class LoginAdmin extends StatefulWidget {
  const LoginAdmin({super.key});

  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isObscure = true;

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
              const Gap(52.38),

              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      "To Your Account",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : AppColors.blackColor,
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 127),
                child: Text(
                  "Enter given detail to login to your ",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 315),
                child: Text(
                  " account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              const Gap(114),

              Padding(
                padding: const EdgeInsets.only(right: 270),
                child: Text(
                  "Phone number",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                    fillColor:
                    isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const Gap(16),

              Padding(
                padding: const EdgeInsets.only(right: 316),
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: isDark ? Colors.white70 : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                    fillColor:
                    isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 230),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              const Gap(33),

              SizedBox(
                height: 56,
                width: 392,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),

              const Gap(62),

              Text(
                "OR",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: isDark ? Colors.white : AppColors.blackColor,
                ),
              ),

              const Gap(43),

              SizedBox(
                width: 392,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor,
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
                      const SizedBox(width: 61),
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

              const Gap(175),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don’t have an account",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateAccountAdmin(),
                        ),
                      );
                    },
                    child: Text(
                      "Create Account",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  )
                ],
              ),

              const Gap(33),
            ],
          ),
        ),
      ),
    );
  }
}