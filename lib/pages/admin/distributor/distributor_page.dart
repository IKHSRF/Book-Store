import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_buku/providers/distributor_provider.dart';

class DistributorPage extends StatelessWidget {
  static const String id = '/distributor';
  @override
  Widget build(BuildContext context) {
    final distributorProvider = Provider.of<DistributorProvider>(context);
    return Scaffold(
      body: SizedBox.expand(
        child: StreamBuilder(
          stream: distributorProvider.distributor,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Icon(Icons.edit),
                  title: Text(snapshot.data[index].namaDistributor),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(snapshot.data[index].alamat),
                      Text(snapshot.data[index].telepon),
                    ],
                  ),
                  isThreeLine: true,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
