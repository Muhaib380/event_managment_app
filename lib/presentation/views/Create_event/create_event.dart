import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          "Create Event",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: AppColors.blackColor,
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
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Made in Melanin! Black History Month Social,",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.profilesetting,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: .circular(11),
                    borderSide: BorderSide(color: AppColors.createevnt),
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
                          color: AppColors.blackColor,
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: .circular(11),
                                  borderSide: BorderSide(
                                    color: AppColors.createevnt,
                                  ),
                                ),
                                hint: Text(
                                  DateFormat.yMd().format(selectedDate),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.profilesetting,
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
                                    color: AppColors.profilesetting,
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
                          color: AppColors.blackColor,
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
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: .circular(11),
                                  borderSide: BorderSide(
                                    color: AppColors.createevnt,
                                  ),
                                ),
                                hint: Text(
                                  selectedTime.format(context).toString(),
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: AppColors.profilesetting,
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
                                    color: AppColors.profilesetting,
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
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.profilesetting,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: .circular(11),
                    borderSide: BorderSide(color: AppColors.createevnt),
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
                  color: AppColors.blackColor,
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
                  border: Border.all(color: AppColors.createevnt, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Lectus viverra fermentum natoque nibh enim aliquam tincidunt eu purus. Non habitasse sed feugiat aliquet tortor. Risus turpis quam est quam leo turpis ipsum. Amet non sed lacus placerat turpis in. Vitae amet sit sed dictum eget scelerisque massa nibh.",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.profilesetting,
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
                  color: AppColors.blackColor,
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
                  border: Border.all(color: AppColors.createevnt, width: 1.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.file_upload_outlined),
                    ),
                    Text(
                      "Uplaod",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: AppColors.profilesetting,
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
                  shape: RoundedRectangleBorder(borderRadius: .circular(11)),
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
