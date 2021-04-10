import 'package:cloud_firestore/cloud_firestore.dart';

class ShoppingCart {
  final String id;
  final String idBuku;
  final int jumlahBeli;
  final int totalHarga;

  ShoppingCart({
    this.id,
    this.idBuku,
    this.jumlahBeli,
    this.totalHarga,
  });

  factory ShoppingCart.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return ShoppingCart(
      id: snapshot.id,
      idBuku: data['id_buku'],
      jumlahBeli: data['jumlah_beli'],
      totalHarga: data['total_harga'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id_buku': idBuku,
      'jumlah_beli': jumlahBeli,
      'total_harga': totalHarga,
    };
  }
}
