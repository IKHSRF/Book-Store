import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_buku/providers/distributor_provider.dart';

class AddDistributorPage extends StatelessWidget {
  static const String id = '/distributor/add';
  @override
  Widget build(BuildContext context) {
    final distributorProvider = Provider.of<DistributorProvider>(context);
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Nama Distributor'),
              onChanged: (value) {
                distributorProvider.changeNamaDistributor = value;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Alamat'),
              onChanged: (value) {
                distributorProvider.changeAlamat = value;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Telepon'),
              onChanged: (value) {
                distributorProvider.changeTelepon = value;
              },
            ),
            TextButton(
              child: Text("Tambah Distributor"),
              onPressed: () {
                distributorProvider.saveDistributor();
              },
            )
          ],
        ),
      ),
    );
  }
}
