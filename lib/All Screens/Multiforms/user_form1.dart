 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Model/profilemodel.dart';
import '../bottomNavigations.dart';
import '../Mainscreen/profile.dart';
 class UserForm1 extends StatefulWidget {
  const UserForm1({super.key});

  @override
  State<UserForm1> createState() => _UserForm1State();
}

class _UserForm1State extends State<UserForm1> {

     //1st form
  TextEditingController _nameController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  List<String> gender = ["Male", "Female", "Other"];
  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 0),
      firstDate: DateTime(DateTime.now().year - 40),
      lastDate: DateTime(DateTime.now().year),
    );

    if (picked != null) {
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }

  }

  //Second form
  TextEditingController _jobCatagoryController = TextEditingController();
  List<String> jobCatagory = [
    "Call Center & BPO","Delivery & Rider", "Design & Creative","Consulting", "Field Oparation","Gvt & Gvt Org", "Sales","Technology & ICT",
  ];
  TextEditingController _empolyMentController = TextEditingController();
  List<String> empolyMentCatagory = [
    "Full Time", "Part Time","Contract Basis","Internship", "Both"
  ];
  TextEditingController _workplaceController = TextEditingController();
  List<String> workplaceCatagory = [
    "Workform Office", "Remote","Field" ,"Both",
  ];
  TextEditingController _shiftController = TextEditingController();
  List<String> shiftCatagory = [
    "Day Shift", "Night Shift",
  ];

//Third form
  TextEditingController _educationCatagoryController = TextEditingController();
  TextEditingController _degreeCatagoryController = TextEditingController();
  TextEditingController _instituteCatagoryController = TextEditingController();
  TextEditingController _subCatagoryController = TextEditingController();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  List<String> educationCatagory = [
    "No Education","JSC/JDC/8 Pass", "Secondary","High Secondary", "Diploma","Bachelors", "Masters","Phd","Other",
  ];
  Future<void> _startDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 0),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year),
    );

    if (picked != null) {
      setState(() {
        _startDateController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }

  }
  Future<void> _endDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 0),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year),
    );

    if (picked != null) {
      setState(() {
        _endDateController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }

  }

//Fourth Fourm
  bool _switches=false;
  TextEditingController _organizationController = TextEditingController();
  TextEditingController _positionCatagoryController = TextEditingController();
  TextEditingController _departmentCatagoryController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _job_startDateController = TextEditingController();
  TextEditingController _job_endDateController = TextEditingController();

  Future<void> _starJobtDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 0),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year),
    );

    if (picked != null) {
      setState(() {
        _job_startDateController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }

  }
  Future<void> _endJobDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 0),
      firstDate: DateTime(DateTime.now().year - 20),
      lastDate: DateTime(DateTime.now().year),
    );

    if (picked != null) {
      setState(() {
        _job_endDateController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
    }

  }


  Future<void> userFormPost_data_SetupFun({required ProfileModel user_ProfileModel})async{
    EasyLoading.show(status: "Loding...");
    DocumentReference usersform_Data=FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.uid??"").doc("ProfileData");
    // EasyLoading.dismiss();
    await  usersform_Data.set(user_ProfileModel.toJson());
    EasyLoading.showSuccess("Profile Information Fillup Successful Done");
    Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNavigatorScreen(),));

  }


  @override
  Widget build(BuildContext context) {
    return   SafeArea(
      child: Scaffold(
        bottomNavigationBar:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20),
          child: GestureDetector(
            onTap: () {
              ProfileModel _profileModel=ProfileModel(
                name: _nameController.text,
                number: _numberController.text,
                personGender: _genderController.text,
                dateofBith: _dobController.text,
                jobType: _jobCatagoryController.text,
                 employmentType: _empolyMentController.text,
                workplaceType: _workplaceController.text,
                shiftType: _shiftController.text,
                degreeName: _degreeCatagoryController.text,
                edu_endDate: _endDateController.text,
                edu_startDate: _startDateController.text,
                educationType: _educationCatagoryController.text,
                 instituteName: _instituteCatagoryController.text,
                work_endDate: _job_endDateController.text,
                work_startDate: _job_startDateController.text,
                workDepartmentName: _departmentCatagoryController.text,
                 fielsOfstudyName: _subCatagoryController.text,
                workOrgName: _organizationController.text,
                workPositionName: _positionCatagoryController.text,
                workResponsibalDetails: _descriptionController.text,


              );

userFormPost_data_SetupFun(user_ProfileModel: _profileModel);
             },
            child: Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: 53,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.indigoAccent
              ),
              child:Center(child: const Text("Next",style: TextStyle(color: Colors.white,fontSize: 20))),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
//First
              Text("Profile Information",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),),
              SizedBox(height: 13,),
              Text("To update your profile information\n      please fill-up form the valid\n                     information",style: TextStyle(fontSize: 16,color: Colors.grey,letterSpacing: 1),),

              SizedBox(height: 30,),

              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 17.0),
  child:   Container(

    width: MediaQuery.of(context).size.width,

    height: 50,

    decoration: BoxDecoration(

      color: Colors.white,

      borderRadius: BorderRadius.circular(12),

      border: Border.all(color: Colors.blue,width: 2),

    ),

    child: TextFormField(
controller: _nameController,


      decoration: InputDecoration(

          hintText: " Enter your Full Name",

          hintStyle: const TextStyle(color: Colors.grey),

          enabledBorder: InputBorder.none,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
focusedBorder: InputBorder.none,
errorBorder: InputBorder.none,
prefixIcon: Icon(Icons.person,color: Colors.grey,)


      ),

    ),

  ),
),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child:   Container(

                  width: MediaQuery.of(context).size.width,

                  height: 50,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(12),

                    border: Border.all(color: Colors.blue,width: 2),

                  ),

                  child: TextFormField(
                    controller: _numberController,
                    decoration: InputDecoration(

                        hintText: " Enter Your Number(+88)",

                        hintStyle: const TextStyle(color: Colors.grey),

                        enabledBorder: InputBorder.none,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.phone,color: Colors.grey,)


                    ),

                  ),

                ),
              ),
              SizedBox(height: 16,),
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 17.0),
  child:   Container(

    width: MediaQuery.of(context).size.width,

    height: 50,

    decoration: BoxDecoration(

      color: Colors.blue.shade50,

      borderRadius: BorderRadius.circular(12),



    ),

    child: TextField(
      controller: _genderController,
      readOnly: true,
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: " Choose your gender",
        prefixIcon: Icon(Icons.people_outlined,color: Colors.grey),
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton<String>(
            items: gender.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
                onTap: () {
                  setState(() {
                    _genderController.text = value;
                  });
                },
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),

      ),

    ),

  ),
),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child:   Container(

                  width: MediaQuery.of(context).size.width,

                  height: 50,

                  decoration: BoxDecoration(

                    color: Colors.blue.shade50,

                    borderRadius: BorderRadius.circular(12),



                  ),

                  child: TextField(
                    controller: _dobController,
                    readOnly: true,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: " Date of birth",
                      prefixIcon: Icon(Icons.date_range_sharp,color: Colors.grey),
                      suffixIcon: IconButton(
                        onPressed: () => _selectDateFromPicker(context),
                        icon: Icon(Icons.arrow_drop_down_circle,color: Colors.black),
                      ),

                    ),

                  ),

                ),
              ),
              SizedBox(height: 16,),
//Second
              SizedBox(height: 30,),
              Align(alignment:Alignment.topRight,child: Text("Job preference  ",style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),)),
              SizedBox(height: 13,),
              Align(alignment:Alignment.topRight,child: Text("Get job on your preference  ",style: TextStyle(fontSize: 16,color: Colors.black,letterSpacing: 1),)),

              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment:Alignment.topLeft,child: Text("  What kind of jobs you are looking for?",style: TextStyle(fontSize: 16,color: Colors.blueGrey,letterSpacing: 1),)),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child:   Container(

                  width: MediaQuery.of(context).size.width,

                  height: 60,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(12),

border: Border.all(color: Colors.black)

                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _jobCatagoryController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Select Catagory",
                        suffixIcon: DropdownButton<String>(

                          items: jobCatagory.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _jobCatagoryController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),

                      ),

                    ),
                  ),

                ),
              ),
              SizedBox(height: 16,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment:Alignment.topLeft,child: Text("  Employment Type",style: TextStyle(fontSize: 16,color: Colors.blueGrey,letterSpacing: 1),)),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child:   Container(

                  width: MediaQuery.of(context).size.width,

                  height: 60,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)


                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _empolyMentController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Select Employment",
                        suffixIcon: DropdownButton<String>(
                          items: empolyMentCatagory.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _empolyMentController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),

                      ),

                    ),
                  ),

                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment:Alignment.topLeft,child: Text("  Workplace Type",style: TextStyle(fontSize: 16,color: Colors.blueGrey,letterSpacing: 1),)),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child:   Container(

                  width: MediaQuery.of(context).size.width,

                  height: 60,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black)



                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _workplaceController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Select Workplace",
                        suffixIcon: DropdownButton<String>(
                          items: workplaceCatagory.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _workplaceController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),

                      ),

                    ),
                  ),

                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(alignment:Alignment.topLeft,child: Text("  Shift Type",style: TextStyle(fontSize: 16,color: Colors.blueGrey,letterSpacing: 1),)),
              ),

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child:   Container(

                  width: MediaQuery.of(context).size.width,

                  height: 60,

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius: BorderRadius.circular(12),

                      border: Border.all(color: Colors.black)


                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _shiftController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: "Select Shift",
                        suffixIcon: DropdownButton<String>(
                          elevation: 0,
                          items: shiftCatagory.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _shiftController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),

                      ),

                    ),
                  ),

                ),
              ),
              SizedBox(height: 16,),

          //ThirD
              SizedBox(height: 30,),
              Align(alignment:Alignment.topRight,child: Text("Enter your highest leavel of education  ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)),

              SizedBox(height: 60,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _educationCatagoryController,
                  decoration: InputDecoration(
                    labelText: "Education Level",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: DropdownButton<String>(

                        items: educationCatagory.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                            onTap: () {
                              setState(() {
                                _educationCatagoryController.text = value;
                              });
                            },
                          );
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),


                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _degreeCatagoryController,
                  decoration: InputDecoration(
                    labelText: "Degree Tittle",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),

                  ),


                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _instituteCatagoryController,
                  decoration: InputDecoration(
                    labelText: "Institutions",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),

                  ),


                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _subCatagoryController,
                  decoration: InputDecoration(
                    labelText: "Subject/Field of Study",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),

                  ),


                ),
              ),
              SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                    width: MediaQuery.of(context).size.width*0.45,

                    height: 50,

                    decoration: BoxDecoration(

                      color: Colors.blue.shade50,

                      borderRadius: BorderRadius.circular(12),



                    ),

                    child: TextField(
                      controller: _startDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText : "Start Date",
                        prefixIcon: IconButton(

                          onPressed: () => _startDateFromPicker(context),
                          icon: Icon(Icons.date_range_sharp,color: Colors.blue),
                        ),


                      ),

                    ),

                  ),
                  Container(

                    width: MediaQuery.of(context).size.width*0.45,

                    height: 50,

                    decoration: BoxDecoration(

                      color: Colors.blue.shade50,

                      borderRadius: BorderRadius.circular(12),



                    ),

                    child: TextField(
                      controller: _endDateController,

                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText : "End Date",
                        prefixIcon: IconButton(

                          onPressed: () => _endDateFromPicker(context),                        icon: Icon(Icons.date_range_sharp,color: Colors.blue),
                        ),


                      ),

                    ),

                  ),
                ],),

              // Four

              SizedBox(height: 20,),
              Align(alignment:Alignment.topRight,child: Text("Work Experience  ",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),)),
              SizedBox(height: 10,),
              Align(alignment:Alignment.topRight,child: Text("Enter your Latest Work Experience  ",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.normal),)),

              SizedBox(height:40,),
              Align(alignment:Alignment.topLeft,child: Text("   Do you have any work experience?",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal),)),
              SizedBox(height:20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue.shade200,
                      borderRadius: BorderRadius.all(Radius.circular(10,),

                      )),
                  width: double.infinity,
                  height: 55,
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10,),

                              )),
                          child: Center(child: Text("Yes, i have",style: TextStyle(color: Colors.black))),
                          width: MediaQuery.of(context).size.width*0.3,
                          height: 40),

                      CupertinoSwitch(

                        trackColor: Colors.black,
                        value: _switches, onChanged: (value) {
                        setState(() {
                          _switches=value;
                        });
                      },),

                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10,),

                            )),
                        width: MediaQuery.of(context).size.width*0.3,
                        height: 40,
                        child: Center(child: Text("No, i don't have",style: TextStyle(color: Colors.black))),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:20,),
              Align(alignment:Alignment.topLeft,child: Text("   Job Information",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.normal),)),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _organizationController,
                  decoration: InputDecoration(
                    labelText: "Organigation Name",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),

                  ),


                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _positionCatagoryController,
                  decoration: InputDecoration(
                    labelText: "Job Tittle/Position",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),

                  ),


                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _departmentCatagoryController,
                  decoration: InputDecoration(
                    labelText: "Department",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),

                  ),


                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(

                    width: MediaQuery.of(context).size.width*0.45,

                    height: 50,

                    decoration: BoxDecoration(

                      color: Colors.blue.shade50,

                      borderRadius: BorderRadius.circular(12),



                    ),

                    child: TextField(
                      controller: _job_startDateController,
                      readOnly: true,
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText : "Job Start Date",
                        prefixIcon: IconButton(

                          onPressed: () => _starJobtDateFromPicker(context),
                          icon: Icon(Icons.date_range_sharp,color: Colors.blue),
                        ),


                      ),

                    ),

                  ),
                  Container(

                    width: MediaQuery.of(context).size.width*0.45,

                    height: 50,

                    decoration: BoxDecoration(

                      color: Colors.blue.shade50,

                      borderRadius: BorderRadius.circular(12),



                    ),

                    child: TextField(
                      controller: _job_endDateController,

                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        labelText : "Job End Date",
                        prefixIcon: IconButton(

                          onPressed: () => _endJobDateFromPicker(context),                        icon: Icon(Icons.date_range_sharp,color: Colors.blue),
                        ),


                      ),

                    ),

                  ),
                ],),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child:   TextFormField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description & Responsibilities About You",
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue,width: 2, style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black,)),
                  ),


                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
