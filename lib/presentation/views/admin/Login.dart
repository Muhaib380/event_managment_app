import 'package:event_managment_app/presentation/constants/assets_constants.dart';
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

    // 👉 RESPONSIVE HELPERS
    final size = MediaQuery.of(context).size;
    final w = size.width;
    final h = size.height;

    double rw(double value) => w * (value / 392); // base width scale
    double rh(double value) => h * (value / 800); // base height scale

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: w,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/walkingthrough_bck.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Gap(rh(52)),

              Padding(
                padding: EdgeInsets.only(left: rw(20)),
                child: Row(
                  children: [
                    Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: rw(24),
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(rw(6)),
                    Text(
                      "To Your Account",
                      style: GoogleFonts.poppins(
                        fontSize: rw(24),
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: rw(127)),
                child: Text(
                  "Enter given detail to login to your ",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: rw(13),
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: rw(300)),
                child: Text(
                  " account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: rw(13),
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Gap(rh(82)),

              Padding(
                padding: EdgeInsets.only(right: rw(260)),
                child: Text(
                  "Phone number",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: rw(14),
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(rw(8)),
                child: TextField(
                  controller: emailController,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                    fillColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Gap(rh(16)),

              Padding(
                padding: EdgeInsets.only(right: rw(300)),
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: rw(14),
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(rw(8)),
                child: TextField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscure ? Icons.visibility_off : Icons.visibility,
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
                    fillColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : AppColors.whiteColor,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: rw(230)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: rw(14),
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              Gap(rh(33)),

              SizedBox(
                height: rh(56),
                width: w * 0.9, // 👉 FIX instead of 392
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
                      fontSize: rw(16),
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),

              Gap(rh(62)),

              Text(
                "OR",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: rw(16),
                  color: isDark ? Colors.white : AppColors.blackColor,
                ),
              ),

              Gap(rh(43)),

              SizedBox(
                width: w * 0.9,
                height: rh(56),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : AppColors.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetsConstants.icongoogle,
                        height: rh(36),
                        width: rh(36),
                      ),
                      SizedBox(width: rw(30)),
                      Text(
                        "Continue with google",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: rw(14),
                          color: isDark
                              ? Colors.white
                              : AppColors.gotamblackColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Gap(rh(120)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don’t have an account",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: rw(12),
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
                        fontSize: rw(14),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(rh(33)),
            ],
          ),
        ),
      ),
    );
  }
}
