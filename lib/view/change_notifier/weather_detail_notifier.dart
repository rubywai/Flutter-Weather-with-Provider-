import 'package:flutter/material.dart';
import 'package:weather_app_with_provider/data/model/weather_model.dart';
import 'package:weather_app_with_provider/data/weather_repository.dart';

class WeatherDetailNotifier extends ChangeNotifier {
  final WeatherRepository _weatherRepository = WeatherRepository();
  bool loading = false;
  bool error = false;
  WeatherModel? weatherModel;
  void getWeatherInfo(String cityId) async{
    try{
      loading = true;
      notifyListeners();
      weatherModel = await  _weatherRepository.weatherInfo(cityId: cityId);
      loading = false;
      error = false;
      notifyListeners();
    }
    catch(e){
      error = false;
      notifyListeners();
    }
  }
}
