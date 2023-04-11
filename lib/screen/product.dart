
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getController.dart';
import '../model/product_model.dart';


class ProductPage extends StatefulWidget {

  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //CartController cartController = Get.put(CartController());
  CartController cartController = Get.find<CartController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductDB data = Get.arguments;

    return Scaffold(
      appBar: AppBar(

        title: const Text(
          "Order",
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.name,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(CupertinoIcons.heart_fill,color: Colors.red,),
                      ),
                    ],
                  ),
                  Text(
                    data.category,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Text(
                    "₹ ${data.price}",
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10,),
                  ElevatedButton(
                    onPressed: () {
                      cartController.addProduct(productDB: data);
                      Get.offNamed("/cart_page");
                    },

                    child: const Text("+ Add to Cart",style: TextStyle(fontSize: 18,color: Colors.white),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }





}

