import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toko_buku/model/distributor.dart';

class FirestoreServices {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static CollectionReference _distributorCollectionReference =
      _firestore.collection('distributor');

  // Get All Data
  Stream<List<Distributor>> getDistributor() {
    return _distributorCollectionReference.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => Distributor.fromFirestore(doc)).toList());
  }

  // Get One Data by Id

  // Add Data
  Future<String> addDistributor(Distributor distributor) async {
    try {
      await _distributorCollectionReference.add(distributor.toFirestore());
      return 'berhasil';
    } catch (error) {
      print(error);
      return error.message;
    }
  }

  // Remove Data

  // Update Data
}
