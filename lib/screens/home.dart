// ignore_for_file: annotate_overrides, deprecated_member_use

import 'package:fashion_ecommerce_app/data/app-data.dart';
import 'package:fashion_ecommerce_app/models/base-model.dart';
import 'package:fashion_ecommerce_app/screens/details.dart';
import 'package:fashion_ecommerce_app/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:fashion_ecommerce_app/models/categories-model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _controller;
  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 2, viewportFraction: 0.7);
  }

  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: width,
        height: height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Two Text
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "Find Your ",
                            style: theme.displayLarge,
                            children: [
                              TextSpan(
                                text: "Style",
                                style: theme.displayLarge?.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            text: "Be More Beautiful With Our ",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: "Suggestions :)",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Categories
                FadeInUp(
                  delay: const Duration(milliseconds: 350),
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: width,
                    height: height * 0.16,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        CategoriesModle current = categories[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(current.imageUrl),
                                radius: 35,
                              ),
                              SizedBox(height: height * .008),
                              Text(
                                current.title,
                                style: theme.titleMedium,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Body
                FadeInUp(
                  delay: const Duration(milliseconds: 300),
                  child: Container(
                    margin: const EdgeInsets.only(top: 4),
                    width: width,
                    height: height * 0.45,
                    child: PageView.builder(
                      controller: _controller,
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      itemBuilder: (ctx, index) {
                        // BaseModel data = mainList[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Details(
                                            data: mainList[index],
                                            isCameFromeMostPopularCart: false,
                                          )));
                            },
                            child: view(index, theme, size));
                      },
                    ),
                  ),
                ),
                // Most Popular Text
                FadeInUp(
                  delay: const Duration(milliseconds: 450),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Most popular",
                          style: theme.headline3,
                        ),
                        Text(
                          "See All",
                          style: theme.headline4,
                        )
                      ],
                    ),
                  ),
                ),
                // Most Popular Content
                const SizedBox(height: 25),
                FadeInUp(
                  delay: const Duration(milliseconds: 500),
                  child: SizedBox(
                    width: width,
                    height: height * 0.44,
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: mainList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: .68),
                      itemBuilder: (ctx, index) {
                        BaseModel current = mainList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Details(
                                        data: mainList[index],
                                        isCameFromeMostPopularCart: true)));
                          },
                          child: Column(
                            children: [
                              Hero(
                                tag: current.imageUrl,
                                child: Container(
                                  margin: const EdgeInsetsDirectional.all(10),
                                  height: height * 0.26,
                                  width: width * 0.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      image: DecorationImage(
                                          image: AssetImage(current.imageUrl),
                                          fit: BoxFit.fill),
                                      boxShadow: const [
                                        BoxShadow(
                                          offset: Offset(0, 4),
                                          blurRadius: 4,
                                          color: Colors.black,
                                        )
                                      ]),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  current.name,
                                  style: theme.headline2,
                                ),
                              ),
                              RichText(
                                  text: TextSpan(
                                      text: "€",
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                      children: [
                                    TextSpan(
                                      text: current.price.toString(),
                                      style: theme.subtitle2?.copyWith(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ]))
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget view(int index, TextTheme theme, Size size) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (ctx, child) {
          double value = 0.0;
          if (_controller.position.haveDimensions) {
            value = index.toDouble() - (_controller.page ?? 0);
            value = (value * 0.04).clamp(-1, 1);
          }
          return Transform.rotate(
            angle: 3.14 * value,
            child: _buildCard(mainList[index], theme, size),
          );
        });
  }

  Widget _buildCard(BaseModel data, TextTheme theme, Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          Hero(
            tag: data.id,
            child: Container(
              width: size.width * 0.6,
              height: size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                image: DecorationImage(
                  image: AssetImage(data.imageUrl),
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
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              data.name,
              style: theme.headline2,
            ),
          ),
          RichText(
            text: TextSpan(
              text: "€",
              style: theme.subtitle2?.copyWith(
                color: primaryColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: data.price.toString(),
                  style: theme.subtitle2
                      ?.copyWith(fontWeight: FontWeight.w600, fontSize: 25),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
