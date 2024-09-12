import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:forge_final/screens/splash/splashnew.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'Provider/add_to_cart_provider.dart';
import 'Provider/favorite_provider.dart';
import 'Provider/search.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCUZlF0KxC5eOSEwOxg9qj_Vrp-VeBUWas",
          appId: "1:804654474318:android:2f9ac24d57881fbb7e4f1f",
          messagingSenderId: "804654474318",
          projectId: "forge-d3386",
          storageBucket: "forge-d3386.appspot.com"));
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MultiProvider(
    providers: [
      // for add to cart
      ChangeNotifierProvider(create: (_)=>CartProvider()),
      // for favorite
      ChangeNotifierProvider(create: (_)=>FavoriteProvider()),
      //for search
      ChangeNotifierProvider(create: (_)=>SearchProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      ),
      home: const Splashscrn(),
    ),
  );
}
