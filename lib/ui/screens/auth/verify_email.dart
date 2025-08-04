
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_adoption/controllers/auth/verify_email_controller.dart';
import 'package:pet_adoption/core/constants/sizes.dart';
import 'package:pet_adoption/core/utils/helpers/helper_functions.dart';
import 'package:pet_adoption/services/auth_service.dart';

class VerifyEmailSCreen extends StatelessWidget {
  const VerifyEmailSCreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthService.instance.signOut(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(MySizes.defaultSpacing),
        child: Column(children: [
          Image.asset(
            "assets/images/email_sent.png",
            width: MyHelperFunctions.getScreenWidth() * 0.6,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            "Email Verification",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenItems,
          ),
          Text(
            email ?? " ",
            style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: MySizes.spaceBetweenSections,
          ),
          Text(
            "A verification link has been sent to your email address. Please click the link to verify your email address.",
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: MySizes.spaceBetweenSections),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.checkEmailVerifcationStatus(),
                child:  Text("Continue",style: Theme.of(context).textTheme.labelLarge,)),
          ),
          const SizedBox(
            height: MySizes.spaceBetweenItems,
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
                onPressed: () => controller.sendEmailVerification(),
                child: Text(
                  "Resend Email",
                  style: Theme.of(context).textTheme.bodySmall,
                )),
          ),
        ]),
      )),
    );
  }
}
