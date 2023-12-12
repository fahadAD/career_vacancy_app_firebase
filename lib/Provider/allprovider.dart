 import 'package:flutter/cupertino.dart';
 import '../Model/appliedModel.dart';
import '../Model/popular_circular_model.dart';
import '../Model/profilemodel.dart';
 import '../Model/recent_circular_model.dart';
import '../Repo/allrepo.dart';
class ProfileProvider extends ChangeNotifier {
  ProfileModel profile = ProfileModel();
  bool isloding = false;

  Future<void> getProfile() async {
    isloding = true;
    profile = await getProfileRepo();
    isloding = false;
    notifyListeners();
  }

}


 class PopularCircularProvider extends ChangeNotifier {
   List<PopularCircularModel>  jobcircular =[];
   List<PopularCircularModel>  fav_popular_cirular =[];
   bool isloding = false;

   Future<void> getPopularCircular() async {
     isloding = true;
     jobcircular=await getPopularCircularRepo();
     isloding = false;
     notifyListeners();
   }


   Future<void> updatePopularCircular() async {
     jobcircular = await getPopularCircularRepo();
     getFavouritePopularCircular();
     notifyListeners();
   }

   getFavouritePopularCircular()async{
     fav_popular_cirular.clear();
     for (var element in jobcircular) {
       if(element.isFav){
         fav_popular_cirular.add(element);
       }
     }
     // notifyListeners();
   }

 }

 class RecentCircularProvider extends ChangeNotifier {
   List<RecentCircularModel>  receent_jobcircular =[];
   List<RecentCircularModel>  fav_recent_cirular =[];
   bool isloding = false;

   Future<void> getRecentCircular() async {
     isloding = true;
     receent_jobcircular=await getRecentCircularRepo();
     isloding = false;
     notifyListeners();
   }


   Future<void> updateRecentCircular() async {
     receent_jobcircular = await getRecentCircularRepo();
     getFavouriteRecentCircular();
     notifyListeners();
   }

   getFavouriteRecentCircular()async{
     fav_recent_cirular.clear();
     for (var element in receent_jobcircular) {
       if(element.isFav){
         fav_recent_cirular.add(element);
       }
     }
     // notifyListeners();
   }

 }


  class PopularAppliedProvider extends ChangeNotifier{
   List<PopularAppliedModel>  popularList =[];

   addtopopularApply({required PopularAppliedModel populatApplied_Model})async{
     if(popularList.isNotEmpty){
       for (var elements in popularList) {

         if(elements.circularId==populatApplied_Model.circularId){
           elements.quantity++;
           break;
         }
         if(elements==popularList.last){
           popularList.add(populatApplied_Model);
         }
       }
     }else{
       popularList.add(populatApplied_Model);
     }
     // calculateSubtotal();
     notifyListeners();
   }

   deletefromCart({required PopularAppliedModel cart_Model})async{
     popularList.remove(cart_Model);
     // calculateSubtotal();
     notifyListeners();
   }
 }

 class RecentAppliedProvider extends ChangeNotifier{
   List<RecentAppliedModel>  recentList =[];

   addtorecentApply({required RecentAppliedModel recentApplied_Model})async{
     if(recentList.isNotEmpty){
       for (var elements in recentList) {

         if(elements.circularId==recentApplied_Model.circularId){
           elements.quantity++;
           break;
         }
         if(elements==recentList.last){
           recentList.add(recentApplied_Model);
         }
       }
     }else{
       recentList.add(recentApplied_Model);
     }
     // calculateSubtotal();
     notifyListeners();
   }

   deletefromCart({required RecentAppliedModel cart_Model})async{
     recentList.remove(cart_Model);
     // calculateSubtotal();
     notifyListeners();
   }
 }