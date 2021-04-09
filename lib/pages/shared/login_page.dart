import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_buku/providers/distributor_provider.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Text(
                "Ini masuk data",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                distributorProvider.saveDistributor();
              },
            ),
          ],
        ),
      ),
    );
  }
}
