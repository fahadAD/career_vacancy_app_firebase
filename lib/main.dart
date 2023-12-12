import 'package:career_project_firebase/All%20Screens/SplashScreen/splash1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'All Screens/CircularAdded/added.dart';
import 'All Screens/Mainscreen/DetailsScreen/popular_detailsScreen.dart';
import 'All Screens/bottomNavigations.dart';
import 'Provider/allprovider.dart';
  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(const MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return     MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => ProfileProvider(),),
      ChangeNotifierProvider(create: (context) => PopularCircularProvider(),),
      ChangeNotifierProvider(create: (context) => RecentCircularProvider(),),
      ChangeNotifierProvider(create: (context) => PopularAppliedProvider(),),
      ChangeNotifierProvider(create: (context) => RecentAppliedProvider(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      builder: EasyLoading.init(),
    ),
    );
  }
}

