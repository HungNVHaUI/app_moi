import 'package:flutter/material.dart';

import '../custom_shapes/container/rounded_container.dart';
import '../images/circular_image.dart';
import '../texts/brand_title_text_with_verified_icon.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.showBorder = true,
    this.backgroundColor = Colors.transparent,
    this.imageUrl = TImages.kitDesign,
    this.isNetworkImage = false,
    this.onTab,
    this.textOverflow = '200 Productsxxxxxxxxxxx',
    this.titleBrand = 'Kit',
  });

  final bool showBorder;
  final Color backgroundColor;
  final String imageUrl;
  final bool isNetworkImage;
  final VoidCallback? onTab;
  final String textOverflow;
  final String titleBrand;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTab,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TCircularImage(
                image: imageUrl,
                isNetworkImage: isNetworkImage,
                backgroundColor: backgroundColor,
                overlayColor: dark ? TColors.white : TColors.black,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleWithVerifiedIcon(
                    title: titleBrand,
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    textOverflow,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
