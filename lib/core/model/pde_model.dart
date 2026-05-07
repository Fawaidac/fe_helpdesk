class PdeModel {
  final int id;
  final String nama;
  final String alamat;
  final String telp;

  PdeModel({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.telp,
  });

  factory PdeModel.fromJson(Map<String, dynamic> json) {
    return PdeModel(
      id: json['id'] ?? 0,
      nama: json['nama'] ?? '',
      alamat: json['alamat'] ?? '',
      telp: json['telp'] ?? '',
    );
  }
}