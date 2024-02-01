import 'package:app_moi/common/widgets/brands/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../utils/constants/sizes.dart';
class BrandProduct extends StatelessWidget {
  const BrandProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Kit')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true,),
              SizedBox(height: TSizes.spaceBtwSections),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}

