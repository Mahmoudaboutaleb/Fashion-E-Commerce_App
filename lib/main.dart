import 'package:fashion_ecommerce_app/utils/app-theme.dart';
import 'package:fashion_ecommerce_app/widgets/main-wrapper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const MainWrapper(),
    ));
