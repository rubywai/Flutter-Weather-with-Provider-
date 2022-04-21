import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_provider/view/change_notifier/weather_detail_notifier.dart';

class WeatherDetailScreen extends StatelessWidget {
  final String title;
  const WeatherDetailScreen({ Key? key,required this.title }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Container(
        width: double.infinity,
        child: Consumer<WeatherDetailNotifier>(
          builder: (_,WeatherDetailNotifier detail,__){
            if(detail.loading){
              return const Center(child: CircularProgressIndicator(color: Colors.white,),);
            }
            else if(detail.error){
              return const Center(child: Text("Something Wrong",style: TextStyle(color: Colors.white),),);
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(detail.weatherModel?.consolidatedWeather?[0].applicableDate ?? "",style: const TextStyle(color: Colors.white)),
                ),
                const Divider(),
                const Text("Max Temp:",style: TextStyle(color: Colors.white)),
                Text(detail.weatherModel?.consolidatedWeather?[0].maxTemp.toString() ?? "",style: const TextStyle(color: Colors.white)),
                 const Divider(),
                const Text("Min Temp:",style: TextStyle(color: Colors.white)),
                Text(detail.weatherModel?.consolidatedWeather?[0].minTemp?.toStringAsFixed(2) ?? "",style: const TextStyle(color: Colors.white)),
                 const Divider(),
                const Text("Current Temp:",style: TextStyle(color: Colors.white)),
                Text(detail.weatherModel?.consolidatedWeather?[0].theTemp?.toStringAsFixed(2) ?? "",style: const TextStyle(color: Colors.white,fontSize: 25)),
                const Divider(),
                CachedNetworkImage(
                  imageUrl: 'https://www.metaweather.com/static/img/weather/png/64/s.png',
                  placeholder: (_,__){
                    return const Center(child: CircularProgressIndicator(strokeWidth: 3,),);
                  },
                  errorWidget: (_,__,___){
                    return const Center(child: Icon(Icons.error),);
                  },
                  fadeInDuration: Duration(seconds: 2),
                  fadeInCurve: Curves.bounceInOut,
                  ),
                const Divider(),
                Text(detail.weatherModel?.consolidatedWeather?[0].weatherStateName ?? "",style: const TextStyle(color: Colors.white,fontSize: 25)),
              ],
            );
          },
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0xff5C6BC0),
              Color(0xff3949AB),
              Color(0xff283593)
            ]
          )
        ),
      ),
      
    );
  }
}