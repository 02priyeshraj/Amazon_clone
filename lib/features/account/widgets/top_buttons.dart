import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonnsState();
}

class _TopButtonnsState extends State<TopButtons> {
  final AccountServices accountServices = AccountServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders',
              onTap: () {},
            ),
            AccountButton(
              text: 'Turn Seller',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            AccountButton(
              text: 'Your Wishlist',
              onTap: () {},
            ),
            AccountButton(
              text: 'Logout',
              onTap: () => accountServices.logOut(context: context),
            ),
          ],
        ),
      ],
    );
  }
}
