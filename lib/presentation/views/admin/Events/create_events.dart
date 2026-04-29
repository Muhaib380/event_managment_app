import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/infrastructure/services/cloudnary.dart';
import 'package:event_managment_app/infrastructure/services/event.dart';
import 'package:event_managment_app/infrastructure/services/image_piker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class CreateEventAdmin extends StatefulWidget {
  const CreateEventAdmin({super.key});

  @override
  State<CreateEventAdmin> createState() => _CreateEventAdminState();
}

class _CreateEventAdminState extends State<CreateEventAdmin> {
  TextEditingController titleController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController eventDetailsController = TextEditingController();
  String? imageUrl;
  final CloudinaryService _cloudinaryService = CloudinaryService();
  final ImagePickerService _picker = ImagePickerService();
  bool isLoading = false;
  bool isUploading = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  /// Combine date and time into single DateTime
  DateTime get finalDateTime => DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    selectedTime.hour,
    selectedTime.minute,
  );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // ✅ Dynamic colors — dark mode mein auto change honge
    final textColor = isDark ? Colors.white : AppColors.blackColor;
    final hintColor = isDark ? Colors.white70 : AppColors.profilesetting;
    final borderColor = isDark ? Colors.white38 : AppColors.createevnt;
    final bgColor = isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor;
    final appBarColor = isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: Icon(Icons.arrow_back, color: textColor),
        title: Text(
          "Create Event",
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
            Padding(
              padding: const EdgeInsets.only(right: 340),
              child: Text(
                "Title",
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
                controller: titleController,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social,",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
            ),
            Gap(37),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 145),
                      child: Text(
                        "Date",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                    ),
                    Gap(6),
                    SizedBox(
                      width: 188,
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: textColor),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: borderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: borderColor),
                                ),
                                hint: Text(
                                  DateFormat.yMd().format(selectedDate),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: hintColor,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      firstDate: DateTime(2020),
                                      lastDate: DateTime(2030),
                                    ).then((value) {
                                      setState(() {
                                        selectedDate = value!;
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.date_range_sharp,
                                    color: hintColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Gap(10),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 132),
                      child: Text(
                        "Time",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: textColor,
                        ),
                      ),
                    ),
                    Gap(6),
                    SizedBox(
                      width: 188,
                      height: 56,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: textColor),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: borderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(color: borderColor),
                                ),
                                hint: Text(
                                  selectedTime.format(context).toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: hintColor,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      setState(() {
                                        selectedTime = value!;
                                      });
                                    });
                                  },
                                  icon: Icon(
                                    Icons.access_time,
                                    color: hintColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(24),
            Padding(
              padding: const EdgeInsets.only(right: 325),
              child: Text(
                "Location",
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
                controller: locationController,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: hintColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
            ),
            Gap(24),
            Padding(
              padding: const EdgeInsets.only(right: 300),
              child: Text(
                "Event Detail",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ),
            Gap(6),
            TextFormField(
              controller: eventDetailsController,
              decoration: InputDecoration(hintText: "Event Detail"),
              maxLines: 4,
            ),

            Gap(24),
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
            Gap(6),
            Padding(
              padding: const EdgeInsets.only(right: 229),
              child: InkWell(
                onTap: () async {
                  setState(() => isUploading = true);
                  try {
                    final url = await _picker.pickAndUploadImage();
                    if (url != null) {
                      setState(() {
                        imageUrl = url;
                        isUploading = false;
                      });
                    } else {
                      setState(() => isUploading = false);
                    }
                  } catch (e) {
                    setState(() => isUploading = false);
                    if (mounted) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  }
                },
                child: Container(
                  height: 127,
                  width: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: borderColor, width: 1.5),
                    color: bgColor,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: imageUrl != null && imageUrl!.isNotEmpty
                        ? const Icon(Icons.check, size: 40, color: Colors.green)
                        : isUploading
                        ? const CircularProgressIndicator(
                            color: Color(0xff505050),
                            strokeWidth: 0.8,
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                color: textColor,
                                size: 40,
                              ),
                              const SizedBox(height: 8),
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
            Gap(70),
            SizedBox(
              height: 56,
              width: 400,
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      onPressed: () async {
                        if (titleController.text.isEmpty ||
                            locationController.text.isEmpty ||
                            eventDetailsController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Please fill all the fields"),
                            ),
                          );
                          return;
                        }
                        if (selectedTime == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please select date and time"),
                            ),
                          );
                        }
                        if (imageUrl == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Please upload an image")),
                          );
                        }
                        try {
                          isLoading = true;
                          setState(() {});
                          EventServices()
                              .createEvent(
                                EventModel(
                                  title: titleController.text,
                                  dateTime: finalDateTime,
                                  location: locationController.text,
                                  eventdetails: eventDetailsController.text,
                                  image: imageUrl,
                                  createAt:
                                      DateTime.now().millisecondsSinceEpoch,
                                ),
                              )
                              .then((val) {
                                isLoading = false;
                                setState(() {});
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Event created successfully"),
                                  ),
                                );
                                Navigator.pop(context);
                              });
                        } catch (e) {
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                      child: Text(
                        "Create Event",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
            ),
            Gap(38),
          ],
        ),
      ),
    );
  }
}
