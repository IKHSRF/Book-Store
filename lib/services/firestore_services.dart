import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toko_buku/model/buku.dart';
import 'package:toko_buku/model/distributor.dart';
import 'package:toko_buku/model/pasok.dart';
import 'package:toko_buku/model/user.dart';

class FirestoreServices {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static CollectionReference _distributorCollection =
      _firestore.collection('distributor');
  static CollectionReference _bukuCollection = _firestore.collection('buku');
  static CollectionReference _pasokCollection = _firestore.collection('pasok');
  static CollectionReference _userCollection = _firestore.collection('user');

  // Get All Data
  Stream<List<Distributor>> getDistributor() {
    return _distributorCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Distributor.fromFirestore(doc)).toList());
  }

  Stream<List<Buku>> getBuku() {
    return _bukuCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Buku.fromFirestore(doc)).toList());
  }

  Stream<List<Pasok>> getPasok() {
    return _pasokCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Pasok.fromFirestore(doc)).toList());
  }

  Stream<List<TokoUser>> getUser() {
    return _userCollection.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => TokoUser.fromFirestore(doc)).toList());
  }

  // Get One Data by Id

  // Add Data
  Future<String> addDistributor(Distributor distributor) async {
    try {
      await _distributorCollection.add(distributor.toFirestore());
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  Future<String> addBuku(Buku buku) async {
    try {
      await _bukuCollection.add(buku.toFirestore());
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  Future<String> addPasok(Pasok pasok) async {
    try {
      await _pasokCollection.add(pasok.toFirestore());
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  Future<String> addUser(TokoUser user) async {
    try {
      await _userCollection.add(user.toFirestore());
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  // Remove Data

  // Update Data
}
