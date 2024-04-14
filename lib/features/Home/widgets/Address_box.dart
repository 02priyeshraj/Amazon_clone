import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 40.0,
      decoration: const BoxDecoration(
        gradient: GlobalVariables.belowAppBarGradient,
      ),
      padding: const EdgeInsets.only(
        left: 10.0,
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on_outlined,
            size: 20.0,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                'Delivery to ${user.name}  - ${user.address}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 5.0,
              top: 1.0,
              right: 8.0,
            ),
            child: Icon(
              Icons.arrow_drop_down_circle_outlined,
              size: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
