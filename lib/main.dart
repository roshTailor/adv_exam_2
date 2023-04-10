import 'dart:io';

import 'package:adv_exam_2/Utils/AppVar.dart';
import 'package:adv_exam_2/screen/cart_screen.dart';
import 'package:adv_exam_2/screen/home_screen.dart';
import 'package:adv_exam_2/screen/product.dart';
import 'package:adv_exam_2/screen/promo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'helper/database_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await copyDatabase();
  // Directory documentsDirectory = await getApplicationDocumentsDirectory();
  // String path = join(documentsDirectory.path, 'product.db');
  // Database database = await openDatabase(path);
  // AppVar.productList = await database.rawQuery('SELECT * FROM product');
  // AppVar.couponList = await database.rawQuery('SELECT * FROM coupon');

  // for (var row in AppVar.productList) {
  //   // print(row);
  //   print(AppVar.productList);
  // }
  // for (var row in AppVar.couponList) {
  //   // print(row);
  //   print(AppVar.couponList);
  // }
  runApp( GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    getPages: [
      GetPage(name: "/", page: () => const HomePage()),
      GetPage(name: "/productPage", page: () =>  const ProductPage()),
      GetPage(name: "/cart_page", page: () => const CartPage()),
      GetPage(name: "/coupon_page", page: () => const CouponPage()),
    ],
  ));
}
