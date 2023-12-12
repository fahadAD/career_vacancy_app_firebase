import 'package:career_project_firebase/All%20Screens/bottomNavigations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Provider/allprovider.dart';
class AppliedJobs extends StatefulWidget {
  const AppliedJobs({super.key});

  @override
  State<AppliedJobs> createState() => _AppliedJobsState();
}

class _AppliedJobsState extends State<AppliedJobs> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
             Consumer<PopularAppliedProvider>(builder: (context, value, child) {
               return ListView.builder(
                 primary: false,
                 shrinkWrap: true,
                 itemCount: value.popularList.length,
                 itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                   child: Container(
                     width: double.infinity,

                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(15),
                         border: Border.all(color: Colors.black)
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         ListTile(

                           title:Text("${value.popularList[index].positionName} ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                           subtitle: Text("${value.popularList[index].companyName}.",style: TextStyle( fontWeight: FontWeight.bold)),
                           leading:  ClipRRect(
                               borderRadius: BorderRadius.circular(10 ),
                               child: Image.network("${value.popularList[index].circularImage}",height: 65,width: 70,fit: BoxFit.fill,)),
                        trailing:  GestureDetector(
                          onTap: () {
                            showDialog(context: context, builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("Do you want to rejected applied jobs "),
                                actions: [
                                  TextButton(onPressed: () {
                                 Navigator.pop(context);
                                  }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold),)),
                                  TextButton(onPressed: () {
                                    value.deletefromCart(cart_Model: value.popularList[index]);
                                    Navigator.pop(context);
                                    }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),

                                ],
                              );
                            },);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade900,
                            ),
                            child: Icon(Icons.delete,color: Colors.white,),
                          ),
                        ),



                         ),
                         // ListTile(
                         //   title: Text("৳  20k-30K BDT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 20)),
                         //   subtitle: Text("Deadline : 3/13/2023",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,)),
                         //   trailing:  Container(
                         //     height: 40,
                         //     width: 40,
                         //     decoration: BoxDecoration(
                         //       shape: BoxShape.circle,
                         //       color: Colors.black,
                         //     ),
                         //     child: Icon(Icons.delete,color: Colors.white,),
                         //   ),
                         //
                         // ),
                         SizedBox(height: 5,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             SizedBox(
                               // width: 170,
                               height: 50,
                               child: Card(
                                 elevation: 10,
                                 color: Colors.white,
                                 shape: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     borderSide: BorderSide.none
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     children: [
                                       Icon(Icons.location_on,color: Colors.blue,),
                                       Text(" ${value.popularList[index].locationName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(
                               // width: 170,
                               height: 50,
                               child: Card(
                                 elevation: 10,
                                 color: Colors.white,
                                 shape: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     borderSide: BorderSide.none
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     children: [
                                       Icon(Icons.timer,color: Colors.blue,),
                                       Text(" ${value.popularList[index].employeType}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 20,)
                       ],
                     ),
                   ),
                 );
               },

               );
             },),
             Consumer<RecentAppliedProvider>(builder: (context, value, child) {
               return ListView.builder(
                 primary: false,
                 shrinkWrap: true,
                 itemCount: value.recentList.length,
                 itemBuilder: (BuildContext context, int index) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5),
                   child: Container(
                     width: double.infinity,

                     decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(15),
                         border: Border.all(color: Colors.black)
                     ),
                     child: Column(
                       children: [
                         SizedBox(height: 10,),
                         ListTile(

                           title:Text("${value.recentList[index].positionName} ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                           subtitle: Text("${value.recentList[index].companyName}.",style: TextStyle( fontWeight: FontWeight.bold)),
                           leading:  ClipRRect(
                               borderRadius: BorderRadius.circular(10 ),
                               child: Image.network("${value.recentList[index].circularImage}",height: 65,width: 70,fit: BoxFit.fill,)),
                        trailing:  GestureDetector(
                          onTap: () {
                            showDialog(context: context, builder: (context) {
                              return CupertinoAlertDialog(
                                title: Text("Do You Want To Reject Applied Jobs "),
                                actions: [
                                  TextButton(onPressed: () {
                                 Navigator.pop(context);
                                  }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold),)),
                                  TextButton(onPressed: () {
                                    value.deletefromCart(cart_Model: value.recentList[index]);
                                    Navigator.pop(context);
                                    }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),
                                ],
                              );
                            },);
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade900,
                            ),
                            child: Icon(Icons.delete,color: Colors.white,),
                          ),
                        ),



                         ),

                         SizedBox(height: 5,),
                         Row(
                           children: [
                             SizedBox(width: 10,),
                             SizedBox(
                               // width: 170,
                               height: 50,
                               child: Card(
                                 elevation: 10,
                                 color: Colors.white,
                                 shape: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     borderSide: BorderSide.none
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     children: [
                                       Icon(Icons.location_on,color: Colors.blue,),
                                       Text(" ${value.recentList[index].locationName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                             SizedBox(
                               // width: 170,
                               height: 50,
                               child: Card(
                                 elevation: 10,
                                 color: Colors.white,
                                 shape: OutlineInputBorder(
                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                     borderSide: BorderSide.none
                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     children: [
                                       Icon(Icons.timer,color: Colors.blue,),
                                       Text(" ${value.recentList[index].employeType}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                     ],
                                   ),
                                 ),
                               ),
                             ),
                           ],
                         ),
                         SizedBox(height: 20,)
                       ],
                     ),
                   ),
                 );
               },

               );
             },),

          ],
        ),
      ),
    );
  }
}