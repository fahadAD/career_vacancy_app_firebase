
class PopularAppliedModel{
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
  late int quantity;
  String? databaseKey;

  PopularAppliedModel({

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
    this.databaseKey,
    required this.quantity,
    // this.isAdmin,

  });

}

class RecentAppliedModel{
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
  late int quantity;
  String? databaseKey;


  RecentAppliedModel({

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
    this.databaseKey,
    required this.quantity
    // this.isAdmin,

  });

}