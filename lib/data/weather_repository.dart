import 'package:weather_app_with_provider/data/api_service/weather_api_service.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_with_provider/data/model/city_model.dart';
import 'package:weather_app_with_provider/data/model/weather_model.dart';
class WeatherRepository{
  late Dio _dio;
  late WeatherApiService _weatherApiService;
  WeatherRepository(){
    _dio = Dio();

    _weatherApiService = WeatherApiService(_dio);
  }
  Future<List<CityModel>> searchCity({required String city}){
    return _weatherApiService.searchCity(city: city);
  }
  Future<WeatherModel> weatherInfo({required cityId}){
    return _weatherApiService.getWeatherInfo(cityId: cityId);
  }
}