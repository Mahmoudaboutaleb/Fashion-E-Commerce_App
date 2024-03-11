import 'package:flutter/material.dart';

class ShoesPages extends StatelessWidget {
  const ShoesPages({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Shoes Page",
            style: textTheme.titleSmall?.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Text(
            "Shoes Pages",
            style: textTheme.displaySmall,
          ),
        ));
  }
}
