import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/common/widgets/layouts/grid_layout.dart';
import 'package:app_moi/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/products/sortable/sortable_products.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Popular Products'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}


