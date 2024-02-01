import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
    required this.image,
    this.overlayColor,

  });

  final double width, height, padding;
  final String image;
  final BoxFit? fit;
  final Color? overlayColor,backgroundColor;
  final bool isNetworkImage;




  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor?? (dark? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(100)
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage? NetworkImage(image) : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),

    );
  }
}