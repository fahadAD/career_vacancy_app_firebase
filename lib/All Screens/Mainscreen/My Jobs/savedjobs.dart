import 'package:career_project_firebase/Model/popular_circular_model.dart';
import 'package:career_project_firebase/Model/recent_circular_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../Provider/allprovider.dart';
import '../DetailsScreen/popular_detailsScreen.dart';
import '../DetailsScreen/recent_detailsScreen.dart';
class SavedJobs extends StatefulWidget {
  const SavedJobs({super.key});

  @override
  State<SavedJobs> createState() => _SavedJobsState();
}

class _SavedJobsState extends State<SavedJobs> {

  Future<void> delete_popular_FavPopular({required PopularCircularModel popular_Del_circular, required bool values}) async {
    DocumentReference f = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser?.uid ?? "")
        .doc("AlljobCircular")
        .collection("popularJobs")
        .doc(popular_Del_circular.databaseKey);
    await f.update({
      "isFav": values,
    });

    Provider.of<PopularCircularProvider>(context, listen: false).updatePopularCircular();
    // Provider.of<ProductProvider>(context,listen: false).getFavouriteProducts();

  }
  Future<void> delete_recent_FavPopular({required RecentCircularModel recent_Del_circular, required bool values}) async {
    DocumentReference f = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser?.uid ?? "")
        .doc("AlljobCircular")
        .collection("recentJobs")
        .doc(recent_Del_circular.databaseKey);
    await f.update({
      "isFav": values,
    });

    Provider.of<RecentCircularProvider>(context, listen: false).updateRecentCircular();
    // Provider.of<ProductProvider>(context,listen: false).getFavouriteProducts();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PopularCircularProvider>(context,listen: false).getFavouritePopularCircular();
    Provider.of<RecentCircularProvider>(context,listen: false).getFavouriteRecentCircular();
  }

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 15,),
             Consumer<PopularCircularProvider>(builder: (context, value, child) {
               return ListView.builder(
                 primary: false,
                 shrinkWrap: true,
                 itemCount: value.fav_popular_cirular.length,
                 itemBuilder: (BuildContext context, int index) {
                   return Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                     child: Container(
                       width: double.infinity,
                       height: 220,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(15),
                           border: Border.all(color: Colors.black)
                       ),
                       child: Column(
                         children: [
                           SizedBox(height: 10,),
                           GestureDetector(
                             onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => PopularDeailsScreen(popularCircular_data: value.jobcircular[index]),));

                             },
                             child: ListTile(
                               title:Text("${value.fav_popular_cirular[index].positionName} ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                               subtitle: Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 8.0),
                                 child: Text("${value.fav_popular_cirular[index].companyName}.",style: TextStyle( fontWeight: FontWeight.bold)),
                               ),
                               trailing:  ClipRRect(
                                   borderRadius: BorderRadius.circular(10 ),
                                   child: Image.network("${value.fav_popular_cirular[index].circularImage}",height: 65,width: 70,fit: BoxFit.fill,)),
                             ),
                           ),
                           ListTile(
                             title: Text("৳  ${value.fav_popular_cirular[index].salaryAmount} BDT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 20)),
                             subtitle: Text("Deadline : ${value.fav_popular_cirular[index].circularDeadlineDate}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,)),
                             trailing:  GestureDetector(
                               onTap: () async {
                      await delete_popular_FavPopular(popular_Del_circular: value.fav_popular_cirular[index], values: false);
                      EasyLoading.showSuccess("Delete");
                               },
                               child: Container(
                                 height: 40,
                                 width: 40,
                                 decoration: BoxDecoration(
                                   shape: BoxShape.circle,
                                   color: Colors.teal,
                                 ),
                                 child: Icon(Icons.delete,color: Colors.white,),
                               ),
                             ),

                           ),
                           GestureDetector(
                             onTap: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context) => PopularDeailsScreen(popularCircular_data: value.jobcircular[index]),));

                             },
                             child: Row(
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
                                           Text(" ${value.fav_popular_cirular[index].locationName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
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
                                           Text(" ${value.fav_popular_cirular[index].workplaceType}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           )

                         ],
                       ),
                     ),
                   );
                 },

               );
             },),
            Consumer<RecentCircularProvider>(builder: (context, value, child) {
              return ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: value.fav_recent_cirular.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 6),
                    child: Container(
                      width: double.infinity,
                      height: 220,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RecentDeailsScreen(recentCircular_data: value.receent_jobcircular[index]),));

                            },
                            child: ListTile(
                              title:Text("${value.fav_recent_cirular[index].positionName} ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold)),
                              subtitle: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text("${value.fav_recent_cirular[index].companyName}.",style: TextStyle( fontWeight: FontWeight.bold)),
                              ),
                              trailing:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10 ),
                                  child: Image.network("${value.fav_recent_cirular[index].circularImage}",height: 65,width: 70,fit: BoxFit.fill,)),
                            ),
                          ),
                          ListTile(
                            title: Text("৳  ${value.fav_recent_cirular[index].salaryAmount} BDT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blueAccent,fontSize: 20)),
                            subtitle: Text("Deadline : ${value.fav_recent_cirular[index].circularDeadlineDate}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,)),
                            trailing:  GestureDetector(
                              onTap: () async {
                       await delete_recent_FavPopular(recent_Del_circular: value.fav_recent_cirular[index], values: false);
                       EasyLoading.showSuccess("Delete");
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.teal,
                                ),
                                child: Icon(Icons.delete,color: Colors.white,),
                              ),
                            ),

                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => RecentDeailsScreen(recentCircular_data: value.receent_jobcircular[index]),));

                            },
                            child: Row(
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
                                          Text(" ${value.fav_recent_cirular[index].locationName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
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
                                          Text(" ${value.fav_recent_cirular[index].workplaceType}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )

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
