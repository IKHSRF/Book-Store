import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_buku/pages/shared/login_page.dart';
import 'pages/admin/distributor/distributor_page.dart';
import 'pages/admin/distributor/add_distributor_page.dart';
import 'providers/buku_provider.dart';
import 'providers/distributor_provider.dart';
import 'providers/pasok_provider.dart';
import 'providers/penjualan_provider.dart';
import 'providers/report_setting_provider.dart';
import 'providers/shopping_cart_provider.dart';
import 'providers/user_provider.dart';

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
        ChangeNotifierProvider(create: (context) => BukuProvider()),
        ChangeNotifierProvider(create: (context) => DistributorProvider()),
        ChangeNotifierProvider(create: (context) => PasokProvider()),
        ChangeNotifierProvider(create: (context) => PenjualanProvider()),
        ChangeNotifierProvider(create: (context) => ReportSettingProvider()),
        ChangeNotifierProvider(create: (context) => ShoppingCartProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
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
