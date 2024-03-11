import 'package:flutter/material.dart';

class JacketPages extends StatelessWidget {
  const JacketPages({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Jackets Page",
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
            "Jacket Pages",
            style: textTheme.displaySmall,
          ),
        ));
  }
}
