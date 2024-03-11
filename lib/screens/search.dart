// ignore_for_file: deprecated_member_use

import 'package:animate_do/animate_do.dart';
import 'package:fashion_ecommerce_app/data/app-data.dart';
import 'package:fashion_ecommerce_app/methods/addToCart.dart';
import 'package:fashion_ecommerce_app/models/base-model.dart';
import 'package:fashion_ecommerce_app/screens/details.dart';
import 'package:fashion_ecommerce_app/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    itemsOnSearch = mainList;
    super.initState();
  }

  onSearchFun(String search) {
    setState(() {
      itemsOnSearch = mainList
          .where((element) => element.name.toLowerCase().contains(search))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              // Text FormField
              FadeInUp(
                delay: const Duration(milliseconds: 50),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                  child: SizedBox(
                    width: size.width,
                    height: size.height * 0.07,
                    child: TextField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(13),
                        ),
                        fillColor: Colors.grey[200],
                        contentPadding: EdgeInsets.symmetric(
                          vertical: size.height * 0.023,
                          horizontal: 10,
                        ),
                        hintText: "e.g.Casual Jeans",
                        hintStyle: textTheme.headline3?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[600],
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            controller.clear();
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ),
                      controller: controller,
                      onChanged: (value) => onSearchFun(value),
                      style: textTheme.headline3?.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
              Expanded(
                child: itemsOnSearch.isNotEmpty
                    ? GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: itemsOnSearch.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.63,
                        ),
                        itemBuilder: (context, index) {
                          BaseModel current = itemsOnSearch[index];
                          return FadeInUp(
                            delay: Duration(milliseconds: 100 * index),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Details(
                                            data: itemsOnSearch[index],
                                            isCameFromeMostPopularCart:
                                                false)));
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: size.height * 0.02,
                                    right: size.width * 0.01,
                                    left: size.width * 0.01,
                                    child: Hero(
                                      tag: current.id,
                                      child: Container(
                                        margin:
                                            const EdgeInsetsDirectional.all(10),
                                        height: size.height * 0.3,
                                        width: size.width * 0.5,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(3),
                                          image: DecorationImage(
                                            image: AssetImage(current.imageUrl),
                                            fit: BoxFit.cover,
                                          ),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 4),
                                              blurRadius: 4,
                                              color: Colors.black,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.02,
                                    child: Text(
                                      current.name,
                                      style: textTheme.headline2,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: size.height * 0.001,
                                    child: RichText(
                                        text: TextSpan(
                                            text: "€ ",
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: primaryColor,
                                            ),
                                            children: [
                                          TextSpan(
                                            text: current.price.toString(),
                                            style: textTheme.subtitle2
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ])),
                                  ),
                                  Positioned(
                                    top: size.height * 0.01,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: primaryColor,
                                      child: IconButton(
                                        onPressed: () {
                                          AddToCart.addToCart(current, context);
                                        },
                                        icon: const Icon(
                                            LineIcons.addToShoppingCart),
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/search_fail.png",
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          FadeInUp(
                            delay: const Duration(milliseconds: 150),
                            child: const Text(
                              "No Result Found :(",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
