import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDay = DateTime.utc(2025, 9, 2);
  DateTime? _selectedDay = DateTime.utc(2025, 9, 2);
  bool isCalendarView = true;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
        elevation: 0,
        title: Text(
        "Events",
        style: GoogleFonts.poppins(
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: isDark ? Colors.white : AppColors.blackColor,
        ),),
        actions: [
        IconButton(
        icon: Icon(
        Icons.tune_outlined,
        color: isDark ? Colors.white : Colors.black,
        ),
         onPressed: () {
         showDialog(
         context: context,
         builder: (context) {
         List<String> selectedFilters = [];
         String? selectedCity;
         String? selectedState;
         String? selectedGroup;
         return StatefulBuilder(
         builder: (context, setState) {
         return Dialog(
           backgroundColor:
            isDark ? const Color(0xFF1E1E1E) : Colors.white,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
            child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
            child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            // HEADER
            Row(
            children: [
            GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
            Icons.close,
            color: isDark
            ? Colors.white
            : Colors.black,
          ),
          ),
            const SizedBox(width: 69),
            Text(
            "Filter Events",
            style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: isDark
            ? Colors.white
            : Colors.black,),),
          ],),
            const SizedBox(height: 16),
              // CITY
            dropdown(
             "City",
             ["Karachi", "Lahore", "Islamabad"],
             selectedCity,
             (val) =>
             setState(() => selectedCity = val),
             isDark,
          ),
             const SizedBox(height: 12),
              // STATE
             dropdown(
             "State",
             ["Punjab", "Sindh", "KPK"],
             selectedState,
                (val) =>
             setState(() => selectedState = val),
              isDark,
          ),
             const SizedBox(height: 12),
              // GROUP
             dropdown(
             "Groups",
              ["A", "B", "C"],
             selectedGroup,
               (val) =>
             setState(() => selectedGroup = val),
             isDark,
          ),
             const SizedBox(height: 16),
              // CHIPS
             Wrap(
             spacing: 8,
             runSpacing: 8,
             children: [
             chip(
             "Religious1",
             "Religious",
             FontAwesomeIcons.starAndCrescent,
             selectedFilters,
             setState,
             isDark,
          ),
              chip(
             "Business",
             "Business",
             FontAwesomeIcons.building,
             selectedFilters,
             setState,
             isDark,
          ),
             chip(
             "Religious2",
             "Religious",
             FontAwesomeIcons.personRunning,
             selectedFilters,
             setState,
             isDark,
          ),
             chip(
             "Education",
             "Education",
             FontAwesomeIcons.graduationCap,
             selectedFilters,
             setState,
             isDark,
             ),
             chip(
             "Community",
             "Community",
             FontAwesomeIcons.peopleGroup,
             selectedFilters,
             setState,
             isDark,
          ),
          ],),
             const SizedBox(height: 16),
              // BUTTONS
             Row(
             children: [
             Expanded(
             child: ElevatedButton(
             style: ElevatedButton.styleFrom(
             backgroundColor: Colors.transparent,
             elevation: 0,
             side: BorderSide(
             color: isDark
             ? Colors.white38
             : Colors.grey,
          ),),
             onPressed: () {
             setState(() {
             selectedFilters.clear();
             selectedCity = null;
              selectedState = null;
             selectedGroup = null;
          });
          },
             child: Text(
             "Clear",
             style: GoogleFonts.poppins(
             color: isDark
             ? Colors.white
             : Colors.black,),),
          ),
          ),
             const SizedBox(width: 10),
             Expanded(
             child: ElevatedButton(
             style: ElevatedButton.styleFrom(
             backgroundColor:
             AppColors.primaryColor,
          ),
             onPressed: () =>
             Navigator.pop(context),
             child: Text(
             "Apply",
             style: GoogleFonts.poppins(
             color: Colors.white,),),
          ),
          ),
          ],),
          ],),
          ),
          ),
          );
          },
          );
          },
          );},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(10),

            // TOGGLE
            Container(
             height: 56,
             color: isDark ? const Color(0xFF1E1E1E) : AppColors.listtile,
             child: Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
             toggle("Calendar View", true, isDark),
             const Gap(40),
             toggle("List View", false, isDark),
          ],),
          ),
             const Gap(20),

             if (isCalendarView) ...[
             Padding(
             padding: const EdgeInsets.all(16),
             child: TableCalendar(
             firstDay: DateTime.utc(2020, 1, 1),
             lastDay: DateTime.utc(2030, 12, 31),
             focusedDay: _focusedDay,
             selectedDayPredicate: (day) =>
             isSameDay(_selectedDay, day),
             onDaySelected: (s, f) {
             setState(() {
             _selectedDay = s;
             _focusedDay = f;
          });
          },
             headerStyle: HeaderStyle(
             formatButtonVisible: false,
             titleCentered: true,
             leftChevronIcon: Icon(
             Icons.chevron_left,
             color: isDark ? Colors.white : Colors.black,
          ),
             rightChevronIcon: Icon(
             Icons.chevron_right,
             color: isDark ? Colors.white : Colors.black,
          ),
          ),
             calendarStyle: CalendarStyle(
             defaultTextStyle: TextStyle(
             color: isDark ? Colors.white : Colors.black,
          ),
             weekendTextStyle: TextStyle(
             color: isDark ? Colors.white70 : Colors.black,
          ),
             outsideTextStyle: const TextStyle(color: Colors.grey),
             selectedDecoration: BoxDecoration(
             color: AppColors.primaryColor,
             shape: BoxShape.circle,
          ),
             todayDecoration: BoxDecoration(
             color: AppColors.primaryColor.withOpacity(0.3),
             shape: BoxShape.circle,
          ),
          ),
          ),
          ),
             const Gap(24),
              // CARD 1
             Container(
              width: 392,
              height: 200,
              decoration: BoxDecoration(
              color: isDark
              ? const Color(0xFF1E1E1E)
              : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor),
          ),
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
              color: isDark
              ? Colors.white
              : AppColors.blackColor,
          ),),
              subtitle: Text(
              "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
              style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark
              ? Colors.white70
              : AppColors.homesub,
          ),),
              trailing: Icon(
              Icons.favorite_border,
              color: isDark ? Colors.white70 : Colors.grey,
          ),
          ),
              ListTile(
              leading: Icon(
              Icons.location_on,
              color: AppColors.primaryColor,
          ),
              title: Text(
              "2464 Royal Ln. Mesa, New Jersey 45463",
              style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark
              ? Colors.white
              : AppColors.blackColor,
          )),
          ),
              Padding(
              padding: const EdgeInsets.only(right: 165),
              child: SizedBox(
              width: 190,
              height: 45,
              child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              elevation: 2,
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
          ),),
              child: Text(
              "Add to my calendar",
              style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
          ),),
          ),
          ),
          ),
          ],),
          ),
              const Gap(16),

              // CARD 2
              Container(
              width: 392,
              height: 200,
              decoration: BoxDecoration(
              color: isDark
              ? const Color(0xFF1E1E1E)
              : AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.borderColor),
          ),
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
              color: isDark
              ? Colors.white
              : AppColors.blackColor,
          ),),
              subtitle: Text(
              "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
              style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark
              ? Colors.white70
              : AppColors.homesub,
          ),),
              trailing: Icon(
              Icons.favorite_border,
              color: isDark ? Colors.white70 : Colors.grey,
          ),
          ),
              ListTile(
              leading: Icon(
              Icons.location_on,
              color: AppColors.primaryColor,
          ),
              title: Text(
              "2464 Royal Ln. Mesa, New Jersey 45463",
              style: GoogleFonts.poppins(
              fontSize: 14,
              color: isDark
              ? Colors.white
              : AppColors.blackColor,
          ),),
          ),
                Padding(
                padding: const EdgeInsets.only(right: 165),
                child: SizedBox(
                width: 190,
                height: 45,
                child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                ),
                ),
                child: Text(
                "Add to my calendar",
                style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                    ),
                  ),
                ),
                ),
                ),
              ],
              ),
              ),
              const Gap(30),

            ] else ...[
              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
               children: [
                _buildListCard(isDark),
                const Gap(16),
                    _buildListCard(isDark),
                  ],
                ),
              ),
              const Gap(30),
            ],
          ],
        ),
      ),
    );
  }

  // new helper method — List View card
  Widget _buildListCard(bool isDark) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
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
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
            subtitle: Text(
              "Wed, 5 Nov 2025, 2:00PM - 3:00PM",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isDark ? Colors.white70 : AppColors.homesub,
              ),
            ),
            trailing: Icon(
              Icons.favorite_border,
              color: isDark ? Colors.white70 : Colors.grey,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: AppColors.primaryColor,
            ),
            title: Text(
            "2464 Royal Ln. Mesa, New Jersey 45463",
            style: GoogleFonts.poppins(
            fontSize: 14,
            color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 165),
            child: SizedBox(
            width: 190,
            height: 45,
            child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            ),),
            child: Text(
            "Add to my calendar",
            style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.white,
            ),),
            ),
            ),
          ),
        ],
      ),
    );
  }

      Widget chip(
      String key,
      String label,
      dynamic icon,
      List<String> selected,
      StateSetter setState,
      bool isDark,
      ) {
      return ChoiceChip(
      showCheckmark: false,
      selected: selected.contains(key),
      label: Text(
      label,
      style: TextStyle(
      color: selected.contains(key)
      ? Colors.white
      : (isDark ? Colors.white70 : Colors.black),
        ),
      ),
      avatar: icon is IconData
      ? Icon(
      icon,
      size: 16,
      color: selected.contains(key) ? Colors.white : Colors.grey,
      )
      : FaIcon(
      icon,
      size: 16,
      color: selected.contains(key) ? Colors.white : Colors.grey,
      ),
      selectedColor: AppColors.primaryColor,
      onSelected: (v) {
      setState(() {
      v ? selected.add(key) : selected.remove(key);
      });
      },
    );
  }

      Widget toggle(String text, bool value, bool isDark) {
      return GestureDetector(
      onTap: () => setState(() => isCalendarView = value),
      child: Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
      color: isCalendarView == value
      ? AppColors.primaryColor
      : Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
      child: Text(
      text,
      style: TextStyle(
      color: isCalendarView == value
      ? Colors.white
      : (isDark ? Colors.white70 : Colors.grey),
      ),
      ),
      ),
      ),
    );
  }

      Widget dropdown(
      String title,
      List<String> items,
      String? value,
      Function(String?) onChanged,
      bool isDark,
      ) {
      return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
      title,
      style: TextStyle(
      color: isDark ? Colors.white : Colors.black,
      ),
      ),
      const SizedBox(height: 6),
      SizedBox(
      height: 46,
      width: double.infinity,
      child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
      value: value,
      isExpanded: true,
      dropdownColor:
      isDark ? const Color(0xFF1E1E1E) : Colors.white,
      icon: Icon(
      Icons.keyboard_arrow_down,
      color: isDark ? Colors.white : Colors.black,
      ),
      items: items
      .map(
      (e) => DropdownMenuItem(
      value: e,
      child: Text(
      e,
      style: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: 14,
                      ),
                    ),
                  ),
                )
                    .toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
      ],
    );
  }
}