// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:helpdesk/constants/app_fonts.dart';

class LatestCard extends StatelessWidget {
  String title;
  String description;
  String time;
  LatestCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
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

          Container(
            margin: const EdgeInsets.only(top: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(100),
            ),
            child: const Icon(Icons.warning, color: Colors.red, size: 20),
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
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          "INC-9042",
                          style: AppFonts.inter(context: context, fontSize: 12),
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
