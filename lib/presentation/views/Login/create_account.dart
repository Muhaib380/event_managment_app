import 'package:event_managment_app/infrastructure/models/user.dart';
import 'package:event_managment_app/infrastructure/services/auth.dart';
import 'package:event_managment_app/infrastructure/services/user.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
import 'package:event_managment_app/presentation/views/Login/login.dart';
import 'package:event_managment_app/presentation/views/admin/profile/Bottom_Bar.dart';
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
  bool isLoading = false;
  bool _isObscurePassword = true;
  bool _isObscureConfirm = true;

  @override
  Widget build(BuildContext context) {
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

              // ── Subtitle ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: Text(
                  "Enter given detail to create your account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: isDark ? Colors.white : AppColors.gotamblackColor,
                  ),
                ),
              ),

              const Gap(40),

              // ── Email Field ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 8),
                child: TextField(
                  controller: emailController,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter email",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                    fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              const Gap(16),

              // ── Password Field ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 8),
                child: TextField(
                  key: const ValueKey('password'),
                  controller: passwordController,
                  obscureText: _isObscurePassword,
                  enableSuggestions: false,
                  autofillHints: null,
                  autocorrect: false,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter password",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                    fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
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

              // ── Confirm Password Field ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 8),
                child: TextField(
                  controller: confirmpasswordController,
                  enableSuggestions: false,
                  autocorrect: false,
                  autofillHints: null,
                  key: const ValueKey('confirmPassword'),
                  obscureText: _isObscureConfirm,
                  style: TextStyle(color: isDark ? Colors.white : Colors.black),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Enter confirm password",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                    fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
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

              // ── Continue Button ──
              Padding(
                padding: EdgeInsets.symmetric(horizontal: hPad),
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 56,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                            try {
                              isLoading = true;
                              setState(() {});
                              await AuthServices()
                                  .registerUser(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                  .then((val) async {
                                    UserServices()
                                        .createUser(
                                          UserModel(
                                            docId: val.uid,
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        )
                                        .then((value) {
                                          isLoading = false;
                                          setState(() {});
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                content: Text(
                                                  "Register Successfully",
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text("Okay"),
                                                  ),
                                                ],
                                              );
                                            },
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
                            "Continue",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ),
              ),

              const Gap(36),

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

              const Gap(52),

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

              const Gap(80),

              // ── Login Row ──
              Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Text(
                      "If you don't have an account",
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
              ),

              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
