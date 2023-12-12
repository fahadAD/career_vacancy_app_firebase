import 'dart:async';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Multiforms/user_form1.dart';
import 'login2.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Future GoogleSign()async{
     EasyLoading.show(status: "Loding...",);

    final GoogleSignInAccount? _googleSignInAccount_user=await GoogleSignIn().signIn();
    final GoogleSignInAuthentication?  _googleauth=await _googleSignInAccount_user?.authentication;

    final _crediental=GoogleAuthProvider.credential(accessToken: _googleauth?.accessToken, idToken: _googleauth?.idToken);
    UserCredential users= await FirebaseAuth.instance.signInWithCredential(_crediental);

    if(users.user != null){
      EasyLoading.dismiss();
      EasyLoading.showSuccess("Google Signup Sussessful Done ");
      Navigator.push(context, MaterialPageRoute( builder: (context) =>  UserForm1()));
    }else{
      EasyLoading.showError("Something is wrong");
    }

  }

  int pageIndex=0;
  Timer? timer;
  PageController pageController=PageController(
      initialPage: 0
  );

  @override
  void initState() {
    timer=Timer.periodic(Duration(seconds: 3,), (timer) {
      if(pageIndex<=2){
        pageIndex++;
      }else{
        pageIndex=0;

      }
      pageController.animateToPage(pageIndex, duration: Duration(milliseconds: 350), curve: Curves.easeIn);
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    timer=null;
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    List<Widget> _demo=[
      Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/3.0,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),

              ),
              border: Border.all(color: Colors.grey),
              image: DecorationImage(image: AssetImage("images/slider3s.png"),alignment: Alignment.center),
              color: Colors.white,
            ),

          ),
          SizedBox(height: 70,),
          const Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Find a perfect job match",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 18),),
              ),
              SizedBox(height: 7,),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Finding tour dream job is easier and faster with Career Platfrom.",style: TextStyle(color: Colors.grey,),),
              ),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/3.0,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),

              ),
              border: Border.all(color: Colors.grey),
              image: DecorationImage(image: AssetImage("images/slider1s.PNG"),alignment: Alignment.center),
              color: Colors.white,
            ),

          ),
          SizedBox(height: 70,),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Get an unique profile card from Career Platfrom",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 18),),
              ),
              SizedBox(height: 7,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Share your card while applying for jobs or anyone you want.",style: TextStyle(color: Colors.grey),),
              ),
            ],
          ),
        ],
      ),
      Column(
        children: [
          Container(
            height:MediaQuery.of(context).size.height/2.7,
            width:MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),

              ),
              border: Border.all(color: Colors.grey),
              image: DecorationImage(image: AssetImage("images/slider2s.PNG"),alignment: Alignment.center),
              color: Colors.white,
            ),

          ),
          SizedBox(height: 70,),
          Column(
            children: [
              Text("Filter out jobs that pays well",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 2,fontSize: 18),),

            ],
          ),
        ],
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        return await showDialog(context: context, builder: (context) {
          return CupertinoAlertDialog(
            title: Text("Exit App",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
            content: Text("Do You Want To Exit",style: TextStyle(fontWeight: FontWeight.bold)),

            actions: [
              TextButton(onPressed: () {
                Navigator.of(context).pop(true);
              }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold),)),
              TextButton(onPressed: () {
                Navigator.of(context).pop(false);
              }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),
            ],
          );
        },);

      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height/1.7,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                         color: Colors.white,
                      ),
                     child:  PageView(

             controller: pageController,
         children: _demo,
       onPageChanged: (index){
             setState(() {
             pageIndex=index;
             });
        },
),
                    ),
                    Positioned(
                      top: 280,
                      left: 135,
                      child: CarouselIndicator(
                        color: Colors.blue.shade200,
                        activeColor: Colors.indigo,
                        count: _demo.length,
                        index: pageIndex,
                        height: 10,
                        width: 30,
                      ),
                    ),
                  ],
                ),







 ListTile(

   title: Text("This Admin Way",style: TextStyle(fontWeight: FontWeight.bold), ),
   trailing: Icon(Icons.arrow_downward,color: Colors.red),
   leading: Icon(Icons.add_moderator,color: Colors.blue),
 ),


  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => NumberAuthentication(),));
        },
        child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.indigoAccent
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 SizedBox(width: 15),
                  Icon(Icons.phone,color: Colors.white,size: 27),
                   SizedBox(width: 40),
                   Text("Continue with Phone",style: TextStyle(color: Colors.white,fontSize: 20)),
               ],
            ),
        ),
      ),
  ),
                SizedBox(height: 10,),
                ListTile(

                  title: Text("This User Way",style: TextStyle(fontWeight: FontWeight.bold), ),
                  trailing: Icon(Icons.arrow_downward,color: Colors.black),
                  leading: Icon(Icons.supervised_user_circle_outlined,color: Colors.black),
                ),
  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
            GoogleSign();
        },
        child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              border: Border.all(color: Colors.indigoAccent)
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [

                 SizedBox(width: 10),
                   CircleAvatar(radius: 17,
                   backgroundColor: Colors.white,
                   backgroundImage: AssetImage("images/google.png"),
                   ),


                   SizedBox(width: 37),
                   Text("Continue with Google",style: TextStyle(color: Colors.indigoAccent,fontSize: 20)),

               ],
            ),
        ),
      ),
  ),
                SizedBox(height: 17,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
