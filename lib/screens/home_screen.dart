import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_info.dart';
import '../constants/decode.dart';
import '../constants/strings.dart';
import '../helper/functions.dart';
import '../views/genie_dialog.dart';
import '../views/list_item.dart';
import 'package:intl/intl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  late Map<String, dynamic> weatherData;

  HomeScreen({Key? key, required this.weatherData}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  var currentTime = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());

  List<Item> items = [
    Item('Yesterday'),
    Item('Today'),
    Item('Tomorrow'),
  ];

  int selectedIndex = 2;

  @override
  void initState() {
    super.initState();
  }

  Future<void> refreshData() async {
    try {
      setState(() {
        isLoading = true;
      });

      final refreshedData = await fetchWeatherData();

      setState(() {
        widget.weatherData.clear();
        widget.weatherData.addAll(refreshedData);
        currentTime = DateFormat('dd-MM-yyyy HH:mm:ss').format(DateTime.now());
        isLoading = false;
      });
    } catch (error) {
      print('$failedToLoad: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  _showDialog(title, description) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return GenieDialog(title:title, description:description);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitleText),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: isLoading ? null : refreshData,
          ),
          IconButton(
            icon: const Icon(Icons.help_center_outlined),
            onPressed: () {
              _showDialog(appTitleText, helpMessage);
            },
          ),
          IconButton(
            icon: const Icon(Icons.location_on_outlined),
            onPressed: () {
              _showDialog(appTitleText, yetToBeImplemented);
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.teal.shade100, Colors.teal.shade600],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return StaticListItem(
                        weatherData: widget.weatherData,
                        lastUpdate: currentTime);
                  }
                  final isActive = index == selectedIndex;
                  final backgroundColor = isActive
                      ? theme.primaryColor
                      : Colors.grey.withOpacity(0.5);
                  return Card(
                    elevation: isActive ? 10 : 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: GestureDetector(
                      onDoubleTap: () {
                        isActive
                            ? _showDialog(
                                getCode(widget.weatherData['daily']
                                    ['weathercode'][index + 1])['decode'],
                                getCode(widget.weatherData['daily']
                                    ['weathercode'][index + 1])['message'])
                            : null;
                      },
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: WeatherInfo(
                        isActive: isActive,
                        backgroundColor: backgroundColor,
                        day: items[index - 1].day,
                        time: widget.weatherData['daily']['time'][index + 1],
                        maxTemperature: widget.weatherData['daily']
                                ['temperature_2m_max'][index + 1]
                            .toString(),
                        minTemperature: widget.weatherData['daily']
                                ['temperature_2m_min'][index + 1]
                            .toString(),
                        weatherCode: getCode(widget.weatherData['daily']
                            ['weathercode'][index + 1])['icn'],
                        weatherDescription: getCode(widget.weatherData['daily']
                            ['weathercode'][index + 1])['decode'],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.8),
              child: const Center(
                child: SpinKitDoubleBounce(
                  color: Colors.white,
                  size: 80.0,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
