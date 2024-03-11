import 'package:animate_do/animate_do.dart';
import 'package:fashion_ecommerce_app/methods/addToCart.dart';
import 'package:fashion_ecommerce_app/models/base-model.dart';
import 'package:fashion_ecommerce_app/utils/constans.dart';
import 'package:fashion_ecommerce_app/widgets/reUseableButton.dart';
import 'package:fashion_ecommerce_app/widgets/reUseableForm.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details(
      {super.key,
      required this.data,
      required this.isCameFromeMostPopularCart});

  final BaseModel data;
  final bool isCameFromeMostPopularCart;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int sizeSelected = 3;
  int colorSelected = 2;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    BaseModel product = widget.data;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: _detailsAppBar(),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // product Image
            SizedBox(
              width: size.width,
              height: size.height * 0.5,
              child: Stack(
                children: [
                  // Top Image
                  Hero(
                    tag: widget.isCameFromeMostPopularCart
                        ? product.imageUrl
                        : product.id,
                    child: Container(
                      width: size.width,
                      height: size.height * 0.5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(product.imageUrl),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * .12,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: gradient,
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // product Information
            FadeInUp(
              delay: const Duration(milliseconds: 150),
              child: SizedBox(
                width: size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: textTheme.displaySmall,
                      ),
                      reuseableTextForDetails(text: product.price.toString()),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.008,
            ),
            // product Information
            FadeInUp(
              delay: const Duration(milliseconds: 200),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 7,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: size.width * 0.006,
                    ),
                    Text(
                      product.star.toString(),
                      style: textTheme.headlineSmall,
                    ),
                    SizedBox(
                      width: size.width * 0.016,
                    ),
                    Text("${product.review} k + review",
                        style: textTheme.headlineSmall?.copyWith(
                          color: Colors.grey,
                        )),
                    SizedBox(
                      width: size.width * 0.002,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
            // Select Size Text
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 20, bottom: 10),
              child: Text(
                "Select Size",
                style: textTheme.displaySmall,
              ),
            ),
            // Select Size number
            FadeInRightBig(
              child: SizedBox(
                width: size.width * 0.92,
                height: size.height * 0.085,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: sizes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final current = sizes[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          sizeSelected = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 7),
                        width: size.width * 0.135,
                        decoration: BoxDecoration(
                            color: sizeSelected == index
                                ? primaryColor
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: primaryColor, width: 2)),
                        child: Center(
                          child: Text(
                            current,
                            style: textTheme.displaySmall?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: sizeSelected == index
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Select Color Text
            Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 20, bottom: 10),
              child: Text(
                "Select Color",
                style: textTheme.displaySmall,
              ),
            ),
            // Selected Color
            SizedBox(
              width: size.width * 0.92,
              height: size.height * 0.08,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: colors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final current = colors[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        colorSelected = index;
                      });
                    },
                    child: FadeInLeftBig(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 8),
                          width: size.width * 0.12,
                          decoration: BoxDecoration(
                              color: current,
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                  color: colorSelected == index
                                      ? Colors.deepPurple
                                      : Colors.transparent,
                                  width: 2.5),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 1.5,
                                    spreadRadius: 1,
                                    offset: Offset(0, 0))
                              ]),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            FadeInDown(
              delay: const Duration(milliseconds: 370),
              child: GestureDetector(
                onTap: () {
                  AddToCart.addToCart(product, context);
                },
                child: reUseableButton(
                  text: 'Add To Cart',
                  icondata: Icons.add_shopping_cart_sharp,
                  onTap: () {
                    AddToCart.addToCart(product, context);
                  },
                ),
              ),
            ),
            // FadeInDown(
            //     delay: const Duration(milliseconds: 370),
            //     child: reUseableButton(
            //       onTap: () {
            //         AddToCart.addToCart(product, context);

            //       },
            //       text: 'Add To Cart',
            //       icondata: Icons.add_shopping_cart_sharp,
            //     )),
          ],
        ),
      ),
    );
  }

  AppBar _detailsAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
          color: Colors.white,
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),
        color: Colors.white,
      ),
    );
  }
}
