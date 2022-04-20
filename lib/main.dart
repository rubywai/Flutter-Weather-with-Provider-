import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_with_provider/view/change_notifier/search_city_notifier.dart';
import 'package:weather_app_with_provider/view/screen/search_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (_) => CitySearchNotifier(),
        child: SearchScreen(),
      )
    );
  }
}