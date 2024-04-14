import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/features/account/widgets/app_bar_widget.dart';
import 'package:amazon_clone/features/account/widgets/orders.dart';
import 'package:amazon_clone/features/account/widgets/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_logo.png',
                  width: 120.0,
                  height: 45.0,
                  color: GlobalVariables.blackColor,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        right: 15.0,
                      ),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: const Column(
        children: [
          AppBarWidget(),
          SizedBox(
            height: 10.0,
          ),
          TopButtons(),
          SizedBox(
            height: 10.0,
          ),
          Orders(),
        ],
      ),
    );
  }
}
