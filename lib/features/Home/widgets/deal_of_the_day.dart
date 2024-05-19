import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/features/Home/services/home_services.dart';
import 'package:amazon_clone/features/product_page/screens/product_details.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DealOfTheDay extends StatefulWidget {
  const DealOfTheDay({super.key});

  @override
  State<DealOfTheDay> createState() => _DealOfTheDayState();
}

class _DealOfTheDayState extends State<DealOfTheDay> {
  Product? product;
  final HomeServices homeServices = HomeServices();

  @override
  void initState() {
    super.initState();
    fetchDealOfTheDay();
  }

  void fetchDealOfTheDay() async {
    setState(() {
      product = null;
    });
    await Future.delayed(const Duration(seconds: 1));
    product = await homeServices.fetchDealOfTheDay(context: context);
  }

  void navigateToDetailsScreen() {
    Navigator.pushNamed(context, ProductDetails.routeName, arguments: product);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Product?>(
      future: homeServices.fetchDealOfTheDay(context: context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Loader();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final product = snapshot.data!;
          return product.name.isEmpty
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ProductDetails.routeName,
                      arguments: product,
                    );
                  },
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
                        product.images[0],
                        fit: BoxFit.cover,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: const EdgeInsets.only(
                          left: 15.0,
                        ),
                        child: Text(
                          '\$${product.price}',
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
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: product.images
                              .map((e) => Image.network(
                                    e,
                                    fit: BoxFit.cover,
                                    height: 100.0,
                                  ))
                              .toList(),
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
        } else {
          return const Text('No data');
        }
      },
    );
  }
}
