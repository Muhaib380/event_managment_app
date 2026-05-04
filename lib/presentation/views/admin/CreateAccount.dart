import 'package:event_managment_app/presentation/views/admin/profile/Bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../configurations/app_colors.dart';
import '../../constants/assets_constants.dart';

class CreateAccountAdmin extends StatefulWidget {
  const CreateAccountAdmin({super.key});

  @override
  State<CreateAccountAdmin> createState() => _CreateAccountAdminState();
}

class _CreateAccountAdminState extends State<CreateAccountAdmin> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool _isObscurePassword = true;
  bool _isObscureConfirm = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // ✅ Responsive helpers
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/walkingthrough_bck.png"),
              fit: BoxFit.cover, // ✅ background responsive
            ),
          ),
          child: Column(
            children: [
              Gap(sh * 0.07), // ✅ was const Gap(55)

              Padding(
                padding: EdgeInsets.only(left: sw * 0.05), // ✅ was left: 20
                child: Row(
                  children: [
                    Text(
                      "Create",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: sw * 0.065, // ✅ was 26
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Gap(sw * 0.015), // ✅ was Gap(6)
                    Text(
                      "Account",
                      style: GoogleFonts.poppins(
                        fontSize: sw * 0.065,
                        fontWeight: FontWeight.w600,
                        color: isDark ? Colors.white : AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(right: sw * 0.35), // ✅ was right: 138
                child: Text(
                  "Enter given detail to create your",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: sw * 0.035,
                    color: isDark ? Colors.white : AppColors.gotamblackColor,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: sw * 0.78), // ✅ was right: 310
                child: Text(
                  "account",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: sw * 0.035,
                    color: isDark ? Colors.white : AppColors.gotamblackColor,
                  ),
                ),
              ),

              Gap(sh * 0.05), // ✅ was Gap(40)

              Padding(
                padding: EdgeInsets.only(
                  left: sw * 0.04,
                  right: sw * 0.03,
                ), // ✅ was left:16 right:12
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Email",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: sw * 0.035,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              // ── Email Field ─────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.03,
                  vertical: sh * 0.01,
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  enableSuggestions: false,
                  autocorrect: false,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: sw * 0.038,
                  ),
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Enter email",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                      fontSize: sw * 0.035,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white : AppColors.blackColor,
                      fontSize: sw * 0.035,
                    ),
                    fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),

              Gap(sh * 0.02), // ✅ was Gap(16)

              Padding(
                padding: EdgeInsets.only(left: sw * 0.04, right: sw * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Password",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: sw * 0.035,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              // ── Password Field ──────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.03,
                  vertical: sh * 0.01,
                ),
                child: TextField(
                  key: const ValueKey('adminPassword'),
                  controller: passwordController,
                  obscureText: _isObscurePassword,
                  enableSuggestions: false,
                  autocorrect: false,
                  autofillHints: const [AutofillHints.newPassword],
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: sw * 0.038,
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Enter password",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                      fontSize: sw * 0.035,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white : AppColors.blackColor,
                      fontSize: sw * 0.035,
                    ),
                    fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: isDark ? Colors.white : Colors.black,
                        size: sw * 0.055,
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

              Gap(sh * 0.02),

              Padding(
                padding: EdgeInsets.only(left: sw * 0.04, right: sw * 0.03),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Confirm Password",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: sw * 0.035,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              // ── Confirm Password Field ──────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: sw * 0.03,
                  vertical: sh * 0.01,
                ),
                child: TextField(
                  key: const ValueKey('adminConfirmPassword'),
                  controller: confirmpasswordController,
                  obscureText: _isObscureConfirm,
                  enableSuggestions: false,
                  autocorrect: false,
                  autofillHints: null,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black,
                    fontSize: sw * 0.038,
                  ),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    hintText: "Enter confirm password",
                    hintStyle: TextStyle(
                      color: isDark ? Colors.white54 : Colors.grey,
                      fontSize: sw * 0.035,
                    ),
                    labelStyle: TextStyle(
                      color: isDark ? Colors.white : AppColors.blackColor,
                      fontSize: sw * 0.035,
                    ),
                    fillColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: isDark ? Colors.white : Colors.black,
                        size: sw * 0.055,
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

              Gap(sh * 0.08), // ✅ was Gap(62)
              // ── Continue Button ─────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
                child: SizedBox(
                  height: sh * 0.07, // ✅ was hardcoded 56
                  width: double.infinity, // ✅ was hardcoded 392
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Bottom_BarAdmin(),
                        ),
                      );
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
                        fontSize: sw * 0.04,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),

              Gap(sh * 0.045), // ✅ was Gap(36)

              Text(
                "OR",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: sw * 0.04,
                  color: isDark ? Colors.white : AppColors.blackColor,
                ),
              ),

              Gap(sh * 0.065), // ✅ was Gap(52)
              // ── Google Button ───────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
                child: SizedBox(
                  width: double.infinity, // ✅ was hardcoded 392
                  height: sh * 0.07, // ✅ was hardcoded 56
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
                          height: sw * 0.09, // ✅ was hardcoded 36
                          width: sw * 0.09,
                        ),
                        SizedBox(width: sw * 0.05), // ✅ was SizedBox(width: 20)
                        Text(
                          "Continue with google",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: sw * 0.035,
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

              Gap(sh * 0.1), // ✅ was Gap(80)
              // ── Login Row ───────────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If you don't have an account",
                    style: GoogleFonts.poppins(
                      fontSize: sw * 0.03,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: sw * 0.038,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),

              Gap(sh * 0.04), // ✅ was Gap(30)
            ],
          ),
        ),
      ),
    );
  }
}
