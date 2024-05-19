import 'package:amazon_clone/common/widgets/loader.dart';
import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/features/Home/widgets/Address_box.dart';
import 'package:amazon_clone/features/product_page/screens/product_details.dart';
import 'package:amazon_clone/features/search/services/search_services.dart';
import 'package:amazon_clone/features/search/widgets/search_product.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/search-screen';
  final String searchQuery;
  const SearchScreen({
    super.key,
    required this.searchQuery,
  });

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Product>? products;
  final SearchServices searchServices = SearchServices();

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    products = await searchServices.fetchSearchedProducts(
      context: context,
      searchQuery: widget.searchQuery,
    );
    setState(() {});
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(
      context,
      SearchScreen.routeName,
      arguments: query,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      onFieldSubmitted: navigateToSearchScreen,
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
                child: const Icon(
                  Icons.mic,
                  color: GlobalVariables.blackColor,
                  size: 25.0,
                ),
              ),
            ],
          ),
        ),
      ),
      body: products == null
          ? const Loader()
          : Column(
              children: [
                AddressBox(),
                const SizedBox(
                  height: 10.0,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: products!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ProductDetails.routeName,
                            arguments: products![index],
                          );
                        },
                        child: Column(
                          children: [
                            SearchedProduct(
                              product: products![index],
                            ),
                            SizedBox(
                              height: 20.0,
                              child: Divider(
                                color:
                                    GlobalVariables.boxColor.withOpacity(0.08),
                                thickness: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
