import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pet_adoption/binding/binding.dart';
import 'package:pet_adoption/core/constants/colors.dart';
import 'package:pet_adoption/core/constants/supabase_constants.dart';
import 'package:pet_adoption/core/theme/theme.dart';
import 'package:pet_adoption/firebase_options.dart';
import 'package:pet_adoption/services/auth_service.dart';
import 'package:pet_adoption/services/notification_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthService()));

  await Supabase.initialize(
    url: SupabaseConstants.url,
    anonKey: SupabaseConstants.anonKey,
  );
  await NotificationService().initialize();
  GetStorage.init();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBinding(),
      debugShowCheckedModeBanner: false,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const Scaffold(
        backgroundColor: MyColors.primaryColor,
        body: Center(child: CircularProgressIndicator(color: MyColors.white)),
      ),
    );
  }
}
