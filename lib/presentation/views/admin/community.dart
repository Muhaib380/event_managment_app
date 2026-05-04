import 'package:event_managment_app/configurations/app_colors.dart';
import 'package:event_managment_app/presentation/constants/assets_constants.dart';
import 'package:event_managment_app/presentation/views/Group_profile/group_profile.dart';
import 'package:event_managment_app/presentation/views/admin/Events/create_events.dart';
import 'package:event_managment_app/presentation/views/admin/Events/upload_events.dart';
import 'package:event_managment_app/infrastructure/services/vote.dart';
import 'package:event_managment_app/infrastructure/models/vote.dart';
import 'package:event_managment_app/presentation/views/admin/GroupProfile.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CommunityAdmin extends StatefulWidget {
  const CommunityAdmin({super.key});

  @override
  State<CommunityAdmin> createState() => _CommunityAdminState();
}

class _CommunityAdminState extends State<CommunityAdmin> {
  final Map<String, int> selectedOptions = {};

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    final size = MediaQuery.of(context).size;
    final sw = size.width;
    final sh = size.height;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(backgroundColor: AppColors.primaryColor, elevation: 0),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UplaodEventAdmin()),
              );
            },
            heroTag: "vote",
            backgroundColor: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.how_to_vote,
                  color: AppColors.whiteColor,
                  size: sw * 0.05,
                ),
                Text(
                  "Vote",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: sw * 0.030,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Gap(sh * 0.02),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateEventAdmin()),
              );
            },
            heroTag: "event",
            backgroundColor: AppColors.primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: AppColors.whiteColor, size: sw * 0.05),
                Text(
                  "Events",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: sw * 0.030,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.primaryColor,
              child: ListTile(
                leading: Image.asset(
                  AssetsConstants.Ellipse,
                  width: sw * 0.13,
                  height: sw * 0.13,
                ),
                title: Text(
                  "Business group",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: sw * 0.045,
                    color: Colors.white,
                  ),
                ),
                trailing: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.white,
                  size: sw * 0.06,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<VoteModel>>(
                stream: VoteServices().getQuestions(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text("Error: ${snapshot.error}"));
                  }

                  final votes = snapshot.data;
                  if (votes == null || votes.isEmpty) {
                    return const Center(child: Text("No votes available"));
                  }

                  return ListView.separated(
                    padding: EdgeInsets.symmetric(vertical: sh * 0.03),
                    itemCount: votes.length,
                    separatorBuilder: (context, index) => Gap(sh * 0.02),
                    itemBuilder: (context, index) {
                      return _buildEventCard(
                        context,
                        votes[index],
                        index,
                        sw,
                        sh,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(
    BuildContext context,
    VoteModel vote,
    int index,
    double sw,
    double sh,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final selectedIndex = selectedOptions[vote.docId] ?? -1;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: sw * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isDark ? Colors.black : Colors.white,
        border: Border.all(
          color: isDark ? Colors.white : AppColors.borderColor,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GroupProfileAdmin(),
                  ),
                );
              },
              child: vote.image != null && vote.image!.isNotEmpty
                  ? Image.network(
                      vote.image!,
                      width: double.infinity,
                      height: sh * 0.22,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: sh * 0.22,
                        color: Colors.grey[300],
                        child: const Center(child: Icon(Icons.broken_image)),
                      ),
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return SizedBox(
                          height: sh * 0.22,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    )
                  : Container(
                      height: sh * 0.22,
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    ),
            ),
          ),
          Gap(sh * 0.012),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
            child: Text(
              vote.question ?? "Untitled vote",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: sw * 0.04,
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
          ),
          Gap(sh * 0.015),
          _buildOption(
            context,
            "A.",
            vote.option != null && vote.option!.isNotEmpty
                ? vote.option![0]
                : "Option A",
            "0 Votes",
            selectedIndex == 0,
            () => _onOptionSelected(vote.docId, 0),
            sw,
            sh,
          ),
          Gap(sh * 0.012),
          _buildOption(
            context,
            "B.",
            vote.option != null && vote.option!.length > 1
                ? vote.option![1]
                : "Option B",
            "0 Votes",
            selectedIndex == 1,
            () => _onOptionSelected(vote.docId, 1),
            sw,
            sh,
          ),
          Padding(
            padding: EdgeInsets.all(sw * 0.03),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Just now",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: sw * 0.03,
                    color: Theme.of(context).textTheme.bodySmall?.color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onOptionSelected(String? voteId, int optionIndex) {
    if (voteId == null) return;
    setState(() {
      selectedOptions[voteId] = optionIndex;
    });
  }

  Widget _buildOption(
    BuildContext context,
    String label,
    String text,
    String votes,
    bool isChecked,
    VoidCallback onTap,
    double sw,
    double sh,
  ) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: sw * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: sw * 0.035,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            Gap(sw * 0.02),
            Icon(
              isChecked
                  ? Icons.radio_button_checked_outlined
                  : Icons.radio_button_off,
              color: isChecked
                  ? AppColors.primaryColor
                  : Theme.of(context).iconTheme.color,
              size: sw * 0.05,
            ),
            Gap(sw * 0.02),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: sw * 0.033,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    votes,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: sw * 0.025,
                      color: Theme.of(context).textTheme.bodySmall?.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
