import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:app_moi/common/widgets/success_screen/success_screen.dart';
import 'package:app_moi/features/shop/screens/cart/widgets/cart_items_product.dart';
import 'package:app_moi/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:app_moi/features/shop/screens/checkout/widgets/billing_amount_setion.dart';
import 'package:app_moi/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/products/cart/coupon_widget.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';


class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TCartItemsProduct(showAddRemoveButtons: false,),
              const SizedBox(height: TSizes.spaceBtwItems),
              /// Coupon
              const TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Billing
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwSections),
                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Payment
                    TBillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwSections),

                    /// Address
                    TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.fullPayment,
                  title: 'Payment Success!',
                  subTitle: 'Your item will be shipped soon!',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text('Checkout \$256'),
          ),
        )
    );
  }
}


