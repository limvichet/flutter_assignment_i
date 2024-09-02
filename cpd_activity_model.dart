// To parse this JSON data, do
//
//     final cpdActivityModel = cpdActivityModelFromJson(jsonString);

import 'dart:convert';

CpdActivityModel cpdActivityModelFromJson(String str) => CpdActivityModel.fromJson(json.decode(str));

String cpdActivityModelToJson(CpdActivityModel data) => json.encode(data.toJson());

class CpdActivityModel {
    Data data;
    int code;
    String message;

    CpdActivityModel({
        required this.data,
        required this.code,
        required this.message,
    });

    factory CpdActivityModel.fromJson(Map<String, dynamic> json) => CpdActivityModel(
        data: Data.fromJson(json["data"]),
        code: json["code"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "code": code,
        "message": message,
    };
}

class Data {
    Lookup lookup;
    List<Course> courses;

    Data({
        required this.lookup,
        required this.courses,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        lookup: Lookup.fromJson(json["lookup"]),
        courses: List<Course>.from(json["courses"].map((x) => Course.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "lookup": lookup.toJson(),
        "courses": List<dynamic>.from(courses.map((x) => x.toJson())),
    };
}

class Course {
    int scheduleCourseId;
    int cpdCourseId;
    String cpdCourseCode;
    String cpdCourseKh;
    String cpdCourseEn;
    String cpdCourseDescKh;
    int providerId;
    String providerKh;
    int credits;
    int durationHour;
    int learningOptionId;
    String learningOptionKh;
    String learningOptionEn;
    String? province;
    String? district;
    String? address;
    String qualificationKh;
    String regStartDate;
    String regEndDate;
    String startDate;
    String endDate;
    int isExpired;

    Course({
        required this.scheduleCourseId,
        required this.cpdCourseId,
        required this.cpdCourseCode,
        required this.cpdCourseKh,
        required this.cpdCourseEn,
        required this.cpdCourseDescKh,
        required this.providerId,
        required this.providerKh,
        required this.credits,
        required this.durationHour,
        required this.learningOptionId,
        required this.learningOptionKh,
        required this.learningOptionEn,
        required this.province,
        required this.district,
        required this.address,
        required this.qualificationKh,
        required this.regStartDate,
        required this.regEndDate,
        required this.startDate,
        required this.endDate,
        required this.isExpired,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        scheduleCourseId: json["schedule_course_id"],
        cpdCourseId: json["cpd_course_id"],
        cpdCourseCode: json["cpd_course_code"],
        cpdCourseKh: json["cpd_course_kh"],
        cpdCourseEn: json["cpd_course_en"],
        cpdCourseDescKh: json["cpd_course_desc_kh"],
        providerId: json["provider_id"],
        providerKh: json["provider_kh"]!,
        credits: json["credits"],
        durationHour: json["duration_hour"],
        learningOptionId: json["learning_option_id"],
        learningOptionKh: json["learning_option_kh"]!,
        learningOptionEn: json["learning_option_en"]!,
        province: json["province"],
        district: json["district"],
        address: json["address"],
        qualificationKh: json["qualification_kh"]!,
        regStartDate: json["reg_start_date"],
        regEndDate: json["reg_end_date"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        isExpired: json["is_expired"],
    );

    Map<String, dynamic> toJson() => {
        "schedule_course_id": scheduleCourseId,
        "cpd_course_id": cpdCourseId,
        "cpd_course_code": cpdCourseCode,
        "cpd_course_kh": cpdCourseKh,
        "cpd_course_en": cpdCourseEn,
        "cpd_course_desc_kh": cpdCourseDescKh,
        "provider_id": providerId,
        "provider_kh": providerKh,
        "credits": credits,
        "duration_hour": durationHour,
        "learning_option_id": learningOptionId,
        "learning_option_kh": learningOptionKh,
        "learning_option_en": learningOptionEn,
        "province": province,
        "district": district,
        "address": address,
        "qualification_kh": qualificationKh,
        "reg_start_date": regStartDate,
        "reg_end_date": regEndDate,
        "start_date": startDate,
        "end_date": endDate,
        "is_expired": isExpired,
    };
}

enum LearningOptionEn {
    FACE_TO_FACE
}

final learningOptionEnValues = EnumValues({
    "Face to Face": LearningOptionEn.FACE_TO_FACE
});

enum LearningOptionKh {
    EMPTY
}

final learningOptionKhValues = EnumValues({
    "សិក្សាជួបមុខផ្ទាល់": LearningOptionKh.EMPTY
});

enum ProviderKh {
    EMPTY,
    PROVIDER_KH
}

final providerKhValues = EnumValues({
    "នាយកដ្ឋានបឋមសិក្សា": ProviderKh.EMPTY,
    "វិទ្យាស្ថានជាតិអប់រំ": ProviderKh.PROVIDER_KH
});

enum QualificationKh {
    EMPTY,
    QUALIFICATION_KH
}

final qualificationKhValues = EnumValues({
    "ធ្លាក់ថ្នាក់ទី១២": QualificationKh.EMPTY,
    "ស.មធ្យមសិក្សាបឋមភូមិ": QualificationKh.QUALIFICATION_KH
});

class Lookup {
    List<Provider> trainingModes;
    List<Province> provinces;
    List<dynamic> districts;
    List<Provider> providers;

    Lookup({
        required this.trainingModes,
        required this.provinces,
        required this.districts,
        required this.providers,
    });

    factory Lookup.fromJson(Map<String, dynamic> json) => Lookup(
        trainingModes: List<Provider>.from(json["trainingModes"].map((x) => Provider.fromJson(x))),
        provinces: List<Province>.from(json["provinces"].map((x) => Province.fromJson(x))),
        districts: List<dynamic>.from(json["districts"].map((x) => x)),
        providers: List<Provider>.from(json["providers"].map((x) => Provider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "trainingModes": List<dynamic>.from(trainingModes.map((x) => x.toJson())),
        "provinces": List<dynamic>.from(provinces.map((x) => x.toJson())),
        "districts": List<dynamic>.from(districts.map((x) => x)),
        "providers": List<dynamic>.from(providers.map((x) => x.toJson())),
    };
}

class Provider {
    int id;
    String value;

    Provider({
        required this.id,
        required this.value,
    });

    factory Provider.fromJson(Map<String, dynamic> json) => Provider(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}

class Province {
    String id;
    String value;

    Province({
        required this.id,
        required this.value,
    });

    factory Province.fromJson(Map<String, dynamic> json) => Province(
        id: json["id"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
