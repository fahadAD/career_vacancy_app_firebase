
class RecentCircularModel {
  late String companyName;
  late  String positionName;
  late  String salaryAmount;
  late  String locationName;

  late  String gender;
  late String experience;
  late String employeType;
  late String workplaceType;

  late String circularPostedDate;
  late String circularDeadlineDate;
  late String educationLevel;
  late String vacancy;
  late String englishLevel;
  late  String facilities;

  late  String weeklyWorkHolydays;
  late  String jobDescription;
  late String jobResponsibilities;
  late bool isFav;
  late int circularId;
  late String circularImage;
  late String circularBackgroundImage;
  String? databaseKey;
  RecentCircularModel({
    required this.gender,
    required this.workplaceType,
    required this.circularDeadlineDate,
    required this.circularPostedDate,
    required this.companyName,
    required this.educationLevel,
    required this.employeType,
    required this.englishLevel,
    required this.experience,
    required this.facilities,
    required this.jobDescription,
    required this.jobResponsibilities,
    required this.locationName,
    required this.positionName,
    required this.salaryAmount,
    required this.vacancy,
    required this.weeklyWorkHolydays,
    required this.isFav,
    required this.circularId,
    required this.circularImage,
    required this.circularBackgroundImage,
    this.databaseKey
    // this.isAdmin,
  });

  RecentCircularModel.fromJson({required Map<String, dynamic> json}) {
    companyName = json["companyName"];
    positionName = json["positionName"];
    salaryAmount = json["salaryAmount"];
    locationName = json["locationName"];
    gender = json["gender"];
    experience = json["experience"];
    employeType = json["employeType"];
    workplaceType = json["workplaceType"];
    circularPostedDate = json["circularPostedDate"];
    circularDeadlineDate = json["circularDeadlineDate"];
    educationLevel = json["educationLevel"];
    vacancy = json["vacancy"];
    englishLevel = json["englishLevel"];
    facilities = json["facilities"];
    weeklyWorkHolydays = json["weeklyWorkHolydays"];
    jobDescription = json["jobDescription"];
    jobResponsibilities = json["jobResponsibilities"];
    isFav = json["isFav"];
    circularId = json["circularId"];
    circularImage = json["circularImage"];
    circularBackgroundImage = json["circularBackgroundImage"];
    // isAdmin = json["isAdmin"];
  }
  Map<String, dynamic> toJson() => <String, dynamic>{
    "companyName": companyName,
    "positionName": positionName,
    "salaryAmount": salaryAmount,
    "locationName": locationName,
    "gender": gender,
    "experience": experience,
    "employeType": employeType,
    "workplaceType": workplaceType,

    "circularPostedDate": circularPostedDate,
    "circularDeadlineDate": circularDeadlineDate,
    "educationLevel": educationLevel,
    "vacancy": vacancy,
    "englishLevel": englishLevel,
    "facilities": facilities,

    "weeklyWorkHolydays": weeklyWorkHolydays,
    "jobDescription": jobDescription,
    "jobResponsibilities": jobResponsibilities,
    "isFav": isFav,
    "circularId": circularId,
    "circularImage": circularImage,
    "circularBackgroundImage": circularBackgroundImage,
    // "isAdmin": isAdmin,
  };
}