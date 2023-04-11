import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/getController.dart';



class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Obx(
                  () => ListView.builder(
                itemCount: cartController.addedProduct.length,
                itemBuilder: (context, i) {
                  print("${cartController.addedProduct[i].name}");
                  return Column(
                    children: [
                      ListTile(
                        title: Text("${cartController.addedProduct[i].name}"),
                        subtitle: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.03,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      cartController.removeQuantity(product:cartController.addedProduct[i],index: i);
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          const CircleBorder()),
                                      side: MaterialStateProperty.all(
                                        BorderSide(
                                            color: Colors.black, width: 2),),),
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Obx(
                                      ()=> Text(
                                    "${cartController.productQuantity[i]}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.03,
                                  child: OutlinedButton(
                                    onPressed: () {
                                      cartController.addQuantity(productDB: cartController.addedProduct[i],index: i);
                                    },
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            const CircleBorder()),
                                        side: MaterialStateProperty.all(
                                            BorderSide(
                                                color: Colors.black, width: 2))),
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "₹ ${cartController.addedProduct[i].price}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            cartController.removeProduct(
                                productDB: cartController.addedProduct[i],quantity: cartController.productQuantity[i]);
                          },
                          icon: const Icon(
                            CupertinoIcons.delete_simple,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid, color: Colors.grey, width: 2),
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                          ()=> Text(
                        "${cartController.promo}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(onPressed: (){
                      cartController.removeDiscount(data: 0,text: "Promo Code");
                    }, icon: Icon(Icons.delete,color: Colors.black,)),
                    ElevatedButton(
                      onPressed: () {
                        Get.toNamed("/coupon_page");
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                      child: Text(
                        "Apply",
                        style:
                        TextStyle(fontSize: 14,),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Obx(
                            ()=> Text(
                          "₹ ${cartController.totalPrice}",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Shipping Fees",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,

                            fontWeight: FontWeight.w500
                        ),
                      ),
                      Text(
                        "₹ 29",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Discount",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      Obx(
                            ()=> Text(
                          "₹ ${cartController.discount}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(()=> Text(
                        "Total (Qty : ${cartController.totalQuantity})",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                      Obx(()=> Text(
                        "₹ ${cartController.totalPrice + 29 - cartController.discount.value}",
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: size.width/1.1,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Continue Pay",style: TextStyle(fontSize: 18,color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}