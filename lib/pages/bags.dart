import 'package:flutter/material.dart';

class BagsPages extends StatelessWidget {
  const BagsPages({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
            appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Bags Page",style: textTheme.titleSmall?.copyWith(
          color: Colors.white,
          fontSize: 20,
        ),),
        centerTitle: true,
        elevation: 0,
        
      ),

        body: Center(
      child: Text(
        "Bags Pages",
        style: textTheme.displaySmall,
      ),
    ));
  }
}
