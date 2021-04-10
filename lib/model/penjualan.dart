import 'package:cloud_firestore/cloud_firestore.dart';

class Penjualan {
  final String id;
  final String idBuku;
  final String idKasir;
  final int jumlahBeli;
  final int bayar;
  final int kembalian;
  final int totalHarga;
  final String tanggal;

  Penjualan({
    this.id,
    this.idBuku,
    this.idKasir,
    this.jumlahBeli,
    this.bayar,
    this.kembalian,
    this.totalHarga,
    this.tanggal,
  });

  factory Penjualan.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return Penjualan(
      id: snapshot.id,
      idBuku: data['id_buku'],
      idKasir: data['id_kasir'],
      jumlahBeli: data['jumlah_beli'],
      bayar: data['bayar'],
      kembalian: data['kembalian'],
      totalHarga: data['total_harga'],
      tanggal: data['tanggal'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id_buku': idBuku,
      'id_kasir': idKasir,
      'jumlah_beli': jumlahBeli,
      'bayar': bayar,
      'kembalian': kembalian,
      'total_harga': totalHarga,
      'tanggal': tanggal,
    };
  }
}
