import 'package:app_moi/common/widgets/appbar/appbar.dart';
import 'package:app_moi/features/personalization/screens/address/add_new_address.dart';
import 'package:app_moi/features/personalization/screens/address/widgets/single_address.dart';
import 'package:app_moi/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Icons.add, color: Colors.white,),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Address", style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSingleAddress(selectedAddress: false,),
              TSingleAddress(selectedAddress: true,),
            ],
          ),
        ),
      ),

    );
  }
}
