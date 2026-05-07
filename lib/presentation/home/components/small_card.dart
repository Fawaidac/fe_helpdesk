import 'package:flutter/material.dart';
import 'package:helpdesk/constants/app_colors.dart';
import 'package:helpdesk/constants/app_fonts.dart';

// ignore: must_be_immutable
class SmallCard extends StatelessWidget {
  String title;
  String value;
  IconData icon;
  bool isDone;
  SmallCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.inter(
              context: context,
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: AppFonts.inter(
                  context: context,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: isDone ? Colors.grey.shade600 : AppColors.primaryColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  size: 18,
                  color: isDone ? Colors.grey : AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
