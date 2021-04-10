import 'package:cloud_firestore/cloud_firestore.dart';

class Buku {
  final String id;
  final String judul;
  final String nosbn;
  final String penulis;
  final String penerbit;
  final String tahun;
  final int stok;
  final int hargaPokok;
  final int hargaJual;
  final int ppn;
  final int diskon;

  Buku({
    this.id,
    this.judul,
    this.nosbn,
    this.penulis,
    this.penerbit,
    this.tahun,
    this.stok,
    this.hargaPokok,
    this.hargaJual,
    this.ppn,
    this.diskon,
  });

  factory Buku.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return Buku(
      id: snapshot.id,
      judul: data['judul'] ?? '',
      nosbn: data['nosbn'] ?? '',
      penulis: data['penulis'] ?? '',
      penerbit: data['penerbit'] ?? '',
      tahun: data['tahun'] ?? '',
      stok: data['stok'] ?? 0,
      hargaPokok: data['harga_pokok'] ?? 0,
      hargaJual: data['harga_jual'] ?? 0,
      ppn: data['ppn'] ?? 0,
      diskon: data['diskon'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'judul': judul,
      'nosbn': nosbn,
      'penulis': penulis,
      'penerbit': penerbit,
      'tahun': tahun,
      'stok': stok,
      'harga_pokok': hargaPokok,
      'harga_jual': hargaJual,
      'ppn': ppn,
      'diskon': diskon,
    };
  }
}
