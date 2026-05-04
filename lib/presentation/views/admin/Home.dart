import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/admin/EventRepository/eventRepository.dart';
import 'package:event_managment_app/presentation/views/admin/filter_diolog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePageAdmin extends StatefulWidget {
  const HomePageAdmin({super.key});

  @override
  State<HomePageAdmin> createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay = DateTime.now();
  bool isCalendarView = true;

  List<EventModel> get _selectedDayEvents {
    if (_selectedDay == null) return [];
    return EventsRepository.getEventsForDay(_selectedDay!);
  }

  String get _eventsSectionTitle {
    final now = DateTime.now();
    if (_selectedDay != null &&
        _selectedDay!.year == now.year &&
        _selectedDay!.month == now.month &&
        _selectedDay!.day == now.day) {
      return "Today Events";
    }
    return DateFormat('d MMM yyyy').format(_selectedDay ?? now) + " Events";
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // ✅ Responsive helpers
    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: isDark ? const Color(0xFF121212) : Colors.white,
        elevation: 0,
        title: Text(
          "Events",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: sw * 0.045, // ✅ was 18
            color: isDark ? Colors.white : AppColors.blackColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.tune_outlined,
              color: isDark ? Colors.white : Colors.black,
              size: sw * 0.06, // ✅ responsive icon size
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const FilterDialog(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Gap(sh * 0.012), // ✅ was Gap(10)
            // ── TOGGLE ──────────────────────────────────────────
            Container(
              height: sh * 0.07, // ✅ was 56
              color: isDark ? const Color(0xFF1E1E1E) : AppColors.listtile,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  toggle("Calendar View", true, isDark, sw, sh),
                  Gap(sw * 0.1), // ✅ was Gap(40)
                  toggle("List View", false, isDark, sw, sh),
                ],
              ),
            ),

            Gap(sh * 0.025), // ✅ was Gap(20)

            if (isCalendarView) ...[
              // ── CALENDAR ───────────────────────────────────────
              Padding(
                padding: EdgeInsets.all(sw * 0.04), // ✅ was 16
                child: TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selected, focused) {
                    setState(() {
                      _selectedDay = selected;
                      _focusedDay = focused;
                    });
                  },
                  onPageChanged: (focusedDay) {
                    setState(() => _focusedDay = focusedDay);
                  },
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: sw * 0.04, // ✅ was 16
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left,
                      color: isDark ? Colors.white : Colors.black,
                      size: sw * 0.06,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right,
                      color: isDark ? Colors.white : Colors.black,
                      size: sw * 0.06,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    defaultTextStyle: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontSize: sw * 0.033,
                    ),
                    weekendTextStyle: TextStyle(
                      color: isDark ? Colors.white70 : Colors.black,
                      fontSize: sw * 0.033,
                    ),
                    outsideTextStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: sw * 0.033,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    todayTextStyle: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: sw * 0.033,
                    ),
                  ),
                ),
              ),

              Gap(sh * 0.01), // ✅ was Gap(8)
              // ✅ "Today Events" / "Date Events" HEADING
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _eventsSectionTitle,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: sw * 0.045, // ✅ was 18
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              Gap(sh * 0.015), // ✅ was Gap(12)
              // ✅ DYNAMIC EVENT CARDS
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                child: _selectedDayEvents.isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: sh * 0.04),
                          child: Text(
                            "No events for this day",
                            style: GoogleFonts.poppins(
                              fontSize: sw * 0.035,
                              color: isDark ? Colors.white54 : Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: _selectedDayEvents
                            .map(
                              (event) => Padding(
                                padding: EdgeInsets.only(bottom: sh * 0.02),
                                child: _buildEventCard(event, isDark, sw, sh),
                              ),
                            )
                            .toList(),
                      ),
              ),

              Gap(sh * 0.04), // ✅ was Gap(30)
            ] else ...[
              // ── LIST VIEW ──────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sw * 0.04),
                child: EventsRepository.getAllEvents().isEmpty
                    ? Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: sh * 0.04),
                          child: Text(
                            "No events created yet",
                            style: GoogleFonts.poppins(
                              fontSize: sw * 0.035,
                              color: isDark ? Colors.white54 : Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: EventsRepository.getAllEvents()
                            .map(
                              (event) => Padding(
                                padding: EdgeInsets.only(bottom: sh * 0.02),
                                child: _buildEventCard(event, isDark, sw, sh),
                              ),
                            )
                            .toList(),
                      ),
              ),
              Gap(sh * 0.04),
            ],
          ],
        ),
      ),
    );
  }

  // ✅ DYNAMIC EVENT CARD — responsive
  Widget _buildEventCard(EventModel event, bool isDark, double sw, double sh) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        children: [
          ListTile(
            leading: event.image != null && event.image!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      event.image!,
                      width: sw * 0.12, // ✅ was 50
                      height: sw * 0.12,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        AssetsConstants.tech_metup,
                        width: sw * 0.12,
                        height: sw * 0.12,
                      ),
                    ),
                  )
                : Image.asset(
                    AssetsConstants.tech_metup,
                    width: sw * 0.12,
                    height: sw * 0.12,
                  ),
            title: Text(
              event.title ?? "No Title",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: sw * 0.04, // ✅ was 16
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
            subtitle: Text(
              event.dateTime != null
                  ? DateFormat('EEE, d MMM yyyy, h:mma').format(event.dateTime!)
                  : "Date not set",
              style: GoogleFonts.poppins(
                fontSize: sw * 0.032, // ✅ was 14
                color: isDark ? Colors.white70 : AppColors.homesub,
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                setState(() {
                  event.isFavorite = !event.isFavorite;
                });
              },
              child: Icon(
                event.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: event.isFavorite
                    ? Colors.red
                    : (isDark ? Colors.white70 : Colors.grey),
                size: sw * 0.055,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on,
              color: AppColors.primaryColor,
              size: sw * 0.055,
            ),
            title: Text(
              event.location ?? "No location",
              style: GoogleFonts.poppins(
                fontSize: sw * 0.032,
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: sw * 0.04, bottom: sh * 0.015),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: sw * 0.48, // ✅ was 190
                height: sh * 0.055, // ✅ was 45
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
                      fontSize: sw * 0.032,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Toggle — responsive
  Widget toggle(String text, bool value, bool isDark, double sw, double sh) {
    return GestureDetector(
      onTap: () => setState(() => isCalendarView = value),
      child: Container(
        width: sw * 0.35, // ✅ was 140
        height: sh * 0.05, // ✅ was 40
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
              fontSize: sw * 0.035,
              color: isCalendarView == value
                  ? Colors.white
                  : (isDark ? Colors.white70 : Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
