import 'package:app_moi/data/model/user_model.dart';
import 'package:app_moi/data/repositories/authentication/authentication_repositories.dart';
import 'package:app_moi/features/authentication/screens/signup/verify_email.dart';
import 'package:app_moi/utils/constants/image_strings.dart';
import 'package:app_moi/utils/helpers/network_manager.dart';
import 'package:app_moi/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/user/user_repositories.dart';
import '../../../../utils/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final  email = TextEditingController();
  final  lastName = TextEditingController();
  final  userName = TextEditingController();
  final  password = TextEditingController();
  final  firstName = TextEditingController();
  final  phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try{
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('We are processing your information....', TImages.checkSignUp);

      /// Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        //TFullScreenLoader.stopLoading();
        return;
      }

      if(!signupFormKey.currentState!.validate()){
        //TFullScreenLoader.stopLoading();
        return;
      }
      if(!privacyPolicy.value){
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message: 'In order to create Account, you must read and accept Privacy Policy & Terms of Use'
        );
        return;
      }
      /// Register user in the Firebase Authentication & Save in the Firebase
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Save Authentication user data in the Firebase, Firestore
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: ''
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      /// Remove Loader
      TFullScreenLoader.stopLoading();
      /// Show success message
      TLoaders.successSnackBar(title: 'Congratulations', message: 'Your Account has been created');

      /// Move to verify email success
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }
}