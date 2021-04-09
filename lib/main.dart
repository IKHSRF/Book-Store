import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_buku/pages/admin/add_distributor_page.dart';
import 'package:toko_buku/pages/admin/distributor_page.dart';
import 'package:toko_buku/pages/shared/login_page.dart';
import 'package:toko_buku/providers/distributor_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DistributorProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: DistributorPage.id,
        routes: {
          LoginPage.id: (_) => LoginPage(),
          DistributorPage.id: (_) => DistributorPage(),
          AddDistributorPage.id: (_) => AddDistributorPage(),
        },
      ),
    );
  }
}
