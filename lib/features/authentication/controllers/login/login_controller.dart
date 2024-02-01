import 'package:app_moi/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/model/user_model.dart';
import '../../../../data/repositories/authentication/authentication_repositories.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../../../utils/popups/loaders.dart';

class LoginController extends GetxController   {
  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try{
      /// Start Loading
      TFullScreenLoader.openLoadingDialog('Login....', TImages.loading);

      /// Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      if(!loginFormKey.currentState!.validate()){
        TFullScreenLoader.stopLoading();
        return;
      }
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      /// Register user in the Firebase Authentication & Save in the Firebase
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Move to verify email success
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }
  /// Google SignIn Authentication
  Future<void> googleSignIn() async {
    try{
      TFullScreenLoader.openLoadingDialog('Login....', TImages.loading);

      /// Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        TFullScreenLoader.stopLoading();
        return;
      }

      /// Google Authentication
      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      /// Save userRecord
      await userController.saveUserRecord(userCredential);

      /// Remove Loader
      TFullScreenLoader.stopLoading();

      /// Move to verify email success
      AuthenticationRepository.instance.screenRedirect();

    }catch(e){
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'On Snap!', message: e.toString());
    }
  }
}