import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  List<String> selectedFilters = [];
  String? selectedCity;
  String? selectedState;
  String? selectedGroup;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(width: 69),
                  Text(
                    "Filter Events",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // CITY
              _dropdown(
                "City",
                ["Karachi", "Lahore", "Islamabad"],
                selectedCity,
                (val) => setState(() => selectedCity = val),
                isDark,
              ),
              const SizedBox(height: 12),

              // STATE
              _dropdown(
                "State",
                ["Punjab", "Sindh", "KPK"],
                selectedState,
                (val) => setState(() => selectedState = val),
                isDark,
              ),
              const SizedBox(height: 12),

              // GROUP
              _dropdown(
                "Groups",
                ["A", "B", "C"],
                selectedGroup,
                (val) => setState(() => selectedGroup = val),
                isDark,
              ),
              const SizedBox(height: 16),

              // CHIPS
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _chip(
                    "Religious1",
                    "Religious",
                    FontAwesomeIcons.starAndCrescent,
                    isDark,
                  ),
                  _chip(
                    "Business",
                    "Business",
                    FontAwesomeIcons.building,
                    isDark,
                  ),
                  _chip(
                    "Religious2",
                    "Religious",
                    FontAwesomeIcons.personRunning,
                    isDark,
                  ),
                  _chip(
                    "Education",
                    "Education",
                    FontAwesomeIcons.graduationCap,
                    isDark,
                  ),
                  _chip(
                    "Community",
                    "Community",
                    FontAwesomeIcons.peopleGroup,
                    isDark,
                  ),
                ],
              ),
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
                          color: isDark ? Colors.white38 : Colors.grey,
                        ),
                      ),
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
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Apply",
                        style: GoogleFonts.poppins(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _chip(String key, String label, dynamic icon, bool isDark) {
    return ChoiceChip(
      showCheckmark: false,
      selected: selectedFilters.contains(key),
      label: Text(
        label,
        style: TextStyle(
          color: selectedFilters.contains(key)
              ? Colors.white
              : (isDark ? Colors.white70 : Colors.black),
        ),
      ),
      avatar: icon is IconData
          ? Icon(
              icon,
              size: 16,
              color: selectedFilters.contains(key) ? Colors.white : Colors.grey,
            )
          : FaIcon(
              icon,
              size: 16,
              color: selectedFilters.contains(key) ? Colors.white : Colors.grey,
            ),
      selectedColor: AppColors.primaryColor,
      onSelected: (v) {
        setState(() {
          v ? selectedFilters.add(key) : selectedFilters.remove(key);
        });
      },
    );
  }

  Widget _dropdown(
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
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
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
                dropdownColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
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
