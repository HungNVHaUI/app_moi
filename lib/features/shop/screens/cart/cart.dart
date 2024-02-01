import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/features/shop/screens/cart/widgets/cart_items_product.dart';

import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../checkout/checkout.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItemsProduct(showAddRemoveButtons: true,),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()),child: const Text('Checkout \$256'),),
      ),
    );
  }
}






