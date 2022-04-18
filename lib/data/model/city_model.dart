class CityModel {
  String? title;
  String? locationType;
  int? woeid;
  String? lattLong;

  CityModel({this.title, this.locationType, this.woeid, this.lattLong});

  CityModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    locationType = json['location_type'];
    woeid = json['woeid'];
    lattLong = json['latt_long'];
  }

 
}