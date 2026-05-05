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

  // ✅ Same Cloudinary Logic
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
        String? url = await _cloudinaryService.uploadImage(
          File(pickedFile.path),
        );

        if (url != null) {
          setState(() {
            ImageUrl = url;
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
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
        // ✅ Added global symmetric padding for responsiveness
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          // ✅ CrossAxisAlignment.start se har screen par naturally left align hoga
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: textColor,
              ),
            ),
            const Gap(8),
            TextField(
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

            const Gap(24),

            Text(
              "Options",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: textColor,
              ),
            ),
            const Gap(8),
            TextField(
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
            const Gap(18),
            TextField(
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

            const Gap(24),

            Text(
              "Upload Image",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: textColor,
              ),
            ),
            const Gap(8),
            GestureDetector(
              onTap: _pickImage,
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
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            )
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

            const Gap(32),

            SizedBox(
              height: 56,
              width: double.infinity, // ✅ Button har screen par full width lega
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
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        "Vote",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
              ),
            ),
            const Gap(20), // Bottom space
          ],
        ),
      ),
    );
  }
}
