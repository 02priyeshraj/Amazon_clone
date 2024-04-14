import 'package:amazon_clone/constants/global_var.dart';
import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String img;
  const SingleProduct({super.key, required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 5.0,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: GlobalVariables.boxColor,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(5.0),
          color: GlobalVariables.backgroundColor,
        ),
        child: Container(
          width: 180.0,
          padding: const EdgeInsets.all(10.0),
          child: Image.network(
            img,
            fit: BoxFit.fitHeight,
            width: 180.0,
          ),
        ),
      ),
    );
  }
}
