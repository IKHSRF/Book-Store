import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/distributor.dart';
import 'package:toko_buku/services/firestore_services.dart';

class DistributorProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _namaDistributor;
  String _alamat;
  String _telepon;

  //getter
  String get namaDistributor => _namaDistributor;
  String get alamat => _alamat;
  String get telepon => _telepon;

  Stream<List<Distributor>> get distributor =>
      firestoreServices.getDistributor();

  //setter
  set changeNamaDistributor(String namaDistributor) {
    _namaDistributor = namaDistributor;
    notifyListeners();
  }

  set changeAlamat(String alamat) {
    _alamat = alamat;
    notifyListeners();
  }

  set changeTelepon(String telepon) {
    _telepon = telepon;
    notifyListeners();
  }

  // function
  saveDistributor() {
    var distributor = Distributor(
      namaDistributor: _namaDistributor,
      alamat: _alamat,
      telepon: _telepon,
    );
    firestoreServices.addDistributor(distributor);
  }

  updateDistributor(String id) {
    var distributor = Distributor(
      namaDistributor: _namaDistributor,
      alamat: _alamat,
      telepon: _telepon,
    );
    firestoreServices.updateDistributor(id, distributor);
  }

  removeDistributor(String id) {
    firestoreServices.removeDistributor(id);
  }
}
