import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tor_application/conts/app_color.dart';
import 'package:tor_application/conts/app_name.dart';
import 'package:tor_application/ui/route/route.dart';
import 'package:tor_application/ui/views/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDEk9ZYfP2qDYKz6soeIS14055xzfErWZk",
            authDomain: "tor-application-f2b92.firebaseapp.com",
            projectId: "tor-application-f2b92",
            storageBucket: "tor-application-f2b92.appspot.com",
            messagingSenderId: "59824614160",
            appId: "1:59824614160:web:3dd5d3eec89fce74405395",
            measurementId: "G-RLRZZ9P2V2"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 626),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(
              Theme.of(context).textTheme.apply(),
            ),
            scaffoldBackgroundColor: AppColor.scaffoldColler,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}
