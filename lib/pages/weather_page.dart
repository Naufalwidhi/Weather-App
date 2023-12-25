import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/services/weather_services.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {

  // API Key
  final _weatherService = WeatherService("daaec59ac7d4b39a0c921469fee45e47");
  Weather? _weather;

  // Fetch Weather
  _fetchWeather() async {
    // Get Current City
    String cityName = await _weatherService.getCurrentCity();

    // Get Weather City
    try{
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    }
    catch(e){
      print(e);
    }
  }

  // Weatherr Animations

  // init state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city.. "),
            Text("${_weather?.temperature.round().toString()}°C "),
          ],
        ),
      ),
    );
  }
}