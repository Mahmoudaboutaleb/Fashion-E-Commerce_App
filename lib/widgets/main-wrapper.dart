// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:fashion_ecommerce_app/pages/bags.dart';
import 'package:fashion_ecommerce_app/pages/jacket.dart';
import 'package:fashion_ecommerce_app/pages/shirt.dart';
import 'package:fashion_ecommerce_app/pages/shoes.dart';
import 'package:fashion_ecommerce_app/screens/cart.dart';
import 'package:fashion_ecommerce_app/screens/home.dart';
import 'package:fashion_ecommerce_app/screens/search.dart';
import 'package:fashion_ecommerce_app/utils/constans.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  List<String> itemsList = ["Jacket", "Shirt", "Shoes", "Bags"];
  String selectItems = "Jacket";
  final int _index = 0;
  bool _isActiveSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _isActiveSearch
            ? FadeInUp(
                duration: const Duration(milliseconds: 300),
                child: const Text(
                  "Search",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
            : FadeInUp(
                delay: const Duration(milliseconds: 300),
                child: const Text(
                  "Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
        leading: PopupMenuButton<String>(
          offset: const Offset(35, 40),
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          itemBuilder: (BuildContext context) => [
            const PopupMenuItem<String>(
              value: 'jacket',
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.cloudsmith,
                    color: Colors.lightBlue,
                    size: 20,
                  ),
                  SizedBox(width: 14),
                  Text(
                    'Jackets',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'shoes',
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.shoePrints,
                    color: Colors.lightBlue,
                    size: 20,
                  ),
                  SizedBox(width: 14),
                  Text('Shoes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'shirt',
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.shirt,
                    color: Colors.lightBlue,
                    size: 20,
                  ),
                  SizedBox(width: 14),
                  Text('Shirts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            const PopupMenuItem<String>(
              value: 'bags',
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bagShopping,
                    color: Colors.lightBlue,
                    size: 20,
                  ),
                  SizedBox(width: 14),
                  Text('Bags',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ],
          onSelected: (value) {
            if (value == 'jacket') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const JacketPages()));
            } else if (value == 'shoes') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShoesPages()));
            } else if (value == 'shirt') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const ShirtPages()));
            } else if (value == 'bags') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const BagsPages()));
            }
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  _isActiveSearch = !_isActiveSearch;
                });
              },
              icon: _isActiveSearch
                  ? const Icon(
                      LineIcons.searchMinus,
                      color: Colors.black,
                      size: 30,
                    )
                  : const Icon(
                      LineIcons.search,
                      size: 30,
                      color: Colors.black,
                    )),
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              icon: const Icon(
                LineIcons.shoppingBag,
                color: Colors.black,
                size: 30,
              ))
        ],
      ),
      body: _isActiveSearch ? const Search() : const Home(),
      bottomNavigationBar:
          BottomBarBubble(color: primaryColor, selectedIndex: _index, items: [
        BottomBarItem(iconData: Icons.home),
        BottomBarItem(iconData: Icons.search),
        BottomBarItem(iconData: Icons.explore),
        BottomBarItem(iconData: Icons.settings),
        BottomBarItem(iconData: Icons.mail)
      ]),
    );
  }
}
