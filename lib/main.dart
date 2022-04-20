import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_provider/view/change_notifier/search_city_notifier.dart';
import 'package:weather_app_with_provider/view/change_notifier/weather_detail_notifier.dart';
import 'package:weather_app_with_provider/view/screen/search_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CitySearchNotifier()),
        ChangeNotifierProvider(create: (_)=> WeatherDetailNotifier() )
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo
        ),
        home: SearchScreen(),
      ),
    );
  }
}