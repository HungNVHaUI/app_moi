import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/common/widgets/icons/circular_icon.dart';
import 'package:app_moi/common/widgets/layouts/grid_layout.dart';
import 'package:app_moi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_moi/features/shop/screens/home/home.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';


class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium,),
        actions: [
          TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TGridLayout(itemCount: 8, itemBuilder: (_, index) => const TProductVertical())
            ],
          ),
        ),
      ),
    );
  }
}
