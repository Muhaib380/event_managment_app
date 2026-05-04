import 'dart:io';
import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/user.dart';
import 'package:event_managment_app/infrastructure/services/cloudnary.dart';
import 'package:event_managment_app/infrastructure/services/user.dart';
import 'package:event_managment_app/presentation/views/Provider/Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:event_managment_app/infrastructure/services/image_piker.dart';
import 'package:provider/provider.dart';

class EditDetailsAdmin extends StatefulWidget {
  const EditDetailsAdmin({super.key});

  @override
  State<EditDetailsAdmin> createState() => _EditDetailsAdminState();
}

class _EditDetailsAdminState extends State<EditDetailsAdmin> {
  late TextEditingController usernameController;

  File? _pickedImage;
  String? profileImageUrl;
  bool isUploading = false;
  bool isLoading = false;

  final CloudinaryService _cloudinaryService = CloudinaryService();
  final UserServices _userServices = UserServices();
  final ImagePickerService _imagePicker = ImagePickerService();

  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final user = userProvider.getUser();
    usernameController = TextEditingController(text: user.userName ?? "");
    profileImageUrl = user.profileImage;
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  // ── Bottom Sheet ────────────────────────────────────────────
  void pickAndUploadImage() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Select Image Source",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.blue),
                title: const Text("Camera"),
                onTap: () async {
                  Navigator.pop(context);
                  File? imageFile = await _imagePicker.pickFromCamera();
                  if (imageFile != null) await uploadImageFile(imageFile);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.green),
                title: const Text("Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  File? imageFile = await _imagePicker.pickFromGallery();
                  if (imageFile != null) await uploadImageFile(imageFile);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // ── Cloudinary Upload + Firestore Save ──────────────────────
  Future<void> uploadImageFile(File imageFile) async {
    setState(() {
      _pickedImage = imageFile;
      isUploading = true;
    });

    String? url = await _cloudinaryService.uploadImage(imageFile);

    if (url != null) {
      setState(() {
        profileImageUrl = url;
        isUploading = false;
      });

      await _userServices.mergeData(
        UserModel(docId: userId, profileImage: url),
      );

      UserModel updatedUser = await _userServices.getUserProfile(userId);
      if (mounted) {
        Provider.of<UserProvider>(context, listen: false).setUser(updatedUser);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Profile Image Updated")));
      }
    } else {
      setState(() => isUploading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        title: Text(
          "Edit Detail",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: sw * 0.04,
            color: isDark ? Colors.white : AppColors.blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(sh * 0.035),

            // ── Profile Image ───────────────────────────────────
            Center(
              child: Stack(
                children: [
                  Container(
                    height: sw * 0.35,
                    width: sw * 0.35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black12.withOpacity(0.1),
                        width: 2,
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: _pickedImage != null
                            ? FileImage(_pickedImage!) as ImageProvider
                            : profileImageUrl != null
                            ? NetworkImage(profileImageUrl!)
                            : const AssetImage("assets/images/tech_metup.png"),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: pickAndUploadImage,
                      child: Container(
                        padding: EdgeInsets.all(sw * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: isUploading
                            ? SizedBox(
                                height: sw * 0.045,
                                width: sw * 0.045,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 0.6,
                                  color: Colors.white,
                                ),
                              )
                            : Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: sw * 0.05,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Gap(sh * 0.05),

            // ── Username Label ──────────────────────────────────
            Padding(
              padding: EdgeInsets.only(left: sw * 0.05),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Username",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: sw * 0.035,
                    color: isDark ? Colors.white : AppColors.blackColor,
                  ),
                ),
              ),
            ),

            Gap(sh * 0.009),

            // ── Username Field ──────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
              child: TextField(
                controller: usernameController,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                  fontSize: sw * 0.038,
                ),
                decoration: InputDecoration(
                  hintText: "Mack_tor",
                  hintStyle: TextStyle(
                    color: isDark ? Colors.white54 : Colors.grey,
                    fontSize: sw * 0.035,
                  ),
                  fillColor: isDark ? const Color(0xFF2A2A2A) : Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.profilesetting),
                  ),
                ),
              ),
            ),

            Gap(sh * 0.07),

            // ── Save Changes Button ─────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
              child: SizedBox(
                width: double.infinity,
                height: sh * 0.07,
                child: isLoading || isUploading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () async {
                          try {
                            setState(() => isLoading = true);

                            // ✅ Directly Firebase UID — null ka koi chance nahi
                            await _userServices.mergeData(
                              UserModel(
                                docId: userId,
                                userName: usernameController.text.trim(),
                              ),
                            );

                            UserModel updatedUser = await _userServices
                                .getUserProfile(userId);
                            userProvider.setUser(updatedUser);

                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Profile Updated Successfully!",
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
                          } finally {
                            setState(() => isLoading = false);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          "Save Changes",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: sw * 0.04,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
              ),
            ),

            Gap(sh * 0.04),
          ],
        ),
      ),
    );
  }
}
