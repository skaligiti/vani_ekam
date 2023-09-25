import 'package:ekam/confirmation_page.dart';
import 'package:ekam/doctor_listing_page.dart';
import 'package:ekam/model/doctor_detail.dart';
import 'package:ekam/review_summary_page.dart';
import 'package:ekam/select_package_page.dart';
import 'package:ekam/ui/date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'doctor_details_page.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/" : (_) => DoctorListingPage(),
        "/doctorDetails" : (_) => DoctorDetailsPage(),
        "/selectPackage" : (_) => SelectPackagePage(),
        "/reviewSummary" : (_) => ReviewSummaryPage(),
        "/confirmation" : (_) => ConfirmationPage()
      },
      initialRoute: "/",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}