import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sport_shop/bindings/general_bindings.dart';
import 'package:sport_shop/features/authentication/screens/onboarding/onboarding.dart';
import 'package:sport_shop/utils/constants/colors.dart';
import 'package:sport_shop/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      ///loader
      home: const Scaffold(backgroundColor: MyColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );
  }
}
