import 'package:cloud_firestore/cloud_firestore.dart';

class TokoUser {
  final String id;
  final String nama;
  final String alamat;
  final String telepon;
  final String status;
  final String username;
  final String password;
  final String akses;

  TokoUser({
    this.id,
    this.nama,
    this.alamat,
    this.telepon,
    this.status,
    this.username,
    this.password,
    this.akses,
  });

  factory TokoUser.fromFirestore(DocumentSnapshot snapshot) {
    Map data = snapshot.data();

    return TokoUser(
      id: snapshot.id,
      nama: data['nama'],
      alamat: data['alamat'],
      telepon: data['telepon'],
      status: data['status'],
      username: data['username'],
      password: data['password'],
      akses: data['akses'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'nama': nama,
      'alamat': alamat,
      'telepon': telepon,
      'status': status,
      'username': username,
      'password': password,
      'akses': akses,
    };
  }
}
