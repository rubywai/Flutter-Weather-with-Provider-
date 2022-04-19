import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/data/model/city_model.dart';
import 'package:weather_app_with_provider/data/weather_repository.dart';

class WeatherNotifier extends ChangeNotifier{
  late WeatherRepository _weatherRepository;
  late List<CityModel> cities ;
  late bool error;
  WeatherNotifier(){
    _weatherRepository = WeatherRepository();
    cities = [];
    error = false;
  }
  void searchCity({required String city}) async{
    try{
     cities = await _weatherRepository.searchCity(city: city);
     error = false;
     notifyListeners();
    }
    catch(e){
        error = true;
        notifyListeners();
      }

  }
}