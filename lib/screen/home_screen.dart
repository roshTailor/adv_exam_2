import 'package:adv_exam_2/Utils/AppVar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/product_helper.dart';
import '../model/product_model.dart';
import 'cart_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grab your offer here"),
      ),
      body: FutureBuilder(
        future: ProductDBHelper.productDBHelper.getAllRecode(),
        builder: (BuildContext context, AsyncSnapshot snapShot) {
          if (snapShot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Error : ${snapShot.error}"),
              ),
            );
          } else if (snapShot.hasData) {
            List<ProductDB> data = snapShot.data!;
            return
              ListView.builder(
              itemCount: data.length,
                itemBuilder: (context, i) => Padding(
                  padding: const EdgeInsets.all(5),
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      title: Text(data[i].name),
                      subtitle: Text("Rs.${data[i].price}"),
                      onTap: () {
                        Get.toNamed("productPage", arguments: data[i]);
                        //Get.to(Cart(index: i,));
                      },
                    ),
                  ),
                ),
              );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),

    );
  }
}
