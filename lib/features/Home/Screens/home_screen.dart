import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/features/Home/widgets/Address_box.dart';
import 'package:amazon_clone/features/Home/widgets/carousel_image.dart';
import 'package:amazon_clone/features/Home/widgets/categories.dart';
import 'package:amazon_clone/features/Home/widgets/deal_of_the_day.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42.0,
                  margin: const EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: Material(
                    borderRadius: BorderRadius.circular(7.0),
                    elevation: 1.0,
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 6.0,
                              ),
                              child: Icon(Icons.search,
                                  color: GlobalVariables.blackColor,
                                  size: 23.0),
                            ),
                          ),
                          filled: true,
                          fillColor: GlobalVariables.backgroundColor,
                          contentPadding: const EdgeInsets.only(
                            top: 10.0,
                          ),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7.0),
                            ),
                            borderSide: BorderSide(
                              color: GlobalVariables.borderColor,
                              width: 1.0,
                            ),
                          ),
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0,
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                color: GlobalVariables.transparent,
                height: 42.0,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Icon(
                  Icons.mic,
                  color: GlobalVariables.blackColor,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          AddressBox(),
          SizedBox(
            height: 10.0,
          ),
          Categories(),
          SizedBox(
            height: 10.0,
          ),
          CarouselImage(),
          DealOfTheDay(),
        ],
      ),
    );
  }
}
