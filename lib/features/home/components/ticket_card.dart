// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/constants/app_colors.dart';
import 'package:helpdesk/constants/app_fonts.dart';
import 'package:helpdesk/core/controller/dashboard_controller.dart';

class TicketCard extends ConsumerWidget {
  const TicketCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);

    return dashboardState.when(
      loading: () => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),

      error: (error, stackTrace) => Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Error: $error",
            style: AppFonts.inter(
              context: context,
              fontSize: 14,
              color: Colors.red,
            ),
          ),
        ),
      ),

      data: (data) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              /// TIKET TERBUKA
              Expanded(
                child: Column(
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

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          data.ticketOpen.toString(),
                          style: AppFonts.inter(
                            context: context,
                            fontSize: 32,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 8),

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
                margin: const EdgeInsets.symmetric(horizontal: 16),
              ),

              /// TIKET SELESAI
              Expanded(
                child: Column(
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

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          data.ticketDone.toString(),
                          style: AppFonts.inter(
                            context: context,
                            fontSize: 32,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
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
      },
    );
  }
}