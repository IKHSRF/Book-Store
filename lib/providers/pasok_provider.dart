import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/pasok.dart';
import 'package:toko_buku/services/firestore_services.dart';

class PasokProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _idDistributor;
  String _idBuku;
  int _jumlah;
  String _tanggal;

  //getter
  String get idDistributor => _idDistributor;
  String get idBuku => _idBuku;
  int get jumlah => _jumlah;
  String get tanggal => _tanggal;

  Stream<List<Pasok>> get pasok => firestoreServices.getPasok();

  //setter
  set changeIdDistributor(String idDistributor) {
    _idDistributor = idDistributor;
    notifyListeners();
  }

  set changeIdBuku(String idBuku) {
    _idBuku = idBuku;
    notifyListeners();
  }

  set changeJumlah(int jumlah) {
    _jumlah = jumlah;
    notifyListeners();
  }

  set changeTanggal(String tanggal) {
    _tanggal = tanggal;
    notifyListeners();
  }

  //function
  savePasok() {
    var pasok = Pasok(
      idDistributor: _idDistributor,
      idBuku: _idBuku,
      jumlah: _jumlah,
      tanggal: _tanggal,
    );
    firestoreServices.addPasok(pasok);
  }
}
