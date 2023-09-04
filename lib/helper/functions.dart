import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/strings.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../views/genie_dialog.dart';

Future<Map<String, dynamic>> fetchWeatherData() async {
  try {
    final response = await http.get(Uri.parse(weatherAPI));
    if (response.statusCode == 200) {
      final Map<String, dynamic> weatherData = jsonDecode(response.body);
      return weatherData;
    } else {
      throw Exception(failedToLoad);
    }
  } catch (error) {
    rethrow;
  }
}

Future<bool> checkInternetConnectivity(context) async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) {
    showNoInternetDialog(context);
    return false;
  } else {
    return true;
  }
}

void showNoInternetDialog(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return GenieDialog(
          title: noConnection,
          description: internetMessage,
          actionButton: true);
    },
  );
}

void fetchDataAndNavigate(context) async {
  try {
    final weatherData = await fetchWeatherData();

    await Future.delayed(const Duration(seconds: 5));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(weatherData: weatherData),
      ),
    );
  } catch (error) {
    print('$failedToLoad: $error');
  }
}
