import 'package:career_project_firebase/All%20Screens/Mainscreen/profile.dart';
import 'package:career_project_firebase/Model/recent_circular_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Model/popular_circular_model.dart';
import '../../Provider/allprovider.dart';
import '../bottomNavigations.dart';
import '../setingScreen.dart';
import 'DetailsScreen/popular_detailsScreen.dart';
import 'DetailsScreen/recent_detailsScreen.dart';
import 'jobs.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> _drawer=GlobalKey<ScaffoldState>();

  Future<void> popular_addFav({required PopularCircularModel  popularCircular, required bool values}) async {
    DocumentReference f = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser?.uid ?? "")
        .doc("AlljobCircular")
        .collection("popularJobs")
        .doc(popularCircular.databaseKey);
    await f.update({
      "isFav": values,
    });

    Provider.of<PopularCircularProvider>(context, listen: false).updatePopularCircular();
  }





  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _drawer,
backgroundColor: Colors.blue.shade50,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: GestureDetector(
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigatorScreen(),));
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios_sharp,color: Colors.black,size: 25)),
                title: Text("MENU",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 27.0),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue.shade50,
                  backgroundImage: NetworkImage("${FirebaseAuth.instance.currentUser?.photoURL}"),),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text("Fahim Shahariar Fahad",style: TextStyle(color: Colors.black,fontSize: 20),),
              ),
              SizedBox(height: 50,),
               GestureDetector(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                 },
                 child: ListTile(
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    child: Center(child: Icon(Icons.person,color: Colors.white,size: 30)),
                  ),
                  title: Text("Profile",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              ),
               ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Myjobs(),));
                },
                child: ListTile(
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child: Center(child: Icon(Icons.favorite_border,color: Colors.white,size: 30)),
                  ),
                  title: Text("Save jobs",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 10,),
              ListTile(
                leading: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: Colors.redAccent,
                      shape: BoxShape.circle
                  ),
                  child: Center(child: Icon(Icons.report,color: Colors.white,size: 30)),
                ),
                title: Text("Report issue",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Setting(),));
                },
                child: ListTile(
                  leading: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    child: Center(child: Icon(Icons.settings,color: Colors.white,size: 30)),
                  ),
                  title: Text("Settings",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                ),
              ),

            ],
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
  SizedBox(height: 5,),
  Container(
    width: double.infinity,
    // color: Colors.blue.shade50,
    child: Row(
      children: [
        const SizedBox(width: 6,),
        GestureDetector(
          onTap: () {
            _drawer.currentState?.openEndDrawer();
          },
          child: Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(15))

            ),
            child: Icon(Icons.format_align_left_rounded,color: Colors.white,size: 30),
          ),
        ),
        const SizedBox(width: 16,),
        Text("Career",style: GoogleFonts.aboreto(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 34,),),
        Image.asset("images/carer.png",width: 30,height: 30,),
        SizedBox(width: MediaQuery.of(context).size.width*0.2),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blue.shade50,
          backgroundImage: NetworkImage("${FirebaseAuth.instance.currentUser?.photoURL}"),)
      ],
    ),
  ),
  const SizedBox(height: 10,),
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0,),
    child: Container(
      height: 45,width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextFormField(
        decoration: InputDecoration(
            labelText: "Search jobs",
            suffixIcon: Icon(Icons.search,color: Colors.black),
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)))
        ),
      ),
    ),
  ),
  const SizedBox(height: 10,),
  const ListTile(
    leading: Text("Popular Jobs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
    trailing: Icon(Icons.arrow_forward,color: Colors.blue,size: 30),  ),
  const SizedBox(height: 5,),
  // Popular Jobs
  SizedBox(
    height: 235,
    child:  Consumer<PopularCircularProvider>(builder: (context, value, child) {
      return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: value.jobcircular.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          bool fav = value.jobcircular[index].isFav;
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SizedBox(
              height: 230,
              width: MediaQuery.of(context).size.width*0.9,
              child:   Card(
                elevation: 10,
                color: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        leading:  ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PopularDeailsScreen(popularCircular_data: value.jobcircular[index]),));
                                },
                                child: Image.network("${value.jobcircular[index].circularImage}",height: 60,width: 60,fit: BoxFit.fill,))),
                        trailing:  GestureDetector(
                            onTap: () async {
                              await popular_addFav(
                                  popularCircular: value.jobcircular[index],
                              values: !fav);
                            },
                            child:fav? Icon(Icons.favorite,color: Colors.red,size: 35,):Icon(Icons.favorite_border,color: Colors.black,size: 35,)),
                      ),
                    ),
GestureDetector(
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PopularDeailsScreen(popularCircular_data: value.jobcircular[index]),));
  },
  child:   Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    mainAxisAlignment: MainAxisAlignment.start,

    children: [



      Padding(

        padding: const EdgeInsets.only(left: 15.0,top: 8.0),

        child:   Text("${value.jobcircular[index].companyName}",style: TextStyle(color: Colors.grey),),

      ),



      Padding(

        padding: EdgeInsets.only(left: 8.0,top: 5.0),

        child: Row(

          children: [

            Icon(Icons.location_on_outlined,color: Colors.blue,),

            Text(value.jobcircular[index].locationName,style: TextStyle(color: Colors.blue),),

          ],

        ),

      ),

      Padding(

        padding: EdgeInsets.only(left: 15.0,top: 5.0),

        child: Text(value.jobcircular[index].positionName,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),

      ),

      Padding(

        padding: const EdgeInsets.only(left: 15.0,top: 5.0),

        child: Text(value.jobcircular[index].experience,style: TextStyle(color: Colors.black,),),

      ),

      Padding(

        padding: const EdgeInsets.only(left: 15.0,top: 5.0),

        child: Text("৳ ${value.jobcircular[index].salaryAmount} BDT",style: TextStyle(color: Colors.black),),

      ),

      Padding(

        padding: EdgeInsets.only(left: 15.0,top: 4.0),

        child: Text("Workplace type : ${value.jobcircular[index].workplaceType}",style: TextStyle(color: Colors.black),),

      ),

    ],

  ),
)
                  ],
                ),

              ),
            ),
          );
        },

      );
    },),
  ),

  const SizedBox(height: 5,),
  const ListTile(
    leading: Text("Recent Jobs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
    trailing: Icon(Icons.arrow_downward,color: Colors.blue,size: 30),
  ),
  const SizedBox(height: 5,),
    //Recent Jobs

    Consumer<RecentCircularProvider>(
      builder: (context, value, child) {
      return ListView.builder(
        primary: false,
        shrinkWrap: true,
        itemCount: value.receent_jobcircular.length,
        itemBuilder: (BuildContext context, int index) {

          return Padding(
            padding: EdgeInsets.symmetric(horizontal : 8.0,vertical: 3),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecentDeailsScreen(recentCircular_data: value.receent_jobcircular[index]),));
              },
              child: SizedBox(
                height: 155,
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  color: Colors.white,
                  shape: OutlineInputBorder(
                      borderRadius: const BorderRadius.only(
                        bottomLeft:  Radius.circular(15),
                        bottomRight:  Radius.circular(15),
                        topLeft:  Radius.circular(15),
                      ),
                      borderSide: BorderSide.none
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 7,),
                      ListTile(
                        leading:  ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft:  Radius.circular(20),
                              bottomRight:  Radius.circular(20),
                              topRight:  Radius.circular(20),
                              topLeft:  Radius.circular(20),
                            ),
                            child: Image.network(value.receent_jobcircular[index].circularImage,height: 60,width: 60,fit: BoxFit.fill,)),
                        title:    Text(value.receent_jobcircular[index].positionName,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                        ListTile(

                        title: Text(value.receent_jobcircular[index].companyName,style: const TextStyle(color: Colors.grey)),
                        trailing: Text("৳ ${value.receent_jobcircular[index].salaryAmount} BDT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal),),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0,left: 6),
                          child:   Row(
                            children: [
                              const Icon(Icons.location_on_outlined,color: Colors.blue,),
                              Text(value.receent_jobcircular[index].locationName,style: const TextStyle(color: Colors.blue),),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),
          );
        },

      );
    },),

  const SizedBox(height: 5,),

],
          ),
        ),
      ),
    );
  }
}
