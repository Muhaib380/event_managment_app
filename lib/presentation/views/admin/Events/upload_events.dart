import 'dart:io';
import 'package:event_managment_app/infrastructure/models/vote.dart';
import 'package:event_managment_app/infrastructure/services/cloudnary.dart';
import 'package:event_managment_app/infrastructure/services/image_piker.dart';
import 'package:event_managment_app/infrastructure/services/vote.dart';
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
  TextEditingController questionController = TextEditingController();
  TextEditingController option1Controller = TextEditingController();
  TextEditingController option2Controller = TextEditingController();
  final CloudinaryService _cloudinaryService = CloudinaryService();
  final ImagePickerService _imagePicker = ImagePickerService();
  String? ImageUrl;
  File? _selectedImage;
  bool isLoading = false;
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

  // ✅ UPDATED LOGIC: Ab ye Cloudinary par upload karega
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

      try {
        // Cloudinary se URL fetch karein
        String? url = await _cloudinaryService.uploadImage(
          File(pickedFile.path),
        );

        if (url != null) {
          setState(() {
            ImageUrl = url; // Yahan URL save ho gaya
            _selectedImage = File(pickedFile.path);
            _isUploading = false;
            _uploadDone = true;
          });
          _animController.forward(from: 0);
        } else {
          setState(() => _isUploading = false);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Upload failed!")));
        }
      } catch (e) {
        setState(() => _isUploading = false);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(e.toString())));
      }
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
            // UI Code same rakha hai
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
                controller: questionController,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social,",
                  hintStyle: TextStyle(color: hintColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 1.0),
                  ),
                ),
              ),
            ),
            const Gap(24),
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
                controller: option1Controller,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Option 1",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 1.0),
                  ),
                ),
              ),
            ),
            const Gap(18),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: option2Controller,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Option 2",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor, width: 1.0),
                  ),
                ),
              ),
            ),
            const Gap(24),
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
            GestureDetector(
              onTap: _pickImage,
              child: Padding(
                padding: const EdgeInsets.only(right: 229),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: _selectedImage != null ? 160 : 127,
                  width: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: _uploadDone ? Colors.green : borderColor,
                    ),
                  ),
                  child: _isUploading
                      ? const Center(child: CircularProgressIndicator())
                      : (_selectedImage != null
                            ? Image.file(_selectedImage!, fit: BoxFit.cover)
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.file_upload_outlined,
                                    color: textColor,
                                  ),
                                  const Gap(4),
                                  Text(
                                    "Upload",
                                    style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              )),
                ),
              ),
            ),
            const Gap(24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (ImageUrl == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please upload an image")),
                      );
                      return;
                    }
                    setState(() => isLoading = true);
                    try {
                      await VoteServices().createQuestion(
                        VoteModel(
                          question: questionController.text,
                          option: [
                            option1Controller.text,
                            option2Controller.text,
                          ],
                          image: ImageUrl!,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Question created successfully"),
                        ),
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    } finally {
                      setState(() => isLoading = false);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Vote",
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
