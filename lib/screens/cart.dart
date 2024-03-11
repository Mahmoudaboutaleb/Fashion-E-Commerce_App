// ignore_for_file: list_remove_unrelated_type

import 'package:animate_do/animate_do.dart';
import 'package:fashion_ecommerce_app/data/app-data.dart';
import 'package:fashion_ecommerce_app/models/base-model.dart';
import 'package:fashion_ecommerce_app/utils/constans.dart';
import 'package:fashion_ecommerce_app/widgets/main-wrapper.dart';
import 'package:fashion_ecommerce_app/widgets/reUseableButton.dart';
import 'package:fashion_ecommerce_app/widgets/reUseableRowCart.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double calculateTotal() {
    double total = 0.0;
    if (itemsOnCart.isEmpty) {
      total = 0.0;
    } else {
      for (BaseModel data in itemsOnCart) {
        total = total +
            data.price * data.value -
            (calculateShipping() + calculateSubTotal());
      }
    }
    return total;
  }

  double calculateShipping() {
    double shipping = 0;
    if (itemsOnCart.isEmpty) {
      shipping = 0;
    } else if (itemsOnCart.length <= 3) {
      shipping = 25.99;
    } else {
      shipping = 88.99;
    }
    return shipping.floorToDouble();
  }

  int calculateSubTotal() {
    int subTotal = 0;
    if (itemsOnCart.isEmpty) {
      subTotal = 0;
    } else {
      for (BaseModel data in itemsOnCart) {
        subTotal = subTotal + data.price.round();
        subTotal = subTotal - 160;
      }
    }
    return subTotal < 0 ? 0 : subTotal;
  }

  void onDelete(BaseModel data) {
    setState(() {
      if (itemsOnCart.length == 1) {
        itemsOnCart.clear();
      } else {
        itemsOnCart.remove(data);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: _buildAppBarCart(context),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height * 0.56,
              child: itemsOnCart.isNotEmpty
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: itemsOnCart.length,
                      itemBuilder: (context, index) {
                        final current = itemsOnCart[index];
                        return Container(
                          margin: const EdgeInsets.all(5),
                          height: size.height * 0.24,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FadeInLeftBig(
                                delay: Duration(milliseconds: 200 * index),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      image: DecorationImage(
                                          image: AssetImage(current.imageUrl),
                                          fit: BoxFit.cover),
                                      boxShadow: const [
                                        BoxShadow(
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          color: Colors.grey,
                                          offset: Offset(1, -1),
                                        )
                                      ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.533,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            current.name,
                                            style: textTheme.displaySmall,
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              onDelete(current);
                                            },
                                            icon: const Icon(
                                              Icons.close_sharp,
                                              color: Colors.grey,
                                              size: 22,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.002,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: "€",
                                            style: textTheme.displaySmall
                                                ?.copyWith(
                                              color: primaryColor,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            children: [
                                          TextSpan(
                                              text: current.price.toString(),
                                              style: textTheme.displaySmall
                                                  ?.copyWith(fontSize: 20))
                                        ])),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Text(
                                      "Size = ${sizes[3]}",
                                      style: textTheme.titleSmall?.copyWith(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),
                                    SizedBox(
                                      width: size.width * 0.35,
                                      height: size.height * 0.05,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: size.width * 0.068,
                                              height: size.height * 0.033,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1.5)),
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      if (current.value > 0) {
                                                        current.value--;
                                                      } else {
                                                        // itemOnCart.
                                                        // .remove(current);
                                                        onDelete(current);
                                                        current.value = 1;
                                                      }
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.remove,
                                                    size: 18,
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                current.value.toString(),
                                                style: textTheme.titleSmall
                                                    ?.copyWith(
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: size.width * 0.068,
                                              height: size.height * 0.033,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1.5)),
                                              child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      current.value >= 0
                                                          ? current.value++
                                                          : null;
                                                    });
                                                  },
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 18,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  : FadeInUpBig(
                      delay: const Duration(milliseconds: 200),
                      child: Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          const Image(
                            image: AssetImage("assets/image/empty.png"),
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            "Yor Cart Is Empty Right Now :(",
                            style: textTheme.headlineSmall,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MainWrapper()));
                              },
                              icon: const Icon(
                                LineIcons.shoppingBag,
                                size: 27,
                              ))
                        ],
                      ),
                    ),
            ),
            // product price
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.height * 0.34,
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 10, top: 15, bottom: 15),
                      child: FadeInUpBig(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Promp/Student Code Or Vourchers",
                              style: textTheme.displaySmall?.copyWith(
                                fontSize: 16,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_sharp,
                              size: 17,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.008,
                    ),
                    FadeInDownBig(
                        delay: const Duration(milliseconds: 200),
                        child: ReUseableTextRow(
                            text: "Sub Total",
                            price: calculateSubTotal().toDouble())),
                    SizedBox(
                      height: size.height * 0.0075,
                    ),
                    FadeInDownBig(
                        delay: const Duration(milliseconds: 200),
                        child: ReUseableTextRow(
                            text: "Shipping", price: calculateShipping())),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 7),
                      child: Divider(),
                    ),
                    FadeInDownBig(
                        delay: const Duration(milliseconds: 200),
                        child: ReUseableTextRow(
                            text: "Total", price: calculateTotal())),
                    FadeInDownBig(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: reUseableButton(
                            text: itemsOnCart.isNotEmpty
                                ? "Check Out"
                                : "Add Item",
                            onTap: () {
                              itemsOnCart.isNotEmpty
                                  ? Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Cart()))
                                  : Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainWrapper()));
                            },
                            icondata: itemsOnCart.isNotEmpty
                                ? Icons.shopping_bag_outlined
                                : Icons.add_shopping_cart_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBarCart(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              LineIcons.user,
              size: 28,
              color: Colors.black,
            ))
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: const Text(
        "My Cart",
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
