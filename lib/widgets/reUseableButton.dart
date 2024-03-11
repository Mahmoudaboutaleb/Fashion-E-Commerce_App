// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class reUseableButton extends StatelessWidget {
  const reUseableButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.icondata,
  });

  final String text;
  final VoidCallback onTap;
  final IconData icondata;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Center(
        child: MaterialButton(
          minWidth: size.width * 0.85,
          height: size.height * 0.075,
          color: Colors.black,
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Icon(
                icondata,
                color: Colors.white,
                size: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
