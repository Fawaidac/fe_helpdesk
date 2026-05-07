class KomplainModel {
  final int id;
  final String nama;
  final String namaPelapor;
  final String ruangan;
  final String permasalahan;
  final String nomorWa;
  final String tanggal;
  final String? nomorAct;
  final String? tanggalAct;

  KomplainModel({
    required this.id,
    required this.nama,
    required this.namaPelapor,
    required this.ruangan,
    required this.permasalahan,
    required this.nomorWa,
    required this.tanggal,
    this.nomorAct,
    this.tanggalAct,
  });

  factory KomplainModel.fromJson(Map<String, dynamic> json) {
    return KomplainModel(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      namaPelapor: json['nama_pelapor'] ?? '',
      ruangan: json['ruangan'] ?? '',
      permasalahan: json['permasalahan'] ?? '',
      nomorWa: json['nomor_wa'] ?? '',
      tanggal: json['tanggal'] ?? '',
      nomorAct: json['nomor_act'],
      tanggalAct: json['tanggal_act'],
    );
  }
}
