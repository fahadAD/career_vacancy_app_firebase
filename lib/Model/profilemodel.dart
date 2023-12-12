class ProfileModel {
  String? name;
  String? number;
  String? dateofBith;
  String? personGender;

  String? jobType;
  String? employmentType;
  String? shiftType;
  String? workplaceType;

  String? educationType;
  String? degreeName;
  String? instituteName;
  String? fielsOfstudyName;
  String? edu_startDate;
  String? edu_endDate;

  String? workOrgName;
  String? workPositionName;
  String? workDepartmentName;
  String? work_startDate;
  String? work_endDate;
  String? workResponsibalDetails;

  // bool? isAdmin;

  ProfileModel({
    this.name,
    this.number,
    this.dateofBith,
    this.personGender,

    this.employmentType,
    this.jobType,
    this.shiftType,
    this.workplaceType,

    this.degreeName,
    this.edu_endDate,
    this.edu_startDate,
    this.educationType,
    this.fielsOfstudyName,
    this.instituteName,

    this.work_endDate,
    this.work_startDate,
    this.workDepartmentName,
    this.workOrgName,
    this.workPositionName,
    this.workResponsibalDetails,
    // this.isAdmin,
  });

  ProfileModel.fromJson({required Map<String, dynamic> json}) {
    name = json["name"];
    number = json["number"];
    dateofBith = json["dateofBith"];
    personGender = json["personGender"];

    jobType = json["jobType"];
    employmentType = json["employmentType"];
    shiftType = json["shiftType"];
    workplaceType = json["workplaceType"];

    educationType = json["educationType"];
    degreeName = json["degreeName"];
    instituteName = json["instituteName"];
    fielsOfstudyName = json["fielsOfstudyName"];
    edu_startDate = json["edu_startDate"];
    edu_endDate = json["edu_endDate"];

    workOrgName = json["workOrgName"];
    workPositionName = json["workPositionName"];
    workDepartmentName = json["workDepartmentName"];
    work_startDate = json["work_startDate"];
    work_endDate = json["work_endDate"];
    workResponsibalDetails = json["workResponsibalDetails"];
    // isAdmin = json["isAdmin"];

  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        "name": name,
        "number": number,
        "dateofBith": dateofBith,
        "personGender": personGender,

    "jobType": jobType,
    "employmentType": employmentType,
    "shiftType": shiftType,
    "workplaceType": workplaceType,

    "educationType": educationType,
    "degreeName": degreeName,
    "instituteName": instituteName,
    "fielsOfstudyName": fielsOfstudyName,
    "edu_startDate": edu_startDate,
    "edu_endDate": edu_endDate,

    "workOrgName": workOrgName,
    "workPositionName": workPositionName,
    "workDepartmentName": workDepartmentName,
    "work_startDate": work_startDate,
    "work_endDate": work_endDate,
    "workResponsibalDetails": workResponsibalDetails,
    // "isAdmin": isAdmin,
      };
}
