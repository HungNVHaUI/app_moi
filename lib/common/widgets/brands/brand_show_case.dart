import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/container/rounded_container.dart';
import 'brand_card.dart';


class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key, required this.image,

  });

  final List<String> image;

  @override
  Widget build(BuildContext context) {

    return TRoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          const TBrandCard(showBorder: false,),
          Row(
            children: image.map((image) => brandTopProductImageWidget(image, context)).toList(),
          )
        ],
      ),
    );
  }
  Widget brandTopProductImageWidget(String image, context){
    final dark = THelperFunctions.isDarkMode(context);
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: dark? TColors.darkGrey : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(fit: BoxFit.contain, image: AssetImage(image),),
      ),
    );
  }
}