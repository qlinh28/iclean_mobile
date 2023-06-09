import 'package:flutter/material.dart';
import '../../../../models/profile.dart';
import '../../employee_service_details.dart';
import 'SavedProfile/InfoProfile.dart';
import 'SavedProfile/Unsave.dart';

class SavedProfile extends StatelessWidget {
  const SavedProfile({
    Key? key,
    required this.profile,
    required this.i,
  }) : super(key: key);

  final List<Profile> profile;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EmployeeDetailsScreen(
                profile: profile[i],
              ),
            ),
          );
        },
        child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    profile[i].image,
                    width: 120,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InfoProfile(profile: profile, i: i),
              Unsave(profile: profile, i: i),
            ],
          ),
        ),
      ),
    );
  }
}
