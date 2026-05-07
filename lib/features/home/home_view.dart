import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:helpdesk/constants/app_colors.dart';
import 'package:helpdesk/constants/app_fonts.dart';
import 'package:helpdesk/core/controller/dashboard_controller.dart';
import 'package:helpdesk/core/controller/komplain_controller.dart';
import 'package:helpdesk/features/home/components/latest_card.dart';
import 'package:helpdesk/features/home/components/small_card.dart';
import 'package:helpdesk/features/home/components/ticket_card.dart';
import 'package:helpdesk/utils/extensions.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final komplainState = ref.watch(komplainControllerProvider);
    final dashboardState = ref.watch(dashboardControllerProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halo, Admin",
            style: AppFonts.inter(
              context: context,
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "Ringkasan operasional sistem IT hari ini.",
            style: AppFonts.inter(
              context: context,
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),

          const SizedBox(height: 20),

          const TicketCard(),

          const SizedBox(height: 20),
          dashboardState.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),

            error: (error, stackTrace) => Center(child: Text("Error: $error")),

            data: (dashboard) {
              return Column(
                children: [
                  /// SIMRS
                  Row(
                    children: [
                      Expanded(
                        child: SmallCard(
                          title: "SIMRS Masuk",

                          value: dashboard.simrsMasuk.toString(),

                          icon: Icons.message,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: SmallCard(
                          title: "SIMRS Selesai",

                          value: dashboard.simrsDone.toString(),

                          icon: Icons.check_circle,

                          isDone: true,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// MAINTENANCE
                  Row(
                    children: [
                      Expanded(
                        child: SmallCard(
                          title: "Maintenance Masuk",

                          value: dashboard.maintenanceMasuk.toString(),

                          icon: Icons.support_agent,
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: SmallCard(
                          title: "Maintenance Selesai",

                          value: dashboard.maintenanceDone.toString(),

                          icon: Icons.check_circle,

                          isDone: true,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tiket Terbaru",
                style: AppFonts.inter(
                  context: context,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              Text(
                "Lihat Semua >",
                style: AppFonts.inter(
                  context: context,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          komplainState.when(
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              ),
            ),

            error: (error, stackTrace) => Center(child: Text("Error: $error")),

            data: (data) {
              if (data.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text("Belum ada tiket masuk hari ini."),
                  ),
                );
              }

              final latestData = data.take(3).toList();

              return Column(
                children: latestData.map((komplain) {
                  final bool isDone =
                      komplain.nomorAct != null &&
                      komplain.tanggalAct != null &&
                      komplain.tanggalAct != "0000-00-00 00:00:00";

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),

                    child: LatestCard(
                      status: isDone ? "DONE" : "PENDING",

                      title: komplain.nama,

                      description: komplain.permasalahan,

                      time: komplain.tanggal.toFormattedDateIndonesia(),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
