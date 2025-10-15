import 'package:flutter/material.dart';

import 'core/di/locator.dart';
import 'e_commerce_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  runApp(ECommerceApp());
}
