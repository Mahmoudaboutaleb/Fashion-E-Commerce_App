// ignore_for_file: file_names, camel_case_types

import 'package:fashion_ecommerce_app/utils/constans.dart';
import 'package:flutter/material.dart';

class reuseableTextForDetails extends StatelessWidget {
  const reuseableTextForDetails({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return RichText(
        text: TextSpan(
            text: "€",
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            ),
            children: [
          TextSpan(
            text: text,
            style: textTheme.titleSmall?.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          )
        ]));
  }
}
