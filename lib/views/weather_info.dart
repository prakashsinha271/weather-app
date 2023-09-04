import 'package:flutter/material.dart';

class WeatherInfo extends StatelessWidget {
  final bool isActive;
  final Color backgroundColor;
  final String day;
  final String time;
  final String maxTemperature;
  final String minTemperature;
  final Widget weatherCode;
  final String weatherDescription;

  const WeatherInfo({
    super.key,
    required this.isActive,
    required this.backgroundColor,
    required this.day,
    required this.time,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherCode,
    required this.weatherDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.teal.shade100, Colors.teal.shade600],
        ),
        borderRadius: BorderRadius.circular(30.0),
        color: backgroundColor,
        boxShadow: isActive
            ? [
                const BoxShadow(
                  color: Colors.orangeAccent,
                  blurRadius: 4,
                  offset: Offset(4, 8),
                ),
              ]
            : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontSize: isActive ? 23.0 : 16,
              color: isActive ? Colors.white : Colors.teal,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              shadows: isActive
                  ? [
                      const Shadow(
                        blurRadius: 1.0,
                        color: Colors.red,
                        offset: Offset(3.0, 3.0),
                      ),
                    ]
                  : null,
            ),
          ),
          if (isActive)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(
                          Icons.today_outlined,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.indigoAccent,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(
                        text: time,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.orange,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Image.asset(
                          'assets/max.ico',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(
                        text: maxTemperature,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.orange,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Image.asset(
                          'assets/min.ico',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const WidgetSpan(
                        child: SizedBox(
                          width: 8,
                        ),
                      ),
                      TextSpan(
                        text: minTemperature,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          shadows: [
                            Shadow(
                              blurRadius: 1.0,
                              color: Colors.orange,
                              offset: Offset(3.0, 3.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              children: [
                WidgetSpan(child: weatherCode),
                const WidgetSpan(
                  child: SizedBox(
                    width: 8,
                  ),
                ),
                TextSpan(
                  text: weatherDescription,
                  style: TextStyle(
                    fontSize: isActive ? 18.0 : 12,
                    color: isActive ? Colors.white : Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    shadows: isActive
                        ? [
                            const Shadow(
                              blurRadius: 1.0,
                              color: Colors.red,
                              offset: Offset(3.0, 3.0),
                            ),
                          ]
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
