
import 'package:career_project_firebase/Model/recent_circular_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
 import '../Model/popular_circular_model.dart';
import '../Model/profilemodel.dart';
Future<ProfileModel> getProfileRepo()async{
  DocumentReference users_Profile=FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid??"").doc("ProfileData");
  final DocumentSnapshot data=await users_Profile.get();
  ProfileModel model=ProfileModel.fromJson(json: data.data()as Map<String,dynamic>);
  return model;
}

Future<List<PopularCircularModel>> getPopularCircularRepo()async{
  List<PopularCircularModel> _listofAll_popularCircular=[];

  CollectionReference usersPopular_Data=FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid??"").doc("AlljobCircular").collection("popularJobs");
  final QuerySnapshot data=await usersPopular_Data.get();

  for (var element in data.docs) {
    PopularCircularModel data2=PopularCircularModel.fromJson(json: element.data() as Map<String, dynamic>);
    data2.databaseKey=element.id;
    _listofAll_popularCircular.add(data2);
  }
  return _listofAll_popularCircular;
}
Future<List<RecentCircularModel>> getRecentCircularRepo()async{
  List<RecentCircularModel> _listofAll_recentCircular=[];

  CollectionReference usersrecent_Data=FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid??"").doc("AlljobCircular").collection("recentJobs");
  final QuerySnapshot data=await usersrecent_Data.get();

  for (var element in data.docs) {
    RecentCircularModel data2=RecentCircularModel.fromJson(json: element.data() as Map<String, dynamic>);
    data2.databaseKey=element.id;
    _listofAll_recentCircular.add(data2);
  }
  return _listofAll_recentCircular;
}
