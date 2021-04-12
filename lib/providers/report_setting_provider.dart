import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/report_setting.dart';
import 'package:toko_buku/services/firestore_services.dart';

class ReportSettingProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _namaPerusahaan;
  String _alamat;
  String _telepon;
  String _web;
  String _logo;
  String _noHp;
  String _email;

  //Getter
  String get namaPerusahaan => _namaPerusahaan;
  String get alamat => _alamat;
  String get telepon => _telepon;
  String get web => _web;
  String get logo => _logo;
  String get noHp => _noHp;
  String get email => _email;

  Stream<List<ReportSetting>> get reportSetting =>
      firestoreServices.getReportSetting();

  //Setter
  set changeNamaPerusahaan(String namaPerusahaan) {
    _namaPerusahaan = namaPerusahaan;
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

  set changeWeb(String web) {
    _web = web;
    notifyListeners();
  }

  set changeLogo(String logo) {
    _logo = logo;
    notifyListeners();
  }

  set changeNoHp(String noHp) {
    _noHp = noHp;
    notifyListeners();
  }

  set changeEmail(String email) {
    _email = email;
    notifyListeners();
  }

  //function
  saveReportSetting() {
    var setting = ReportSetting(
      namaPerusahaan: _namaPerusahaan,
      alamat: _alamat,
      telepon: _telepon,
      web: _web,
      logo: _logo,
      noHp: _noHp,
      email: _email,
    );
    firestoreServices.addReportSetting(setting);
  }

  updateReportSetting(String id) {
    var setting = ReportSetting(
      namaPerusahaan: _namaPerusahaan,
      alamat: _alamat,
      telepon: _telepon,
      web: _web,
      logo: _logo,
      noHp: _noHp,
      email: _email,
    );
    firestoreServices.updateReportSetting(id, setting);
  }

  removeReportSetting(String id) {
    firestoreServices.removeReportSetting(id);
  }
}
