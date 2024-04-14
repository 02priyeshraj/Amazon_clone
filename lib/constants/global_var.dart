import 'package:flutter/material.dart';

String uri = 'http://<IP_Address>:3000';

class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );
  static const belowAppBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 114, 226, 221),
      Color.fromARGB(255, 162, 236, 233),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundColor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static var floatingActionButton = Color.fromARGB(255, 3, 180, 196);
  static const unselectedNavBarColor = Colors.black87;
  static const blackColor = Colors.black;
  static const boxColor = Colors.black12;
  static const borderColor = Colors.black38;
  static const transparent = Colors.transparent;
  static var greyColor = Colors.grey.shade400;

  // STATIC IMAGES
  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Fashion/Event/N2GL_sep/Ingress-SEP.jpg',
    'https://images.firstpost.com/wp-content/uploads/2019/04/Amazon-Summer-Sale.jpg',
    'https://i.gadgets360cdn.com/large/amazon-prime-day-2020-large_1596679822271.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Fashion',
      'image': 'assets/images/fashion.jpeg',
    },
    {
      'title': 'Mobiles',
      'image': 'assets/images/mobiles.jpeg',
    },
    {
      'title': 'Essentials',
      'image': 'assets/images/essentials.jpeg',
    },
    {
      'title': 'Groceries',
      'image': 'assets/images/groceries.png',
    },
    {
      'title': 'Appliances',
      'image': 'assets/images/appliances.jpeg',
    },
    {
      'title': 'Books',
      'image': 'assets/images/books.jpeg',
    },
    {
      'title': 'Beauty',
      'image': 'assets/images/Beauty.png',
    },
  ];
}
