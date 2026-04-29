import 'package:event_managment_app/infrastructure/models/user.dart';
import 'package:event_managment_app/infrastructure/services/auth.dart';
import 'package:event_managment_app/infrastructure/services/user.dart';
import 'package:event_managment_app/presentation/views/Bottome_Navigation_Bar/Bottome_Navigation/Navigation_Bar.dart';
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

              const Gap(40),

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: TextField(
                  controller: emailController,
                  enableSuggestions: false, // ← yeh add karo
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

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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

              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
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
              isLoading
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox(
                      height: 56,
                      width: 392,
                      child: ElevatedButton(
                        onPressed: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Bottom_Bar(),
                            ),
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
