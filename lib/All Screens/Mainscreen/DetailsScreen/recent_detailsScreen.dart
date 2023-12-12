import 'package:career_project_firebase/Model/appliedModel.dart';
import 'package:career_project_firebase/Model/recent_circular_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import '../../../Model/popular_circular_model.dart';
import '../../../Provider/allprovider.dart';
import '../../bottomNavigations.dart';
class RecentDeailsScreen extends StatefulWidget {
  const RecentDeailsScreen({super.key, required this.recentCircular_data});
  final RecentCircularModel recentCircular_data;
  @override
  State<RecentDeailsScreen> createState() => _RecentDeailsScreenState();
}

class _RecentDeailsScreenState extends State<RecentDeailsScreen> {
  Future<void> recent_addFav({required RecentCircularModel  recentCircular, required bool values}) async {
    DocumentReference f = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser?.uid ?? "")
        .doc("AlljobCircular")
        .collection("recentJobs")
        .doc(recentCircular.databaseKey);
    await f.update({
      "isFav": values,
    });

    Provider.of<RecentCircularProvider>(context, listen: false).updateRecentCircular();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    bool fav = widget.recentCircular_data.isFav;
    return   SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade50,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13.0),
          child: GestureDetector(
            onTap: () {

              showDialog(context: context, builder: (context) {
                return  CupertinoAlertDialog(
                   title: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text("Do You Want\n To Applied Jobs"),
                   ),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    }, child: Text("No",style: TextStyle(fontWeight: FontWeight.bold),)),
                    TextButton(onPressed: () {
                      RecentAppliedModel _RecentAppliedModel=RecentAppliedModel(
                          weeklyWorkHolydays: widget.recentCircular_data.weeklyWorkHolydays,
                          vacancy: widget.recentCircular_data.vacancy,
                          salaryAmount: widget.recentCircular_data.salaryAmount,
                          positionName: widget.recentCircular_data.positionName,
                          locationName: widget.recentCircular_data.locationName,
                          jobResponsibilities: widget.recentCircular_data.jobResponsibilities,
                          jobDescription: widget.recentCircular_data.jobDescription,
                          facilities: widget.recentCircular_data.facilities,
                          experience: widget.recentCircular_data.experience,
                          englishLevel: widget.recentCircular_data.englishLevel,
                          employeType: widget.recentCircular_data.employeType,
                          educationLevel: widget.recentCircular_data.educationLevel,
                          companyName: widget.recentCircular_data.companyName,
                          circularPostedDate: widget.recentCircular_data.circularPostedDate,
                          circularDeadlineDate: widget.recentCircular_data.circularDeadlineDate,
                          gender: widget.recentCircular_data.gender,
                          workplaceType: widget.recentCircular_data.workplaceType,
                          circularId: widget.recentCircular_data.circularId,
                          circularBackgroundImage: widget.recentCircular_data.circularBackgroundImage,
                          circularImage: widget.recentCircular_data.circularImage,
                          isFav: widget.recentCircular_data.isFav,
                          quantity: 1
                      );
                      Provider.of<RecentAppliedProvider>(context,listen: false).addtorecentApply(recentApplied_Model: _RecentAppliedModel);
                      EasyLoading.showSuccess("Applied Done\n Check This Applied Job List");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatorScreen(),));
                    }, child: Text("Yes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),)),


                  ],
                );
              },);
              },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Center(child: Text("Apply Job",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20))),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: double.infinity,
                    height: 190,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("${widget.recentCircular_data.circularBackgroundImage}",),fit: BoxFit.fill),
                    ),
                    child: Align(

                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  height: 40,
                                  width: 40,

                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15))),

                                  child: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,)),
                            ),
                          ),
                          SizedBox(width: 200,),

                           GestureDetector(
                            child: Container(
                                height: 40,
                                width: 40,

                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15))),
                                child: GestureDetector(
                                    onTap: () {
                                      recent_addFav(
                                          recentCircular: widget.recentCircular_data,
                                          values: ! fav);
                                      EasyLoading.showSuccess("Done \n Check This Save Job List");
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatorScreen(),));
                                    },
                                    child:fav? Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_border,color: Colors.black,))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                  height: 40,
                                  width: 40,

                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(15))),

                                  child: Icon(Icons.share,color: Colors.blue,)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 20,
                    child: Container(
                      width: 105,
                      height: 105,
                      decoration: BoxDecoration(
                          border: Border.all(color:  Colors.white,width: 4),
                          image: DecorationImage(image: NetworkImage("${widget.recentCircular_data.circularImage}",),fit: BoxFit.fill,),

                          borderRadius: BorderRadius.all(Radius.circular(10),)
                      ),
                      // child: Image.asset("images/cover.jpg",
                      //     width: 100,
                      // height: 100,
                      //
                      // ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Align(
                  alignment: Alignment.topRight,
                  child: Text("${widget.recentCircular_data.companyName}  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
              SizedBox(height: 40,),
              Text("${widget.recentCircular_data.positionName}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              SizedBox(height: 30,),



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
                            child: Text("Basic Information : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Education Level : ",style: TextStyle(color: Colors.black, )),

                          ),
                          Text("${widget.recentCircular_data.educationLevel}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Vacancy : ",style: TextStyle(color: Colors.black )),

                          ),
                          Text( "${widget.recentCircular_data.vacancy}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Experience :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.experience}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Required English Level :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.englishLevel}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Location :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.locationName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Application Posted at :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.circularPostedDate}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Application Deadline :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.circularDeadlineDate}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Gender :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.gender}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Employement Type :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.employeType}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Workplace Type :",style: TextStyle(color: Colors.black)),

                          ),
                          Text( "${widget.recentCircular_data.workplaceType}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
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
                            child: Text("Salary Information : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0,top: 5.0,bottom: 5.0,right: 5.0),
                            child:Text("Salary : ",style: TextStyle(color: Colors.black, )),

                          ),
                          Text("${widget.recentCircular_data.salaryAmount} (Negotiable)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                        ],
                      ),


                      SizedBox(height: 10,)
                    ],
                  ),
                ),
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
                            child: Text("Perks : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Text("  ${widget.recentCircular_data.facilities} ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),



                      SizedBox(height: 10,)
                    ],
                  ),
                ),
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
                            child: Text("Weekly Holidays : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Text("${widget.recentCircular_data.weeklyWorkHolydays}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),

                      SizedBox(height: 10,)
                    ],
                  ),
                ),
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
                            child: Text("Job Description : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${widget.recentCircular_data.jobDescription} ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 10,)
                    ],
                  ),
                ),
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
                            child: Text("Job Responsibilities : ",style: TextStyle(fontWeight: FontWeight.normal,color: Colors.black,fontSize: 18),)),
                      ),
                      SizedBox(height: 6,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${widget.recentCircular_data.jobResponsibilities}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      ),



                      SizedBox(height: 10,)
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}