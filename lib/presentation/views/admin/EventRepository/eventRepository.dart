// ─────────────────────────────────────────────────────────────────────────────
// ✅ Global shared events list
// CreateEventAdmin mein addEvent() call karo
// HomePageAdmin mein getEventsForDay() / getAllEvents() call karo
// ─────────────────────────────────────────────────────────────────────────────
import 'package:event_managment_app/infrastructure/models/event.dart';

class EventsRepository {
  static final List<EventModel> events = [];

  /// Naya event add karo (Create Event page se call hoga)
  static void addEvent(EventModel event) {
    events.add(event);
  }

  /// Kisi specific din ke events (Calendar view ke liye)
  static List<EventModel> getEventsForDay(DateTime day) {
    return events.where((e) {
      if (e.dateTime == null) return false;
      return e.dateTime!.year == day.year &&
          e.dateTime!.month == day.month &&
          e.dateTime!.day == day.day;
    }).toList();
  }

  /// Aaj ke events
  static List<EventModel> getTodayEvents() {
    return getEventsForDay(DateTime.now());
  }

  /// Saare events (List View ke liye)
  static List<EventModel> getAllEvents() {
    return List.unmodifiable(events);
  }
}
