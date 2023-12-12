import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'num_pin_auth.dart';
class NumberAuthentication extends StatefulWidget {
  const NumberAuthentication({super.key});

  @override
  State<NumberAuthentication> createState() => _NumberAuthenticationState();
}

class _NumberAuthenticationState extends State<NumberAuthentication> {
  GlobalKey<FormState> _form=GlobalKey<FormState>();
  TextEditingController phoneAuthController = TextEditingController();

  Future phoneAuthsend_OTP({required String phone_number}) async {
    var auth=FirebaseAuth.instance;
    EasyLoading.show(status: "Loding...");
    await auth.verifyPhoneNumber(
      phoneNumber: phone_number,
        verificationCompleted: (phoneAuthCredential) {},
        verificationFailed: (error) {print(error.message);},
        codeSent: (verificationId, forceResendingToken) {
         EasyLoading.dismiss();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>PinPutScreen(id: verificationId) ,));
        },
        codeAutoRetrievalTimeout: (verificationId) {},);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    phoneAuthController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height:MediaQuery.of(context).size.height/2.3,
                      width:MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/imagsvg.PNG",))
                      ),
                    ),
                     Positioned(
                         top: 187,
                         left: 162,
                         child: Icon(Icons.person,color: Colors.black,size: 30,))
                  ],
                ),
                SizedBox(height: 30,),
                Text("Enter Your Phone Number",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),
                SizedBox(height: 13,),
                Text("We will send you a verification code.",style: TextStyle(fontSize: 16,color: Colors.black,letterSpacing: 1),),
                SizedBox(height: 30,),
                Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    elevation: 10,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextFormField(
                        validator: (value) {
                          if(value!.isEmpty){
                            return "Required A valid Phone Number";
                          }else{
                            return null;
                          }
                        },
                        controller: phoneAuthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(

                          hintText: "  Add country code & number(11) digit",
                          hintStyle: const TextStyle(color: Colors.blueGrey),
                          enabledBorder: InputBorder.none,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),

                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
            if(_form.currentState!.validate()){
              if(phoneAuthController.text.contains("+")){
                phoneAuthsend_OTP(phone_number: phoneAuthController.text);
              }else{
                EasyLoading.showError("Add your country code(+00)");
              }
            }
                     },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.indigoAccent
                      ),
                      child:Center(child: const Text("Send OTP",style: TextStyle(color: Colors.white,fontSize: 20))),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Column(

                  children: [
                    Text("By providing phone number,  i there by confirm\n    that i read understood and agree to Career",style: TextStyle(fontSize: 16,color: Colors.black)),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {

                            },
                            child: Text("                   Terms & Condition",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,),)),
                        Text(" and ",style: TextStyle(color: Colors.black,fontSize: 16),),
                        GestureDetector(
                            onTap: () {

                            },
                            child: Text("Privacy Policy",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,),)),

                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
