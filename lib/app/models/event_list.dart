class EventList {
  bool? status;
  List<Data>? data;

  EventList({this.status, this.data});

  EventList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? eventName;
  String? categoryMaster;
  String? startDate;
  String? endDate;
  String? customBooking;
  String? generalInfo;
  int? amount;
  String? location;
  String? venue;
  String? organiserMaster;
  String? organiserName;
  String? locationMapLink;
  String? bookingMaxLimit;
  String? description;
  String? eventBanner;
  String? createdDate;
  String? updatedDate;
  int? isActive;
  int? eventCount;

  Data(
      {this.sId,
        this.eventName,
        this.categoryMaster,
        this.startDate,
        this.endDate,
        this.customBooking,
        this.generalInfo,
        this.amount,
        this.location,
        this.venue,
        this.organiserMaster,
        this.organiserName,
        this.locationMapLink,
        this.bookingMaxLimit,
        this.description,
        this.eventBanner,
        this.createdDate,
        this.updatedDate,
        this.isActive,
        this.eventCount});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    eventName = json['eventName'];
    categoryMaster = json['categoryMaster'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    customBooking = json['customBooking'];
    generalInfo = json['generalInfo'];
    amount = json['amount'];
    location = json['location'];
    venue = json['venue'];
    organiserMaster = json['organiserMaster'];
    organiserName = json['organiserName'];
    locationMapLink = json['locationMapLink'];
    bookingMaxLimit = json['bookingMaxLimit'];
    description = json['description'];
    eventBanner = json['eventBanner'];
    createdDate = json['createdDate'];
    updatedDate = json['updatedDate'];
    isActive = json['isActive'];
    eventCount = json['eventCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['eventName'] = this.eventName;
    data['categoryMaster'] = this.categoryMaster;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['customBooking'] = this.customBooking;
    data['generalInfo'] = this.generalInfo;
    data['amount'] = this.amount;
    data['location'] = this.location;
    data['venue'] = this.venue;
    data['organiserMaster'] = this.organiserMaster;
    data['organiserName'] = this.organiserName;
    data['locationMapLink'] = this.locationMapLink;
    data['bookingMaxLimit'] = this.bookingMaxLimit;
    data['description'] = this.description;
    data['eventBanner'] = this.eventBanner;
    data['createdDate'] = this.createdDate;
    data['updatedDate'] = this.updatedDate;
    data['isActive'] = this.isActive;
    data['eventCount'] = this.eventCount;
    return data;
  }
}