import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/common/widgets/images/circular_image.dart';
import 'package:app_moi/common/widgets/texts/section_heading.dart';
import 'package:app_moi/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Profile'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const TCircularImage(image: TImages.user, width: 80, height: 80,),
                    TextButton(onPressed: (){}, child: const Text('Edit Profile Image'))
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwItems/2,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TSectionHeading(title: 'Profile Information',),
              const SizedBox(height: TSizes.spaceBtwItems,),

              TProfileMenu(title: 'Name', value: 'Automation Supply', onTap: (){}),
              TProfileMenu(title: 'Username', value: 'HungNV', onTap: (){}),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              const TSectionHeading(title: 'Personal Information',),
              const SizedBox(height: TSizes.spaceBtwItems,),
              TProfileMenu(title: 'UserID', value: '0979553398', icon: Iconsax.copy, onTap: (){}),
              TProfileMenu(title: 'Email', value: 'hungnv.haui@gmail.com', onTap: (){}),
              TProfileMenu(title: 'Phone', value: '+84979553398', onTap: (){}),
              TProfileMenu(title: 'Gender', value: 'Male', onTap: (){}),
              TProfileMenu(title: 'Date of Brith', value: '06-04-1996', onTap: (){}),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems,),
              Center(
                child: TextButton(
                  onPressed: (){},
                  child: const Text('Close', style: TextStyle(color: Colors.red)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
