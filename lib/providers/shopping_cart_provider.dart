import 'package:flutter/cupertino.dart';
import 'package:toko_buku/model/shopping_cart.dart';
import 'package:toko_buku/services/firestore_services.dart';

class ShoppingCartProvider with ChangeNotifier {
  final firestoreServices = FirestoreServices();

  String _idBuku;
  int _jumlahBeli;
  int _totalHarga;

  //Getter
  String get idBuku => _idBuku;
  int get jumlahBeli => _jumlahBeli;
  int get totalHarga => _totalHarga;

  Stream<List<ShoppingCart>> get shoppingCart =>
      firestoreServices.getShoppingCart();

  //Setter
  set changeIdBuku(String idBuku) {
    _idBuku = idBuku;
    notifyListeners();
  }

  set changeJumlahBeli(int jumlahBeli) {
    _jumlahBeli = jumlahBeli;
    notifyListeners();
  }

  set changeTotalHarga(int totalHarga) {
    _totalHarga = totalHarga;
    notifyListeners();
  }

  //function
  saveShoppingCart() {
    var cart = ShoppingCart(
      idBuku: _idBuku,
      jumlahBeli: _jumlahBeli,
      totalHarga: _totalHarga,
    );
    firestoreServices.addShoppingCart(cart);
  }

  updateShoppingCart(String id) {
    var cart = ShoppingCart(
      idBuku: _idBuku,
      jumlahBeli: _jumlahBeli,
      totalHarga: _totalHarga,
    );
    firestoreServices.updateCartItem(id, cart);
  }

  removeShoppingCart(String id) {
    firestoreServices.removeCartItem(id);
  }
}
