import 'package:cloud_firestore/cloud_firestore.dart';

class Pasok {
  final String id;
  final String idDistributor;
  final String idBuku;
  final int jumlah;
  final String tanggal;

  Pasok({
    this.id,
    this.idDistributor,
    this.idBuku,
    this.jumlah,
    this.tanggal,
  });

  factory Pasok.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return Pasok(
      id: snapshot.id,
      idDistributor: data['id_distributor'],
      idBuku: data['id_buku'],
      jumlah: data['jumlah'],
      tanggal: data['tanggal'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id_distributor': idDistributor,
      'id_buku': idBuku,
      'jumlah': jumlah,
      'tanggal': tanggal,
    };
  }
}
