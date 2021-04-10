import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/buku.dart';
import 'package:toko_buku/services/firestore_services.dart';

class BukuProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _judul;
  String _nosbn;
  String _penulis;
  String _penerbit;
  String _tahun;
  int _stok;
  int _hargaPokok;
  int _hargaJual;
  int _ppn;
  int _diskon;

  //getter
  String get judul => _judul;
  String get nosbn => _nosbn;
  String get penulis => _penulis;
  String get penerbit => _penerbit;
  String get tahun => _tahun;
  int get stok => _stok;
  int get hargaPokok => _hargaPokok;
  int get hargaJual => _hargaJual;
  int get ppn => _ppn;
  int get diskon => _diskon;

  Stream<List<Buku>> get buku => firestoreServices.getBuku();

  //setter
  set changeJudul(String judul) {
    _judul = judul;
    notifyListeners();
  }

  set changeNosbn(String nosbn) {
    _nosbn = nosbn;
    notifyListeners();
  }

  set changePenulis(String penulis) {
    _penulis = penulis;
    notifyListeners();
  }

  set changePenerbit(String penerbit) {
    _penerbit = penerbit;
    notifyListeners();
  }

  set changeTahun(String tahun) {
    _tahun = tahun;
    notifyListeners();
  }

  set changeStok(int stok) {
    _stok = stok;
    notifyListeners();
  }

  set changeHargaPokok(int hargaPokok) {
    _hargaPokok = hargaPokok;
    notifyListeners();
  }

  set changeHargaJual(int hargaJual) {
    _hargaJual = hargaJual;
    notifyListeners();
  }

  set changePpn(int ppn) {
    _ppn = ppn;
    notifyListeners();
  }

  set changeDiskon(int diskon) {
    _diskon = diskon;
    notifyListeners();
  }

  //function
  saveBuku() {
    var buku = Buku(
      judul: _judul,
      nosbn: _nosbn,
      penulis: _penulis,
      penerbit: _penerbit,
      tahun: _tahun,
      stok: _stok,
      hargaPokok: _hargaPokok,
      hargaJual: _hargaJual,
      ppn: _ppn,
      diskon: _diskon,
    );
    firestoreServices.addBuku(buku);
  }
}
