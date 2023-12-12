import 'package:career_project_firebase/All%20Screens/Mainscreen/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import '../Provider/allprovider.dart';
import 'Mainscreen/home.dart';
import 'Mainscreen/jobs.dart';
class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({super.key});

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {

  Future<bool> showExitDialog()async{
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
  }

  int _selectedIndex = 0;

  static   List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Myjobs(),
   Container(color: Colors.green,),
    Profile(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProfileProvider>(context,listen: false).getProfile();
    Provider.of<PopularCircularProvider>(context,listen: false).getPopularCircular();
    Provider.of<RecentCircularProvider>(context,listen: false).getRecentCircular();
  }
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: showExitDialog,
      child: Scaffold(
body: _widgetOptions[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),

          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: Colors.black,
                hoverColor: Colors.black,
                gap: 10,
                activeColor: Colors.black,
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.blue.shade50,
                color: Colors.black,
                tabs:    [

                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.work,
                    text: 'My Jobs',
                  ),
                  GButton(
                    icon: Icons.notifications,
                    text: 'Notification',
                  ),
                  GButton(
                    icon: Icons.person,
                    text: 'Profile',
                  ),

                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
