import 'package:event_managment_app/configurations/app_colors.dart';
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
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 390,
                height: 172,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor, width: 1.5),
                  color: bgColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Lectus viverra fermentum natoque nibh enim aliquam tincidunt eu purus. Non habitasse sed feugiat aliquet tortor. Risus turpis quam est quam leo turpis ipsum. Amet non sed lacus placerat turpis in. Vitae amet sit sed dictum eget scelerisque massa nibh.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: hintColor,
                    ),
                  ),
                ),
              ),
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
              child: Container(
                height: 127,
                width: 154,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: borderColor, width: 1.5),
                  color: bgColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.file_upload_outlined,
                        color: textColor,
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
            Gap(70),
            SizedBox(
              height: 56,
              width: 400,
              child: ElevatedButton(
                onPressed: () {},
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