import 'package:flutter/material.dart';
import 'package:toko_buku/services/storage_services.dart';

class DistributorPage extends StatelessWidget {
  static const String id = '/distributor';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: Text("Image Database"),
              onPressed: () async {
                var file = await StorageServices.getImage();
                StorageServices.uploadImage(file);
              },
            ),
          ],
        ),
      ),
    );
  }
}
