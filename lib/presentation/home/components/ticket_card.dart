// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:helpdesk/constants/app_colors.dart';
import 'package:helpdesk/constants/app_fonts.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tiket Terbuka",
                  style: AppFonts.inter(
                    context: context,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "5",
                      style: AppFonts.inter(
                        context: context,
                        fontSize: 32,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.confirmation_number,
                        color: AppColors.primaryColor,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 60,
            color: Colors.grey.shade300,
            margin: EdgeInsets.symmetric(horizontal: 16),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tiket Selesai",
                  style: AppFonts.inter(
                    context: context,
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "30",
                      style: AppFonts.inter(
                        context: context,
                        fontSize: 32,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
