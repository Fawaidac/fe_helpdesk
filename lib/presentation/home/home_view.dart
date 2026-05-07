import 'package:flutter/material.dart';
import 'package:helpdesk/constants/app_colors.dart';
import 'package:helpdesk/constants/app_fonts.dart';
import 'package:helpdesk/presentation/home/components/latest_card.dart';
import 'package:helpdesk/presentation/home/components/small_card.dart';
import 'package:helpdesk/presentation/home/components/ticket_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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

          SizedBox(height: 20),

          TicketCard(),

          SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: SmallCard(
                  title: "SIMRS Masuk",
                  value: "24",
                  icon: Icons.message,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SmallCard(
                  title: "SIMRS Selesai",
                  value: "18",
                  icon: Icons.check_circle,
                  isDone: true,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Row(
            children: [
              Expanded(
                child: SmallCard(
                  title: "Maintenance Masuk",
                  value: "18",
                  icon: Icons.support_agent,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SmallCard(
                  title: "Maintenance Selesai",
                  value: "12",
                  icon: Icons.check_circle,
                  isDone: true,
                ),
              ),
            ],
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

          LatestCard(
            title: "Server Database Utama Down",
            description:
                "Koneksi ke kluster db-prod-01 terputus. Aplikasi frontend gagal...",
            time: "10m yang lalu",
          ),

          const SizedBox(height: 12),

          LatestCard(
            title: "Indikasi Serangan DDoS",
            description:
                "Lonjakan traffic tidak wajar terdeteksi pada API gateway eksternal",
            time: "45m yang lalu",
          ),
        ],
      ),
    );
  }
}
