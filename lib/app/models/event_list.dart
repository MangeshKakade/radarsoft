class EventList {
  bool? status;
  List<Data>? data;

  EventList({this.status, this.data});

  EventList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['eventName'] = eventName;
    data['categoryMaster'] = categoryMaster;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['customBooking'] = customBooking;
    data['generalInfo'] = generalInfo;
    data['amount'] = amount;
    data['location'] = location;
    data['venue'] = venue;
    data['organiserMaster'] = organiserMaster;
    data['organiserName'] = organiserName;
    data['locationMapLink'] = locationMapLink;
    data['bookingMaxLimit'] = bookingMaxLimit;
    data['description'] = description;
    data['eventBanner'] = eventBanner;
    data['createdDate'] = createdDate;
    data['updatedDate'] = updatedDate;
    data['isActive'] = isActive;
    data['eventCount'] = eventCount;
    return data;
  }
}