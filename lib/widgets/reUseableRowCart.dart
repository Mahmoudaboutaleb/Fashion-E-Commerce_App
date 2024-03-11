// ignore_for_file: file_names

import 'package:fashion_ecommerce_app/widgets/reuseableForm.dart';
import 'package:flutter/material.dart';

class ReUseableTextRow extends StatelessWidget {
  const ReUseableTextRow({super.key, required this.text, required this.price});
  final String text;
  final double price;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: textTheme.headlineSmall
                ?.copyWith(fontSize: 18, color: Colors.grey),
          ),
          reuseableTextForDetails(text: price.toString()),
        ],
      ),
    );
  }
}
