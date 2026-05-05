import 'package:event_managment_app/infrastructure/services/auth.dart';
import 'package:event_managment_app/infrastructure/services/user.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
import 'package:event_managment_app/presentation/views/Login/create_account.dart';
import 'package:event_managment_app/presentation/views/Provider/Provider.dart';
import 'package:event_managment_app/presentation/views/admin/profile/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../configurations/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var userPovider = Provider.of<UserProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Responsive helpers
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final hPad = screenWidth * 0.05; // 5% horizontal padding

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage("assets/images/walkingthrough_bck.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(screenHeight * 0.065),

              // ── Title Row ──
              Padding(
                padding: EdgeInsets.only(left: hPad),
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
                    ),
                  ],
                ),
              ),

              // ── Subtitle ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: Text(
                  "Enter given detail to login to your account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              Gap(screenHeight * 0.13),

              // ── Phone/Email Label ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: Text(
                  "Phone number",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              // ── Email Field ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 8),
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

              const Gap(16),

              // ── Password Label ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: Text(
                  "Password",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              // ── Password Field ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 8),
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

              // ── Forgot Password ──
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: hPad),
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
              ),

              const Gap(33),

              // ── Login Button ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: SizedBox(
                  height: 56,
                  width: double.infinity,
                  child: isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ElevatedButton(
                          onPressed: () async {
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Fill all fields"),
                                ),
                              );
                              return;
                            }
                            try {
                              isLoading = true;
                              setState(() {});
                              await AuthServices()
                                  .loginUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((val) async {
                                    isLoading = false;
                                    setState(() {});
                                    await UserServices()
                                        .getUserProfile(val.uid)
                                        .then((userData) {
                                          userPovider.setUser(userData);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  Bottom_BarAdmin(),
                                            ),
                                          );
                                        });
                                  });
                            } catch (e) {
                              isLoading = false;
                              setState(() {});
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          },
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
              ),

              const Gap(62),

              // ── OR Divider ──
              Center(
                child: Text(
                  "OR",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),

              const Gap(43),

              // ── Google Button ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
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
                          height: 36,
                          width: 36,
                        ),
                        const Gap(16),
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
              ),

              Gap(screenHeight * 0.2),

              // ── Create Account Row ──
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "If you don't have an account",
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
                            builder: (context) => CreateAccount(),
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
                    ),
                  ],
                ),
              ),

              const Gap(33),
            ],
          ),
        ),
      ),
    );
  }
}
