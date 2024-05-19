import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/features/cart/services/cart_services.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProduct extends StatefulWidget {
  final int index;
  const CartProduct({super.key, required this.index});

  @override
  State<CartProduct> createState() => _CartProductState();
}

class _CartProductState extends State<CartProduct> {
  final CartServices cartServices = CartServices();

  void increaseQuantity(Product product) {
    cartServices.addToCart(context: context, product: product);
  }

  void decreaseQuantity(Product product) {
    cartServices.removeFromCart(context: context, product: product);
  }

  @override
  Widget build(BuildContext context) {
    final cartProduct = context.watch<UserProvider>().user.cart[widget.index];
    final product = Product.fromMap(cartProduct['product']);
    final qty = cartProduct['quantity'];
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Row(
            children: [
              Image.network(
                product.images[0],
                fit: BoxFit.contain,
                width: 135.0,
                height: 135.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: 235.0,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 16.0,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: 235.0,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 5.0,
                      ),
                      child: Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      width: 235.0,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                      ),
                      child: const Text('Eligible for FREE Shipping'),
                    ),
                    Container(
                      width: 235.0,
                      padding: const EdgeInsets.only(
                        left: 10.0,
                        top: 5.0,
                      ),
                      child: const Text(
                        'In Stock',
                        style: TextStyle(
                          color: GlobalVariables.tealColor,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: GlobalVariables.boxColor,
                    width: 1.5,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: GlobalVariables.boxColor,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => decreaseQuantity(product),
                      child: Container(
                        width: 35.0,
                        height: 32.0,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.remove,
                          size: 18.0,
                        ),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalVariables.boxColor,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(0),
                        color: GlobalVariables.backgroundColor,
                      ),
                      child: Container(
                        width: 35.0,
                        height: 32.0,
                        alignment: Alignment.center,
                        child: Text(
                          qty.toString(),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => increaseQuantity(product),
                      child: Container(
                        width: 35.0,
                        height: 32.0,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.add,
                          size: 18.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
