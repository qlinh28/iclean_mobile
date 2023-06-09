import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../models/profile.dart';

class InfoProfile extends StatelessWidget {
  const InfoProfile({
    Key? key,
    required this.profile,
    required this.i,
  }) : super(key: key);

  final List<Profile> profile;
  final int i;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            profile[i].name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lato',
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.home_repair_service,
                size: 16,
                color: Colors.grey.shade700,
              ),
              const SizedBox(width: 4),
              Text(
                profile[i].jobName,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Lato',
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 16,
                color: Colors.grey.shade700,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  profile[i].address,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Lato',
                    color: Colors.grey.shade700,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              "${NumberFormat('#,###').format(profile[i].price)} VNĐ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                color: Colors.deepPurple.shade300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
