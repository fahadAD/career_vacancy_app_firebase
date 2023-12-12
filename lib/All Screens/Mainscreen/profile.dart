import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Provider/allprovider.dart';
import '../Multiforms/user_form1.dart';
import '../bottomNavigations.dart';
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        elevation: 0,

   centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatorScreen(),));
            },
            child: Container(
                height: 20,
                width: 20,

                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15))),

                child: Icon(Icons.arrow_back_outlined,color: Colors.black,)),
          ),
        ),
        title: Text("Profile",style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue.shade50,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_calendar,color: Colors.black),
            tooltip: 'Open Edit',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UserForm1(),));

            },
          ),
        ],
      ),
      body: Consumer<ProfileProvider>(builder: (context, value, child) {
        return value.isloding?Center(child: CircularProgressIndicator()):SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 240,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/cover.jpg",),fit: BoxFit.fitHeight),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        )
                    ),


                  ),
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width*0.9,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)
                        )
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 140,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,

                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 90,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueAccent),
                                      borderRadius: BorderRadius.all(Radius.circular(15),),

                                    ),
                                    child:  Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        child: Image.network("${FirebaseAuth.instance.currentUser?.photoURL}",

                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2.0,bottom: 5),
                                        child: Text("Name : ${value.profile.name??""}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2.0),
                                        child: Text("Position : ${value.profile.workPositionName??""}",style: TextStyle(color: Colors.black),),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon((Icons.home_work_outlined),color: Colors.black,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text("${value.profile.workOrgName??""}",style: TextStyle(color: Colors.black),),
                                  ),
                                ],
                              )


                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.all(Radius.circular(15) )
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 40,
                                width:  MediaQuery.of(context).size.width*0.54,
                                decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.white,width: 2)
                                ),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1.0),
                                      child: Icon(Icons.cases_rounded,color: Colors.white,),
                                    ),
                                    Text(" ${value.profile.work_startDate??""}",style: TextStyle(color: Colors.white),),
                                    Text(" - ",style: TextStyle(color: Colors.white),),
                                    Text("${value.profile.work_endDate??""}",style: TextStyle(color: Colors.white),),
                                  ],
                                ),
                              ),
                              Container(
                                height: 40,
                                width:  MediaQuery.of(context).size.width*0.3,
                                decoration: BoxDecoration(
                                    color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    border: Border.all(color: Colors.white,width: 2)
                                ),
                                child: Row(
                                  children: [
                                    Icon(Icons.layers,color: Colors.white,),
                                    Text("${value.profile.educationType??""}",style: TextStyle(color: Colors.white),),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                child: Container(

                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("About Me : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 7,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text("${value.profile.workResponsibalDetails??""}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                child: Container(
                  height: 220,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Personal Details : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child: Icon(Icons.person_pin,color: Colors.blueGrey),
                          ),
                          Text(value.profile.name??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child: Icon(Icons.email,color: Colors.blueGrey),
                          ),
                          Text(FirebaseAuth.instance.currentUser?.email??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child: Icon(Icons.phone,color: Colors.blueGrey),
                          ),
                          Text(value.profile.number??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child: Icon(Icons.map_outlined,color: Colors.blueGrey),
                          ),
                          Text(value.profile.personGender??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child: Icon(Icons.date_range_sharp,color: Colors.blueGrey),
                          ),
                          Text(value.profile.dateofBith??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                child: Container(
                  height: 170,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Job Preferences : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Job Type :",style: TextStyle(color: Colors.black, )),

                          ),
                          Text(value.profile.jobType??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Empolyment Type :",style: TextStyle(color: Colors.black )),

                          ),
                          Text(value.profile.employmentType??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Workplace Type :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.workplaceType??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Shift Type :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.shiftType??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                child: Container(
                  height: 210,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Education Qualifications : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Education Level :",style: TextStyle(color: Colors.black, )),

                          ),
                          Text(value.profile.educationType??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Degree Tittle :",style: TextStyle(color: Colors.black )),

                          ),
                          Text(value.profile.degreeName??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Institution Name :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.instituteName??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Subject Type :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.fielsOfstudyName??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Education Degree Start Date :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.edu_startDate??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Education Degree End Date :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.edu_endDate??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,),
                child: Container(
                  height: 210,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(

                    children: [
                      SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,left: 8.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("Job Information : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Organization Name : ",style: TextStyle(color: Colors.black, )),

                          ),
                          Text(value.profile.workOrgName??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Designation Tittle : ",style: TextStyle(color: Colors.black )),

                          ),
                          Text(value.profile.workPositionName??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Department Name :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.workDepartmentName??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Job Start Date :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.work_startDate??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Job End Date :",style: TextStyle(color: Colors.black)),

                          ),
                          Text(value.profile.work_endDate??"",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },),
    );
  }
}
