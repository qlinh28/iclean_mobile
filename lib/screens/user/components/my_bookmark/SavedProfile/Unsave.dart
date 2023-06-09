import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../models/profile.dart';

class Unsave extends StatelessWidget {
  const Unsave({
    Key? key,
    required this.profile,
    required this.i,
  }) : super(key: key);

  final List<Profile> profile;
  final int i;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(
                      child: Text(
                        'Remove form Bookmark?',
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 20, 25),
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
                          Expanded(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: MediaQuery.of(context).size.height / 14,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Colors.deepPurple.shade500,
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          height: MediaQuery.of(context).size.height / 14,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade400,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Center(
                            child: Text(
                              "Yes, Remove",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Lato',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ).then((result) {
          if (result == true) {
            // User chose to save, perform necessary actions
          } else if (result == false) {
            // User chose to cancel, perform necessary actions
          }
        });
      },
      child: Container(
        width: 50,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade50,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.favorite_outlined,
              color: Colors.deepPurple,
            ),
            SizedBox(height: 8),
            Text(
              "Saved",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                fontFamily: 'Lato',
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
