import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toko_buku/pages/admin/buku/add_buku_page.dart';
import 'package:toko_buku/pages/admin/buku/buku_page.dart';
import 'package:toko_buku/pages/admin/buku/edit_buku_page.dart';
import 'package:toko_buku/pages/admin/distributor/edit_distibutor_page.dart';
import 'package:toko_buku/pages/admin/pasok/add_pasok_page.dart';
import 'package:toko_buku/pages/admin/pasok/edit_pasok_page.dart';
import 'package:toko_buku/pages/admin/pasok/pasok_page.dart';
import 'package:toko_buku/pages/kasir/transaksi/add_transaksi_page.dart';
import 'package:toko_buku/pages/kasir/transaksi/edit_transaksi_page.dart';
import 'package:toko_buku/pages/kasir/transaksi/transaksi_page.dart';
import 'package:toko_buku/pages/manager/setting/add_report_setting_page.dart';
import 'package:toko_buku/pages/manager/setting/edit_report_setting_page.dart';
import 'package:toko_buku/pages/manager/setting/report_setting_page.dart';
import 'package:toko_buku/pages/manager/user/add_user_page.dart';
import 'package:toko_buku/pages/manager/user/edit_user_page.dart';
import 'package:toko_buku/pages/manager/user/user_page.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_buku_sering_terjual.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_buku_tidak_terjual.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_cetak_faktur.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_filter_pasok_buku.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_pasok_buku.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_penjualan_pertangal.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_penulis_buku.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_semua_buku.dart';
import 'package:toko_buku/pages/shared/laporan/laporan_semua_penjualan.dart';
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
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (_) => LoginPage(),
          // Distributor Page Route
          DistributorPage.id: (_) => DistributorPage(),
          AddDistributorPage.id: (_) => AddDistributorPage(),
          EditDistributorPage.id: (_) => EditDistributorPage(),
          // Buku Page Route
          BukuPage.id: (_) => BukuPage(),
          EditBukuPage.id: (_) => EditBukuPage(),
          AddBukuPage.id: (_) => AddBukuPage(),
          // Pasok Page Route
          PasokPage.id: (_) => PasokPage(),
          AddPasokPage.id: (_) => AddPasokPage(),
          EditPasokPage.id: (_) => EditPasokPage(),
          // Transaksi Page Route
          TransaksiPage.id: (_) => TransaksiPage(),
          AddTransaksiPage.id: (_) => AddTransaksiPage(),
          EditTransaksiPage.id: (_) => EditTransaksiPage(),
          // Report Setting Page Route
          ReportSettingPage.id: (_) => ReportSettingPage(),
          AddReportSettingPage.id: (_) => AddReportSettingPage(),
          EditReportSettingPage.id: (_) => EditReportSettingPage(),
          // User Page Route
          UserPage.id: (_) => UserPage(),
          EditUserPage.id: (_) => EditUserPage(),
          AddUserPage.id: (_) => AddUserPage(),
          // Laporan Page Route
          LaporanBukuSeringTerjual.id: (_) => LaporanBukuSeringTerjual(),
          LaporanBukuTidakTerjual.id: (_) => LaporanBukuTidakTerjual(),
          LaporanCetakFaktur.id: (_) => LaporanCetakFaktur(),
          LaporanFilterPasokBuku.id: (_) => LaporanFilterPasokBuku(),
          LaporanPasokBuku.id: (_) => LaporanPasokBuku(),
          LaporanPenjualanPertanggal.id: (_) => LaporanPenjualanPertanggal(),
          LaporanPenulisBuku.id: (_) => LaporanPenulisBuku(),
          LaporanSemuaBuku.id: (_) => LaporanSemuaBuku(),
          LaporanSemuaPenjualan.id: (_) => LaporanSemuaPenjualan(),
        },
      ),
    );
  }
}
