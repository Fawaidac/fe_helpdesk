class DashboardModel {
  final int ticketOpen;
  final int ticketDone;

  final int simrsMasuk;
  final int simrsDone;

  final int maintenanceMasuk;
  final int maintenanceDone;

  DashboardModel({
    required this.ticketOpen,
    required this.ticketDone,
    required this.simrsMasuk,
    required this.simrsDone,
    required this.maintenanceMasuk,
    required this.maintenanceDone,
  });

  factory DashboardModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return DashboardModel(
      ticketOpen: json['ticket_open'] ?? 0,
      ticketDone: json['ticket_done'] ?? 0,

      simrsMasuk: json['simrs_masuk'] ?? 0,
      simrsDone: json['simrs_done'] ?? 0,

      maintenanceMasuk:
          json['maintenance_masuk'] ?? 0,

      maintenanceDone:
          json['maintenance_done'] ?? 0,
    );
  }
}