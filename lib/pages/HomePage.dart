import 'package:flutter/material.dart';
import 'package:weather_app/pages/weatherreport.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  checkWeather(cityName) async {
    if (cityName != '') {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WeatherReportr(cityName: cityName)));
      cityNameController.clear();
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Empty City Name"),
                content: Text("Please enter a city name to check the weather."),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Exit",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.bold),
                      ))
                ],
                backgroundColor: Colors.teal[50],
              ));
    }
  }

  TextEditingController cityNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[300],
        title: Text(
          'Weather Reporter',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 70,
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter the City Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 60,
                padding: EdgeInsets.only(left: 10, top: 5),
                decoration: BoxDecoration(
                    color: Colors.teal[50],
                    borderRadius: BorderRadius.circular(20)),
                child: TextField(
                  controller: cityNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.manage_search,
                        color: Colors.teal[500],
                      ),
                      border: InputBorder.none,
                      hintText: "Eg: pondicherry"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  checkWeather(cityNameController.text.toString());
                },
                child: Text(
                  "Check Weather",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(170, 50),
                    backgroundColor: Colors.teal[100],
                    elevation: 1),
              )
            ],
          )),
    );
  }
}
