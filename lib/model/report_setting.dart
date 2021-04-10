import 'package:cloud_firestore/cloud_firestore.dart';

class ReportSetting {
  final String id;
  final String namaPerusahaan;
  final String alamat;
  final String telepon;
  final String web;
  final String logo;
  final String noHp;
  final String email;

  ReportSetting({
    this.id,
    this.namaPerusahaan,
    this.alamat,
    this.telepon,
    this.web,
    this.logo,
    this.noHp,
    this.email,
  });

  factory ReportSetting.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return ReportSetting(
      id: snapshot.id,
      namaPerusahaan: data['nama_perusahaan'],
      alamat: data['alamat'],
      telepon: data['telepon'],
      web: data['web'],
      logo: data['logo'],
      noHp: data['no_hp'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nama_perusahaan': namaPerusahaan,
      'alamat': alamat,
      'telepon': telepon,
      'web': web,
      'logo': logo,
      'no_hp': noHp,
      'email': email,
    };
  }
}
