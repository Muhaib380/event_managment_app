import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/infrastructure/services/event.dart';
import 'package:event_managment_app/infrastructure/services/image_piker.dart';
import 'package:event_managment_app/presentation/views/admin/EventRepository/eventRepository.dart';
import 'package:event_managment_app/presentation/views/admin/Home.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final ImagePickerService _picker = ImagePickerService();
  bool isLoading = false;
  bool isUploading = false;

  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime get finalDateTime => DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    selectedTime.hour,
    selectedTime.minute,
  );

  String get formattedDateTime {
    final date = DateFormat("EEE, d MMM yyyy").format(selectedDate);
    final time = selectedTime.format(context);
    return "$date, $time";
  }

  @override
  void dispose() {
    titleController.dispose();
    locationController.dispose();
    eventDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(16),

              // ── Title ──────────────────────────────────────────────────
              Text(
                "Title",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              const Gap(6),
              TextField(
                controller: titleController,
                style: TextStyle(color: textColor),
                decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social",
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
              const Gap(24),

              // ── Date & Time ────────────────────────────────────────────
              Row(
                children: [
                  // DATE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                        const Gap(6),
                        TextField(
                          readOnly: true,
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
                            hintText: DateFormat.yMd().format(selectedDate),
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: textColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final picked = await showDatePicker(
                                  context: context,
                                  initialDate: selectedDate,
                                  firstDate: DateTime(2020),
                                  lastDate: DateTime(2030),
                                );
                                if (picked != null) {
                                  setState(() => selectedDate = picked);
                                }
                              },
                              icon: Icon(
                                Icons.date_range_sharp,
                                color: hintColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),

                  // TIME
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Time",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: textColor,
                          ),
                        ),
                        const Gap(6),
                        TextField(
                          readOnly: true,
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
                            hintText: selectedTime.format(context),
                            hintStyle: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: textColor,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () async {
                                final picked = await showTimePicker(
                                  context: context,
                                  initialTime: selectedTime,
                                );
                                if (picked != null) {
                                  setState(() => selectedTime = picked);
                                }
                              },
                              icon: Icon(Icons.access_time, color: hintColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Gap(24),

              // ── Location ───────────────────────────────────────────────
              Text(
                "Location",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              const Gap(6),
              TextField(
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
              const Gap(24),

              // ── Event Detail ───────────────────────────────────────────
              Text(
                "Event Detail",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              const Gap(6),
              TextFormField(
                controller: eventDetailsController,
                style: TextStyle(color: textColor),
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Describe the event...",
                  hintStyle: TextStyle(color: hintColor),
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
              const Gap(24),

              // ── Upload Image ───────────────────────────────────────────
              Text(
                "Upload Image",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: textColor,
                ),
              ),
              const Gap(6),
              InkWell(
                onTap: isUploading
                    ? null
                    : () async {
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
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())),
                            );
                          }
                        }
                      },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 127,
                  width: 154,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: imageUrl != null
                          ? Colors.green
                          : isUploading
                          ? AppColors.primaryColor
                          : borderColor,
                      width: isUploading ? 2 : 1.5,
                    ),
                    color: bgColor,
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: imageUrl != null && imageUrl!.isNotEmpty
                        ? Column(
                            key: const ValueKey("done"),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                size: 40,
                                color: Colors.green,
                              ),
                              const Gap(6),
                              Text(
                                "Uploaded!",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          )
                        : isUploading
                        ? Column(
                            key: const ValueKey("loading"),
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
                                ),
                              ),
                            ],
                          )
                        : Column(
                            key: const ValueKey("idle"),
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_upload_outlined,
                                color: textColor,
                                size: 40,
                              ),
                              const Gap(8),
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
              const Gap(40),

              // ── Create Event Button ────────────────────────────────────
              SizedBox(
                height: 56,
                width: double.infinity,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(
                        onPressed: () async {
                          // ── Validation ──────────────────────────────
                          if (titleController.text.trim().isEmpty ||
                              locationController.text.trim().isEmpty ||
                              eventDetailsController.text.trim().isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please fill all the fields"),
                              ),
                            );
                            return;
                          }
                          if (imageUrl == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Please upload an image"),
                              ),
                            );
                            return;
                          }

                          setState(() => isLoading = true);

                          try {
                            // ── 1. Firebase mein save karo ──────────
                            await EventServices().createEvent(
                              EventModel(
                                title: titleController.text.trim(),
                                dateTime: finalDateTime, // ✅ finalDateTime
                                location: locationController.text.trim(),
                                eventdetails: eventDetailsController.text
                                    .trim(),
                                image: imageUrl,
                                createAt: DateTime.now().millisecondsSinceEpoch,
                              ),
                            );

                            // ── 2. Local EventsRepository mein add karo ──
                            EventsRepository.addEvent(
                              EventModel(
                                docId: UniqueKey().toString(),
                                title: titleController.text.trim(),
                                dateTime:
                                    finalDateTime, // ✅ finalDateTime (time bhi include)
                                location: locationController.text.trim(),
                                image: imageUrl ?? "",
                                eventdetails: eventDetailsController.text
                                    .trim(),
                              ),
                            );

                            setState(() => isLoading = false);

                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text("Event created successfully ✅"),
                                ),
                              );

                              // ✅ pop ki jagah pushReplacement
                              // HomePageAdmin fresh build hoga
                              // naya event turant calendar mein dikh jayega
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const HomePageAdmin(),
                                ),
                              );
                            }
                          } catch (e) {
                            setState(() => isLoading = false);
                            if (mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())),
                              );
                            }
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
              const Gap(38),
            ],
          ),
        ),
      ),
    );
  }
}
