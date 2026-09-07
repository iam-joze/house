import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:housingapp/models/user_preferences.dart';
import 'package:housingapp/utils/app_styles.dart';
import 'package:housingapp/services/mock_notification_service.dart';
import 'package:housingapp/services/mock_property_service.dart';
import 'package:housingapp/screens/account_creation_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserPreferences()),
        ChangeNotifierProvider(create: (context) => MockNotificationService()),
        Provider<MockPropertyService>(create: (context) => MockPropertyService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HousingApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppStyles.primaryColor,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: AppStyles.primaryMaterialColor)
            .copyWith(secondary: AppStyles.accentColor),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppStyles.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57, color: AppStyles.textColor),
          displayMedium: TextStyle(fontSize: 45, color: AppStyles.textColor),
          displaySmall: TextStyle(fontSize: 36, color: AppStyles.textColor),
          headlineLarge: TextStyle(fontSize: 32, color: AppStyles.textColor),
          headlineMedium: TextStyle(fontSize: 28, color: AppStyles.textColor),
          headlineSmall: TextStyle(fontSize: 24, color: AppStyles.textColor),
          titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppStyles.textColor),
          titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: AppStyles.textColor),
          titleSmall: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: AppStyles.textColor),
          bodyLarge: TextStyle(fontSize: 16, color: AppStyles.textColor),
          bodyMedium: TextStyle(fontSize: 14, color: AppStyles.textColor),
          bodySmall: TextStyle(fontSize: 12, color: AppStyles.darkGrey),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppStyles.textColor),
          labelMedium: TextStyle(fontSize: 12, color: AppStyles.darkGrey),
          labelSmall: TextStyle(fontSize: 11, color: AppStyles.darkGrey),
        ),
      ),
      home: const AccountCreationScreen(),
    );
  }
}