import 'package:app_moi/common/widgets/texts/product_price_text.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/products/cart/add_remove_button.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
class TCartItemsProduct extends StatelessWidget {
  const TCartItemsProduct({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: TSizes.spaceBtwSections,),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          const TCartItem(),
          if(showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
          if(showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 70,),
                  TProductWithAddRemoveButton(),
                ],
              ),
              /// Add, remove button

              TProductPriceText(price: '256')

            ],
          )
        ],
      ),
    );
  }
}