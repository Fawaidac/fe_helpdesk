// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:helpdesk/constants/app_fonts.dart';

class LatestCard extends StatelessWidget {
  String title;
  String description;
  String time;
  String status;
  LatestCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDone = status == "DONE";

    final Color primaryColor = isDone ? Colors.green : Colors.red;

    final Color bgColor = isDone ? Colors.green.shade50 : Colors.red.shade50;

    final IconData icon = isDone ? Icons.check_circle : Icons.warning;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 4,
            height: 120,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// ICON
          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(icon, color: primaryColor, size: 20),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TOP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),

                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(6),
                        ),

                        child: Text(
                          status,
                          style: AppFonts.inter(
                            context: context,
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        time,
                        style: AppFonts.inter(
                          context: context,
                          fontSize: 12,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.inter(
                      context: context,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppFonts.inter(
                      context: context,
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
