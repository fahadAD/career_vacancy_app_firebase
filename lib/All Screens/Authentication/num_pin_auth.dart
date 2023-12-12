import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';

import '../CircularAdded/added.dart';
import '../Multiforms/user_form1.dart';
class PinPutScreen extends StatefulWidget {
  const PinPutScreen({super.key, required this.id});
  final String id;
  @override
  State<PinPutScreen> createState() => _PinPutScreenState();
}

class _PinPutScreenState extends State<PinPutScreen> {

  // Future GoogleSign()async{
  //   EasyLoading.show(status: "Loding...",);
  //
  //   final GoogleSignInAccount? _googleSignInAccount_user=await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication?  _googleauth=await _googleSignInAccount_user?.authentication;
  //
  //   final _crediental=GoogleAuthProvider.credential(accessToken: _googleauth?.accessToken, idToken: _googleauth?.idToken);
  //   UserCredential users= await FirebaseAuth.instance.signInWithCredential(_crediental);
  //
  //   if(users.user != null){
  //     EasyLoading.dismiss();
  //     EasyLoading.showSuccess("Google Signup Sussessful Done ");
  //     Navigator.push(context, MaterialPageRoute( builder: (context) =>  UserForm()));
  //   }else{
  //     EasyLoading.showError("Something is wrong");
  //   }
  //
  // }


  Future<void> CheckOTPfunction({required String sms_code, required String id_s})async{
    try{
      var auth=FirebaseAuth.instance;
      PhoneAuthCredential _crendital= PhoneAuthProvider.credential(verificationId: id_s, smsCode: sms_code);
      UserCredential users= await auth.signInWithCredential(_crendital);
      if(users.user != null){
        EasyLoading.showSuccess("Phone Autentication Successful done");
        Navigator.push(context, MaterialPageRoute(builder: (context) => Added(),));
      }else{
        EasyLoading.showError("Phone Autentication is went wrong");
      }
    }catch(e){
      EasyLoading.showError(e.toString());
    }
  }

  String otp="";
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height:MediaQuery.of(context).size.height/2.2,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/imagsvg2.PNG",),fit: BoxFit.fitWidth)
                    ),
                  ),
                  Positioned(
                      top: 197,
                      left: 162,
                      child: Icon(Icons.person,color: Colors.black,size: 30,))
                ],
              ),
              SizedBox(height: 30,),
              Text("Verify Your Phone Number",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 13,),
              Text("Enter your OTP here",style: TextStyle(fontSize: 16,color: Colors.black,letterSpacing: 1),),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Center(
                  child: Pinput(
                    length: 6,
                    onChanged: (value) {
                      otp = value;
                    },
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    CheckOTPfunction(sms_code: otp, id_s: widget.id);
                    // GoogleSign();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.indigoAccent
                    ),
                    child:Center(child: const Text("Verify OTP",style: TextStyle(color: Colors.white,fontSize: 20))),
                  ),
                ),
              ),
              SizedBox(height: 15,),

              Text("Did not recived any code? then try again",style: TextStyle(fontSize: 17,color: Colors.blue)),

            ],
          ),
        ),
      ),
    );
  }
}
