// To parse this JSON data, do
//
//     final bookingConfirmationResponseModal = bookingConfirmationResponseModalFromJson(jsonString);

import 'dart:convert';

BookingConfirmationResponseModal bookingConfirmationResponseModalFromJson(String str) => BookingConfirmationResponseModal.fromJson(json.decode(str));

String bookingConfirmationResponseModalToJson(BookingConfirmationResponseModal data) => json.encode(data.toJson());
class BookingConfirmationResponseModal {
  String? doctorName;
  String? appointmentDate;
  String? appointmentTime;
  String? location;
  String? appointmentPackage;

  BookingConfirmationResponseModal(
      {this.doctorName,
      this.appointmentDate,
      this.appointmentTime,
      this.location,
      this.appointmentPackage});

  BookingConfirmationResponseModal.fromJson(Map<String, dynamic> json) {
    doctorName = json['doctor_name'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    location = json['location'];
    appointmentPackage = json['appointment_package'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_name'] = doctorName;
    data['appointment_date'] = appointmentDate;
    data['appointment_time'] = appointmentTime;
    data['location'] = location;
    data['appointment_package'] = appointmentPackage;
    return data;
  }
}
