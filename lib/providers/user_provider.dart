import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/user.dart';
import 'package:toko_buku/services/firestore_services.dart';

class UserProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _nama;
  String _alamat;
  String _telepon;
  String _status;
  String _username;
  String _password;
  String _akses;

  //Getter
  String get nama => _nama;
  String get alamat => _alamat;
  String get telepon => _telepon;
  String get status => _status;
  String get username => _username;
  String get password => _password;
  String get akses => _akses;

  Stream<List<TokoUser>> get user => firestoreServices.getUser();

  //Setter
  set changeNama(String nama) {
    _nama = nama;
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

  set changeStatus(String status) {
    _status = status;
    notifyListeners();
  }

  set changeUsername(String username) {
    _username = username;
    notifyListeners();
  }

  set changePassword(String password) {
    _password = password;
    notifyListeners();
  }

  set changeAkses(String akses) {
    _akses = akses;
    notifyListeners();
  }

  //function
  saveUser() {
    var user = TokoUser(
      nama: _nama,
      alamat: _alamat,
      telepon: _telepon,
      status: _status,
      username: _username,
      password: _password,
      akses: _akses,
    );
    firestoreServices.addUser(user);
  }

  updateUser(String id) {
    var user = TokoUser(
      nama: _nama,
      alamat: _alamat,
      telepon: _telepon,
      status: _status,
      username: _username,
      password: _password,
      akses: _akses,
    );
    firestoreServices.updateUser(id, user);
  }

  removeUser(String id) {
    firestoreServices.removeUser(id);
  }
}
