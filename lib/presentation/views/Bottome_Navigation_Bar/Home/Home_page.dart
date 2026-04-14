import 'dart:math';

import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart'; // ADDED THIS IMPORT

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> itemList = ["Flutter","Web","UI/UX" ];
  String? SelectedItem;
  DateTime _focusedDay = DateTime.utc(2025, 9, 2);
  DateTime? _selectedDay = DateTime.utc(2025, 9, 2);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
          "Events",
          style: GoogleFonts.poppins(
             fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.blackColor,
        ),
        ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
              onPressed: () {
              showDialog(
              context: context,
              builder: (BuildContext context) {
              List<String> selectedFilters = [];
              String? selectedCity;
              String? selectedState;
              String? selectedGroup;
              return StatefulBuilder(
              builder: (context, setState) {
              return Dialog(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
        ),
              child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Row(
              children: [
              GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.close),
        ),
              SizedBox(width: 16),
              Text("Filter Events",
              style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.blackColor,
        ),),
        ],),
              SizedBox(height: 16),
              Align(
              alignment: Alignment.centerLeft,
              child: Text("City",
              style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
               color: AppColors.blackColor,),),
        ),
              SizedBox(height: 6),
              Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(8),
               ),
              child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
              value: selectedCity,
              hint: Text("Select City",
               style: GoogleFonts.poppins(
               fontSize: 14,
               color: Colors.grey,),),
              isExpanded: true,
              icon: Icon(Icons.keyboard_arrow_down),
              items: ["Karachi", "Lahore", "Islamabad", "Rawalpindi"]
               .map((city) => DropdownMenuItem(
                value: city,
                child: Text(city,
                style: GoogleFonts.poppins(fontSize: 14),),
                 )).toList(),
                onChanged: (value) {
               setState(() => selectedCity = value);
        },
        ),
        ),
        ),
                  SizedBox(height: 12),
                  Align(
                  alignment: Alignment.centerLeft,
                  child: Text("State",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.blackColor,),),
        ),
                  SizedBox(height: 6),
                  Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade400),
                  borderRadius: BorderRadius.circular(8),
        ),
                  child: DropdownButtonHideUnderline(
                   child: DropdownButton<String>(
                    value: selectedState,
                   hint: Text("Select City",
                    style: GoogleFonts.poppins(
                    fontSize: 14,
                   color: Colors.grey,),),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: ["Punjab", "Sindh", "KPK", "Balochistan"]
                    .map((state) => DropdownMenuItem(
                    value: state,
                    child: Text(state,
                    style: GoogleFonts.poppins(fontSize: 14),
                    ),
                    )).toList(),
                    onChanged: (value) {
                    setState(() => selectedState = value);
        },
        ),
        ),
        ),
                   SizedBox(height: 12),
                    Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Groups",
                    style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.blackColor,),),
        ),
                    SizedBox(height: 6),
                    Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                    value: selectedGroup,
                    hint: Text("Group",
                    style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey,),),
                    isExpanded: true,
                    icon: Icon(Icons.keyboard_arrow_down),
                    items: ["Group A", "Group B", "Group C"]
                    .map((group) => DropdownMenuItem(
                    value: group,
                    child: Text(group,
                    style: GoogleFonts.poppins(fontSize: 14),
                    ),)).toList(),
                    onChanged: (value) {
                    setState(() => selectedGroup = value);
        },
        ),
        ),
        ),
                    SizedBox(height: 16),
                    Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                    ChoiceChip(
                    showCheckmark: false,
                    label: Text("Religious",
                    style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: selectedFilters.contains("Religious1")
                    ? AppColors.whiteColor
                    : AppColors.blackColor,),),
                    selected: selectedFilters.contains("Religious1"),
                    selectedColor: AppColors.primaryColor,
                    backgroundColor: AppColors.whiteColor,
                    avatar: FaIcon(FontAwesomeIcons.starAndCrescent,
                    size: 16,
                    color: selectedFilters.contains("Religious1")
                    ? AppColors.whiteColor
                    : AppColors.diologbox,
        ),
                     shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(20),
                     side: BorderSide(
                     color: selectedFilters.contains("Religious1")
                     ? AppColors.primaryColor
                     : Colors.grey.shade400,
        ),
        ),
                      onSelected: (value) {
                      setState(() {
                      value
                      ? selectedFilters.add("Religious1")
                      : selectedFilters.remove("Religious1");
        });
        },
        ),
                      ChoiceChip(
                      showCheckmark: false,
                      label: Text("Business",
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: selectedFilters.contains("Business")
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                      ),),
                       selected: selectedFilters.contains("Business"),
                       selectedColor: AppColors.primaryColor,
                       backgroundColor: AppColors.whiteColor,
                       avatar: FaIcon(FontAwesomeIcons.building,
                       size: 16,
                       color: selectedFilters.contains("Business")
                       ? AppColors.whiteColor
                       : AppColors.diologbox,
        ),
                       shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                       side: BorderSide(
                       color: selectedFilters.contains("Business")
                       ? AppColors.primaryColor
                       : Colors.grey.shade400,
                       ),
                       ),
                       onSelected: (value) {
                       setState(() {
                       value
                       ? selectedFilters.add("Business")
                       : selectedFilters.remove("Business");
                       });
                       },
                      ),
                      ChoiceChip(
                      showCheckmark: false,
                      label: Text("Religious",
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: selectedFilters.contains("Religious2")
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                      ),
                      ),
                       selected: selectedFilters.contains("Religious2"),
                       selectedColor: AppColors.primaryColor,
                       backgroundColor: AppColors.whiteColor,
                       avatar: FaIcon(FontAwesomeIcons.personRunning,
                       size: 16,
                       color: selectedFilters.contains("Religious2")
                       ? AppColors.whiteColor
                       : AppColors.diologbox,
                       ),
                       shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                       side: BorderSide(
                       color: selectedFilters.contains("Religious2")
                       ? AppColors.primaryColor
                       : Colors.grey.shade400,
                       ),
                       ),
                       onSelected: (value) {
                       setState(() {
                       value
                       ? selectedFilters.add("Religious2")
                       : selectedFilters.remove("Religious2");
                       });
                       },
                      ),
                      ChoiceChip(
                      showCheckmark: false,
                      label: Text("Education",
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: selectedFilters.contains("Education")
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                       ),
                      ),
                      selected: selectedFilters.contains("Education"),
                      selectedColor: AppColors.primaryColor,
                      backgroundColor: AppColors.whiteColor,
                      avatar: FaIcon(FontAwesomeIcons.graduationCap,
                      size: 16,
                      color: selectedFilters.contains("Education")
                      ? AppColors.whiteColor
                      : AppColors.diologbox,
                       ),
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                      color: selectedFilters.contains("Education")
                      ? AppColors.primaryColor
                      :Colors.grey.shade400,
                       ),
                      ),
                      onSelected: (value) {
                      setState(() {
                      value
                      ? selectedFilters.add("Education")
                      : selectedFilters.remove("Education");
                      });
                      },
                      ),
                      ChoiceChip(
                      showCheckmark: false,
                      label: Text("Community",
                      style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: selectedFilters.contains("Community")
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                      ),
                      ),
                      selected: selectedFilters.contains("Community"),
                      selectedColor: AppColors.primaryColor,
                      backgroundColor: AppColors.whiteColor,
                      avatar: FaIcon(FontAwesomeIcons.peopleGroup,
                      size: 16,
                      color: selectedFilters.contains("Community")
                      ? AppColors.whiteColor
                      : AppColors.diologbox,
                      ),
                       shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(20),
                       side: BorderSide(
                       color: selectedFilters.contains("Community")
                       ? AppColors.primaryColor
                       : Colors.grey.shade400,
                       ),
                       ),
                       onSelected: (value) {
                       setState(() {
                       value
                       ? selectedFilters.add("Community")
                       : selectedFilters.remove("Community");
                        });
                       },
                      ),
                    ],
                    ),
                        SizedBox(height: 16),
                        Row(
                         children: [
                         Expanded(
                         child: SizedBox(
                         height: 48,
                         child: ElevatedButton(
                         onPressed: () {
                          setState(() {
                          selectedFilters.clear();
                          selectedCity = null;
                          selectedState = null;
                          selectedGroup = null;
                          });
                          },
                          style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          side: BorderSide(
                          color: AppColors.primaryColor,
                          width: 1.5,
                          ),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                          child: Text("Clear Filter",
                          style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.blackColor,
                          ),
                          ),
                         ),
                         ),
                         ),
                          SizedBox(width: 10),
                          Expanded(
                          child: SizedBox(
                          height: 48,
                          child: ElevatedButton(
                          onPressed: () {
                          Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                          ),
                          child: Text("Apply Filter",
                          style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.whiteColor,
                          ),
                          ),
                          ),
                          ),
                          ),
                         ],
                        ),
                        ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }, icon: Icon(Icons.tune_outlined, color: Colors.black)),
            )
          ],
        ),
      
        body: SingleChildScrollView(
            child: Column(
             children: [
              Gap(10),
              Center(
              child: Container(
              width: 392,
              height: 56,
              color: AppColors.listtile,
              child: Row(
              children: [
                 Container(
                 height: 44,
                 width: 152,
                 decoration: BoxDecoration(
                 color: AppColors.primaryColor,
                 border: Border.all(color: AppColors.primaryColor),
                 borderRadius: BorderRadius.circular(12),
              ),
                 child: Center(
                 child: Text(
                 "Calendar View",
                 style: GoogleFonts.poppins(
                 fontWeight: FontWeight.w600,
                 fontSize: 16,
                 color: AppColors.whiteColor),
              ),
              ),
              ),
                 Gap(92),
                 TextButton(
                 onPressed: () {},
                 child: Text(
                 "List View",
                 style: GoogleFonts.poppins(
                 fontWeight: FontWeight.w500,
                 fontSize: 14,
                 color: AppColors.grayColor),
              ))
              ],
              )),
              ),
                 Gap(20),
                 Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
                 child: TableCalendar(
                 firstDay: DateTime.utc(2020, 1, 1),
                 lastDay: DateTime.utc(2030, 12, 31),
                 focusedDay: _focusedDay,
                 selectedDayPredicate: (day) {
                 return isSameDay(_selectedDay, day);
              },
                 onDaySelected: (selectedDay, focusedDay) {
                 setState(() {
                 _selectedDay = selectedDay;
                 _focusedDay = focusedDay;
              });
              },
                 headerStyle: HeaderStyle(
                 formatButtonVisible: false,
                 titleCentered: true,
                 leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
                 rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
              ),
                 calendarStyle: CalendarStyle(
                 defaultTextStyle: TextStyle(color: Colors.white), // Texts ko white karein
                 selectedDecoration: BoxDecoration(
                 color: AppColors.primaryColor,
                 shape: BoxShape.circle,
              ),
                 todayDecoration: BoxDecoration(
                 color: AppColors.primaryColor.withOpacity(0.3),
                 shape: BoxShape.circle,
              ),
                 markerDecoration: BoxDecoration(
                 color: Colors.teal,
                 shape: BoxShape.circle,
              ),
              ),
              ),
              ),
                 Gap(24),
                 Container(
                 width: 392,
                 height: 188,
                 decoration: BoxDecoration(
                 color: AppColors.whiteColor,
                 borderRadius: BorderRadius.circular(12),
                 border: Border.all(color: AppColors.borderColor)),
                 child: Column(
                 children: [
                 ListTile(
                 leading: Image.asset(
                 AssetsConstants.tech_metup,
                 width: 50,
                 height: 46,
              ),
                 title: Text(
                 "Tech Meetup",
                 style: GoogleFonts.poppins(
                 fontWeight: FontWeight.w500,
                 fontSize: 16,
                 color: AppColors.blackColor),
              ),
                 subtitle: Text(
                 "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.homesub,
              ),
              ),
                  trailing: Icon(Icons.favorite_border, color: Colors.grey),
              ),
                  ListTile(
                  leading: Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
              ),
                  title: Text(
                  "2464 Royal Ln. Mesa, New Jersey 45463",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.blackColor),
              ),
              ),
                  Padding(
                  padding: const EdgeInsets.only(right: 165),
                  child: SizedBox(
                  width: 190,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
                  child: Text(
                  "Add to my calendar",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14, color: AppColors.whiteColor),
              )),
              ),
              )
              ],
              )),
                  Gap(16),
                  Container(
                  width: 392,
                  height: 188,
                  decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.borderColor)),
                  child: Column(
                  children: [
                  ListTile(
                  leading: Image.asset(
                  AssetsConstants.tech_metup,
                  width: 50,
                  height: 46,
              ),
                  title: Text(
                  "Tech Meetup",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.blackColor),
              ),
                  subtitle: Text(
                  "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.homesub,
              ),
              ),
                  trailing: Icon(Icons.favorite_border, color: Colors.grey),
              ),
                  ListTile(
                  leading: Icon(
                  Icons.location_on,
                  color: AppColors.primaryColor,
              ),
                  title: Text(
                  "2464 Royal Ln. Mesa, New Jersey 45463",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.blackColor),
              ),
              ),
                  Padding(
                  padding: const EdgeInsets.only(right: 165),
                  child: SizedBox(
                  width: 190,
                  height: 50,
                  child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
                  child: Text(
                  "Add to my calendar",
                  style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.whiteColor),
              )),
              ),
              )
              ],
              )),
                  Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}