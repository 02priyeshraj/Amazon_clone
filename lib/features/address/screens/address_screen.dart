import 'package:amazon_clone/common/widgets/custom_TextField.dart';
import 'package:amazon_clone/constants/global_var.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/address/services/address_services.dart';
import 'package:amazon_clone/payment_config.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';

class AddressScreen extends StatefulWidget {
  static const String routeName = '/address';
  final String totalAmount;
  const AddressScreen({super.key, required this.totalAmount});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _flatHouseBuildingController =
      TextEditingController();
  final TextEditingController _areaStreetController = TextEditingController();
  final TextEditingController _townCityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final AddressServices addressServices = AddressServices();

  final _addressFormKey = GlobalKey<FormState>();
  String addressToBUsed = '';
  List<PaymentItem> paymentItems = [];

  @override
  void initState() {
    super.initState();
    paymentItems.add(
      PaymentItem(
        amount: widget.totalAmount,
        label: 'Total Amount',
        status: PaymentItemStatus.final_price,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _flatHouseBuildingController.dispose();
    _areaStreetController.dispose();
    _townCityController.dispose();
    _stateController.dispose();
    _pincodeController.dispose();
  }

  void onGooglePayResult(res) {
    if (Provider.of<UserProvider>(context, listen: false)
        .user
        .address
        .isEmpty) {
      addressServices.saveUserAddress(
          context: context, address: addressToBUsed);
    }
    addressServices.placeOrder(
      context: context,
      address: addressToBUsed,
      totalSum: double.parse(widget.totalAmount),
    );
  }

  void payPressed(String addressFromProvider) {
    addressToBUsed = '';
    bool isForm = _flatHouseBuildingController.text.isNotEmpty ||
        _areaStreetController.text.isNotEmpty ||
        _townCityController.text.isNotEmpty ||
        _stateController.text.isNotEmpty ||
        _pincodeController.text.isNotEmpty;

    if (isForm) {
      if (_addressFormKey.currentState!.validate()) {
        addressToBUsed =
            '${_flatHouseBuildingController.text}, ${_areaStreetController.text}, ${_townCityController.text}, ${_stateController.text} - ${_pincodeController.text}';
      } else {
        throw Exception('Please enter all the values!!!');
      }
    } else if (addressFromProvider.isNotEmpty) {
      addressToBUsed = addressFromProvider;
    } else {
      showSnackBar(context, 'ERROR');
    }
  }

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            'Checkout',
            style: TextStyle(
              color: GlobalVariables.blackColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              if (address.isNotEmpty)
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: GlobalVariables.boxColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          address,
                          style: const TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              Form(
                key: _addressFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _flatHouseBuildingController,
                      hintText: 'Flat, House No., Building',
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _areaStreetController,
                      hintText: 'Area, Street',
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _townCityController,
                      hintText: 'Town/City',
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _stateController,
                      hintText: 'State',
                    ),
                    const SizedBox(height: 10.0),
                    CustomTextField(
                      controller: _pincodeController,
                      hintText: 'Pincode',
                    ),
                    const SizedBox(height: 10.0),
                    Divider(
                      thickness: 1.0,
                      color: GlobalVariables.boxColor.withOpacity(0.1),
                      height: 10.0,
                    )
                  ],
                ),
              ),
              GooglePayButton(
                onPressed: () => payPressed(address),
                paymentConfiguration:
                    PaymentConfiguration.fromJsonString(defaultGooglePay),
                paymentItems: paymentItems,
                onPaymentResult: onGooglePayResult,
                width: double.infinity,
                type: GooglePayButtonType.buy,
                margin: const EdgeInsets.only(top: 15.0),
                height: 50.0,
                loadingIndicator: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
