import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/infrastructure/models/event.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/admin/EventRepository/eventRepository.dart';
import 'package:event_managment_app/presentation/views/admin/filter_diolog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // ✅ pubspec mein add karo: intl
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

  // ✅ Selected day ke events EventsRepository se lao
  List<EventModel> get _selectedDayEvents {
    if (_selectedDay == null) return [];
    return EventsRepository.getEventsForDay(_selectedDay!);
  }

  // ✅ Heading text — aaj hai to "Today Events", warna selected date
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
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.tune_outlined,
              color: isDark ? Colors.white : Colors.black,
            ),
            onPressed: () {
              // ✅ Alag file se FilterDialog call ho raha hai
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
            const Gap(10),

            // ── TOGGLE ──────────────────────────────────────────
            Container(
              height: 56,
              color: isDark ? const Color(0xFF1E1E1E) : AppColors.listtile,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  toggle("Calendar View", true, isDark),
                  const Gap(40),
                  toggle("List View", false, isDark),
                ],
              ),
            ),

            const Gap(20),

            if (isCalendarView) ...[
              // ── CALENDAR ───────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(16),
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
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.black,
                    ),
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
                    todayTextStyle: TextStyle(
                      color: isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Gap(8),

              // ✅ "Today Events" / "Date Events" HEADING
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    _eventsSectionTitle,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: isDark ? Colors.white : AppColors.blackColor,
                    ),
                  ),
                ),
              ),

              const Gap(12),

              // ✅ DYNAMIC EVENT CARDS — EventsRepository se
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _selectedDayEvents.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Text(
                            "No events for this day",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: isDark ? Colors.white54 : Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: _selectedDayEvents
                            .map(
                              (event) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: _buildEventCard(event, isDark),
                              ),
                            )
                            .toList(),
                      ),
              ),

              const Gap(30),
            ] else ...[
              // ── LIST VIEW ──────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: EventsRepository.getAllEvents().isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 32),
                          child: Text(
                            "No events created yet",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: isDark ? Colors.white54 : Colors.grey,
                            ),
                          ),
                        ),
                      )
                    : Column(
                        children: EventsRepository.getAllEvents()
                            .map(
                              (event) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: _buildEventCard(event, isDark),
                              ),
                            )
                            .toList(),
                      ),
              ),
              const Gap(30),
            ],
          ],
        ),
      ),
    );
  }

  // ✅ DYNAMIC EVENT CARD — EventModel se data leta hai
  Widget _buildEventCard(EventModel event, bool isDark) {
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
                      width: 50,
                      height: 46,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Image.asset(
                        AssetsConstants.tech_metup,
                        width: 50,
                        height: 46,
                      ),
                    ),
                  )
                : Image.asset(
                    AssetsConstants.tech_metup,
                    width: 50,
                    height: 46,
                  ),
            title: Text(
              event.title ?? "No Title",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
            subtitle: Text(
              event.dateTime != null
                  ? DateFormat('EEE, d MMM yyyy, h:mma').format(event.dateTime!)
                  : "Date not set",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isDark ? Colors.white70 : AppColors.homesub,
              ),
            ),
            // ✅ Favorite toggle
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
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on, color: AppColors.primaryColor),
            title: Text(
              event.location ?? "No location",
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: isDark ? Colors.white : AppColors.blackColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 12),
            child: Align(
              alignment: Alignment.centerLeft,
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
          ),
        ],
      ),
    );
  }

  // ... toggle(), chip(), dropdown() same rahenge
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
}
