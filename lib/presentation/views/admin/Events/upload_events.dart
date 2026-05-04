import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../configurations/app_colors.dart';

class UplaodEventAdmin extends StatefulWidget {
  const UplaodEventAdmin({super.key});

  @override
  State<UplaodEventAdmin> createState() => _UplaodEventAdminState();
}

class _UplaodEventAdminState extends State<UplaodEventAdmin>
    with SingleTickerProviderStateMixin {
  File? _selectedImage;
  bool _isUploading = false;
  bool _uploadDone = false;

  late AnimationController _animController;
  late Animation<double> _scaleAnim;
  late Animation<double> _fadeAnim;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnim = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.elasticOut),
    );

    _fadeAnim = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _animController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _isUploading = true;
        _uploadDone = false;
        _selectedImage = null;
      });

      // Simulate upload delay with animation
      await Future.delayed(const Duration(milliseconds: 1200));

      setState(() {
        _selectedImage = File(pickedFile.path);
        _isUploading = false;
        _uploadDone = true;
      });

      _animController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    Color textColor = isDarkMode ? Colors.white : AppColors.blackColor;
    Color appBarBg = isDarkMode ? Colors.grey[900]! : AppColors.whiteColor;
    Color hintColor = isDarkMode ? Colors.white70 : AppColors.profilesetting;
    Color borderColor = AppColors.createevnt;

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: appBarBg,
        iconTheme: IconThemeData(color: textColor),
        leading: const Icon(Icons.arrow_back),
        title: Text(
          "Vote",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(31),

            // ── Question Label ──
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Question",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social,",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  ),
                ),
              ),
            ),
            const Gap(24),

            // ── Options Label ──
            Padding(
              padding: const EdgeInsets.only(right: 320),
              child: Text(
                "Options",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Option 1",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  ),
                ),
              ),
            ),
            const Gap(18),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Option 2",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 2),
                  ),
                ),
              ),
            ),
            const Gap(24),

            // ── Upload Image Label ──
            Padding(
              padding: const EdgeInsets.only(right: 275),
              child: Text(
                "Upload Image",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            const Gap(6),

            // ── Animated Upload Container ──
            GestureDetector(
              onTap: _pickImage, // Click anywhere on container to upload
              child: Padding(
                padding: const EdgeInsets.only(right: 229),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _selectedImage != null ? 160 : 127,
                  width: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _uploadDone
                          ? Colors.green
                          : _isUploading
                          ? AppColors.primaryColor
                          : borderColor,
                      width: _isUploading ? 2.5 : 1.5,
                    ),
                    color: _isUploading
                        ? AppColors.primaryColor.withOpacity(0.05)
                        : Colors.transparent,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9),
                    child: _isUploading
                        // ── Loading State ──
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 32,
                                width: 32,
                                child: CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                  strokeWidth: 2.5,
                                ),
                              ),
                              const Gap(8),
                              Text(
                                "Uploading...",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )
                        : _selectedImage != null
                        // ── Image Selected State (animated) ──
                        ? ScaleTransition(
                            scale: _scaleAnim,
                            child: FadeTransition(
                              opacity: _fadeAnim,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.file(
                                    _selectedImage!,
                                    fit: BoxFit.cover,
                                  ),
                                  // Green check overlay
                                  Positioned(
                                    top: 6,
                                    right: 6,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: const BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                  // Tap to change overlay
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      color: Colors.black45,
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: Text(
                                        "Tap to change",
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        // ── Default/Idle State ──
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TweenAnimationBuilder<double>(
                                tween: Tween(begin: 0.0, end: 1.0),
                                duration: const Duration(milliseconds: 400),
                                builder: (context, value, child) =>
                                    Opacity(opacity: value, child: child),
                                child: Icon(
                                  Icons.file_upload_outlined,
                                  color: textColor,
                                  size: 28,
                                ),
                              ),
                              Text(
                                "Upload",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: hintColor,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ),

            const Gap(24),

            // ── Vote Button ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                  child: Text(
                    "Vote",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }
}
