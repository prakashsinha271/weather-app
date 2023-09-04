import 'package:flutter/material.dart';
import 'package:weather_app/constants/strings.dart';

Map<dynamic, dynamic> getCode(weatherData) {
  late String decode;
  late String message;
  late Widget icn;
  switch (weatherData) {
    case 0:
      decode = weatherCode1;
      icn = const Icon(Icons.clear_all_outlined);
      message = weatherMessage1;
      break;
    case 1:
    case 2:
    case 3:
      decode = weatherCode2;
      icn = const Icon(Icons.cloud_circle_outlined);
      message = weatherMessage2;
      break;
    case 45:
    case 48:
      decode = weatherCode3;
      icn = const Icon(Icons.cloud_circle);
      message = weatherMessage3;
      break;
    case 51:
    case 53:
    case 55:
      decode = weatherCode4;
      icn = const Icon(Icons.cloud);
      message = weatherMessage4;
      break;
    case 56:
    case 57:
      decode = weatherCode5;
      icn = const Icon(Icons.icecream_outlined);
      message = weatherMessage5;
      break;
    case 61:
    case 63:
    case 65:
      decode = weatherCode6;
      icn = const Icon(Icons.wb_cloudy_outlined);
      message = weatherMessage6;
      break;
    case 66:
    case 67:
      decode = weatherCode7;
      icn = const Icon(Icons.cloudy_snowing);
      message = weatherMessage7;
      break;
    case 71:
    case 73:
    case 75:
      decode = weatherCode8;
      icn = const Icon(Icons.snowing);
      message = weatherMessage8;
      break;
    case 77:
      decode = weatherCode9;
      icn = const Icon(Icons.cloudy_snowing);
      message = weatherMessage9;
      break;
    case 80:
    case 81:
    case 82:
      decode = weatherCode10;
      icn = const Icon(Icons.wb_cloudy_rounded);
      message = weatherMessage10;
      break;
    case 85:
    case 86:
      decode = weatherCode11;
      icn = const Icon(Icons.snowing);
      message = weatherMessage11;
      break;
    case 95:
      decode = weatherCode12;
      icn = const Icon(Icons.thunderstorm);
      message = weatherMessage12;
      break;
    case 96:
    case 99:
      decode = weatherCode13;
      icn = const Icon(Icons.thunderstorm_outlined);
      message = weatherMessage13;
      break;
    default:
      decode = failedToLoad;
      icn = const Icon(Icons.refresh_rounded);
      message = failedToLoad;
      break;
  }
  return {'decode': decode, 'icn': icn, 'message': message};
}
