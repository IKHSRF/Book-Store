import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/penjualan.dart';
import 'package:toko_buku/services/firestore_services.dart';

class PenjualanProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _idBuku;
  String _idKasir;
  int _jumlahBeli;
  int _bayar;
  int _kembalian;
  int _totalHarga;
  String _tanggal;

  //Getter
  String get idBuku => _idBuku;
  String get idKasir => _idKasir;
  int get jumlahBeli => _jumlahBeli;
  int get bayar => _bayar;
  int get kembalian => _kembalian;
  int get totalHarga => _totalHarga;
  String get tanggal => _tanggal;

  Stream<List<Penjualan>> get penjualan => firestoreServices.getPenjualan();

  //Setter
  set changeIdBuku(String idBuku) {
    _idBuku = idBuku;
    notifyListeners();
  }

  set changeIdKasir(String idBuku) {
    _idKasir = idKasir;
    notifyListeners();
  }

  set changeJumlahBeli(int jumlahBeli) {
    _jumlahBeli = jumlahBeli;
    notifyListeners();
  }

  set changeBayar(int bayar) {
    _bayar = bayar;
    notifyListeners();
  }

  set changeKembalian(int kembalian) {
    _kembalian = kembalian;
    notifyListeners();
  }

  set changeTotalHarga(int totalHarga) {
    _totalHarga = totalHarga;
    notifyListeners();
  }

  set changeTanggal(String tanggal) {
    _tanggal = tanggal;
    notifyListeners();
  }

  //function
  savePenjualan() {
    var penjualan = Penjualan(
      idBuku: _idBuku,
      idKasir: _idKasir,
      jumlahBeli: _jumlahBeli,
      bayar: _bayar,
      kembalian: _kembalian,
      totalHarga: _totalHarga,
      tanggal: _tanggal,
    );
    firestoreServices.addPenjualan(penjualan);
  }

  updatePenjualan(String id) {
    var penjualan = Penjualan(
      idBuku: _idBuku,
      idKasir: _idKasir,
      jumlahBeli: _jumlahBeli,
      bayar: _bayar,
      kembalian: _kembalian,
      totalHarga: _totalHarga,
      tanggal: _tanggal,
    );
    firestoreServices.updatePenjualan(id, penjualan);
  }

  removePenjualan(String id) {
    firestoreServices.removePenjualan(id);
  }
}
