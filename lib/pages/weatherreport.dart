import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather/weather.dart';
import 'package:weather_app/consts/conts.dart';

class WeatherReportr extends StatefulWidget {
  String? cityName;
  WeatherReportr({super.key, required this.cityName});

  @override
  State<WeatherReportr> createState() => _WeatherReportrState();
}

class _WeatherReportrState extends State<WeatherReportr> {
  final WeatherFactory _weather = WeatherFactory(OPENWEATHER_API_KEY);

  Weather? weather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _weather.currentWeatherByCityName(widget.cityName!).then((w) {
      setState(() {
        weather = w;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[50],
          iconTheme: IconThemeData(color: Colors.black87),
          elevation: 0.0,
        ),
        backgroundColor: Colors.teal[50],
        body: bodui());
  }

  Widget bodui() {
    if (weather == null) {
      return Center(
        child: CircularProgressIndicator(
          color: Colors.teal[300],
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weather?.areaName ?? "",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "${DateFormat("hh:mm a").format(weather!.date!)}",
                style: TextStyle(fontSize: 35),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${DateFormat("EEEE").format(weather!.date!)}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("  ${DateFormat("d.m.y").format(weather!.date!)}")
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 200,
                  child: Image.network(
                    "http://openweathermap.org/img/wn/${weather?.weatherIcon}@4x.png",
                    color: Colors.teal[200],
                  )),
              Text(
                "${weather!.weatherDescription!.toUpperCase()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "${weather!.temperature!.celsius!.toStringAsFixed(0)}° C",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 60),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.teal[100],
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Max: ${weather!.tempMax!.celsius!.toStringAsFixed(0)}° C"),
                          Text(
                              "Max: ${weather!.tempMin!.celsius!.toStringAsFixed(0)}° C")
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "Wind: ${weather!.windSpeed!.toStringAsFixed(0)} m/s"),
                          Text(
                              "Humidity: ${weather!.humidity!.toStringAsFixed(0)} %")
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
