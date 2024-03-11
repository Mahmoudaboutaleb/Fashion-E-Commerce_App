// ignore_for_file: file_names

import 'package:advance_notification/advance_notification.dart';
import 'package:fashion_ecommerce_app/data/app-data.dart';
import 'package:fashion_ecommerce_app/models/base-model.dart';
import 'package:flutter/material.dart';

class AddToCart {
  static void addToCart(BaseModel data, BuildContext context) {
    bool contains = itemsOnCart.any((item) => item.id == data.id);
    if (contains) {
      const AdvanceSnackBar(
        bgColor: Colors.red,
        duration: Duration(milliseconds: 600),
        message: "You have Add This Item To Cart Before !",
        textSize: 15,
        textColor: Colors.white,
        mode: Mode.ADVANCE,
      ).show(context);
    } else {
      int selectedIndex = mainList.indexOf(data);
      if (selectedIndex != -1) {
        itemsOnCart.add(data);
        const AdvanceSnackBar(
          bgColor: Colors.blue,
          duration: Duration(milliseconds: 600),
          textSize: 15,
          message: "Successfully Added To Your Cart :(",
          mode: Mode.ADVANCE,
        ).show(context);
      }
    }
  }
}
