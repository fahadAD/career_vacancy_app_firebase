import 'package:flutter/material.dart';

import '../bottomNavigations.dart';
import 'My Jobs/appliedjobs.dart';
import 'My Jobs/savedjobs.dart';
class Myjobs extends StatefulWidget {
  const Myjobs({super.key});

  @override
  State<Myjobs> createState() => _MyjobsState();
}

class _MyjobsState extends State<Myjobs> {






  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
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
          title: Text("My Jobs",style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.blue.shade50,
          bottom: TabBar(
            // labelColor: Colors.red,
              indicatorColor: Colors.blue,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight:  3.0,
              tabs: [
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.save,color: Colors.blue),
                      SizedBox(width: 10,),
                      Text("Saved Jobs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      Icon(Icons.send_outlined,color: Colors.blue),
                      SizedBox(width: 10,),
                      Text("Applies Jobs",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),


              ]),
        ),

        body: TabBarView(

          children: [
            SavedJobs(),
            AppliedJobs(),
//
// const SizedBox(height: 10,),
//
//           Center(
//             child: ToggleButtons(
//
//               direction: vertical ? Axis.vertical : Axis.horizontal,
//
//               onPressed: (int index) {
//                 setState(() {
//                   for (int i = 0; i < _selectedFruits.length; i++) {
//                     _selectedFruits[i] = i == index;
//                   }
//                 });
//               },
//               borderRadius: const BorderRadius.all(Radius.circular(8)),
//               borderColor: Colors.blue,
//               selectedBorderColor: Colors.black,
//               selectedColor: Colors.white,
//               fillColor: Colors.blue,
//               color: Colors.blue,
//               constraints: const BoxConstraints(
//                 minHeight: 50.0,
//                 minWidth: 90.0,
//               ),
//               isSelected: _selectedFruits,
//               children: fruits,
//             ),
//           ),
          ],
        ),
      ),
    );
  }
}
