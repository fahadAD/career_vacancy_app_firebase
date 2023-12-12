import 'package:flutter/material.dart';
import '../Authentication/login1.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nextPage();
  }
  void nextPage()async{
    await Future.delayed(const Duration(seconds: 4),);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
    // if(FirebaseAuth.instance.currentUser !=null){
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => UserForm(),));
    // }else{
    //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen1(),));
    // }
  }
  @override
  Widget build(BuildContext context) {

    return   SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/splash.png"),fit: BoxFit.fitHeight)
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0,),
              child: CircularProgressIndicator(color: Colors.white,),
            ),

          ],
        ),
      ),
    );
  }
}
