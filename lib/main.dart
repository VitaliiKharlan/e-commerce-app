import 'package:flutter/material.dart';

import 'core/di/locator.dart';
import 'core/theme/app_svg_icons.dart';
import 'e_commerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  print('Checking asset: ${AppSvgIcons.bottomNavigationBarHome}');
  runApp(ECommerceApp());
}
