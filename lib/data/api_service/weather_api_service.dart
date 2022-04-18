
import 'package:retrofit/retrofit.dart';
import 'package:weather_app_with_provider/const/const.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_with_provider/data/model/city_model.dart';
import 'package:weather_app_with_provider/data/model/weather_model.dart';
part 'weather_api_service.g.dart';
@RestApi(baseUrl: Const.BASE_URL)
abstract class WeatherApiService {
  factory WeatherApiService(Dio dio) => _WeatherApiService(dio);
  
  @GET("location/search/")
  Future<List<CityModel>> searchCity({@Query("query") required String city });

  @GET("location/{cityId}")
  Future<WeatherModel> getWeatherInco({@Path("cityId") required String cityId});


}