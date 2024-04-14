import 'package:amazon_clone/constants/global_var.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 10.0,
              top: 15.0,
            ),
            child: const Text(
              'Deal of the Day',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          Image.network(
            '',
            height: 235.0,
            fit: BoxFit.fitHeight,
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              '\$xyz',
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 5.0,
              right: 40.0,
            ),
            child: Text(
              'XYZ',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(''),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 15.0,
            ).copyWith(
              left: 15.0,
            ),
            alignment: Alignment.topLeft,
            child: Text(
              'See all Deals',
              style: TextStyle(
                color: GlobalVariables.selectedNavBarColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
