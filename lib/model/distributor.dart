import 'package:cloud_firestore/cloud_firestore.dart';

class Distributor {
  final String id;
  final String namaDistributor;
  final String alamat;
  final String telepon;

  Distributor({
    this.id,
    this.namaDistributor,
    this.alamat,
    this.telepon,
  });

  factory Distributor.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return Distributor(
      id: snapshot.id,
      namaDistributor: data['nama_distributor'] ?? '',
      alamat: data['alamat'] ?? '',
      telepon: data['telepon'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nama_distributor': namaDistributor,
      'alamat': alamat,
      'telepon': telepon,
    };
  }
}
