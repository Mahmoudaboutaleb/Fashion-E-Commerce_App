import 'package:flutter/material.dart';

class ShirtPages extends StatelessWidget {
  const ShirtPages({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Shirt Page",style: textTheme.titleSmall?.copyWith(
          color: Colors.white,
          fontSize: 20,
        ),),
        centerTitle: true,
        elevation: 0,
        
      ),

        body: Center(
      child: Text(
        "Shirt Pages",
        style: textTheme.displaySmall,
      ),
    ));
  }
}
