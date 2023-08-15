

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../direction_model/directions_model.dart';
import '.env.dart';

class DirectionRepository{
  static const _baseUrl = 'https://maps.googleapis.com/maps/api/directions/json?';
  final Dio _dio;
  DirectionRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<Directions?> getDirections({
    required LatLng origin,
    required LatLng destinations,
  }) async {
    final response = await _dio.get(_baseUrl,
    queryParameters: {
      'origin':'${origin.latitude},${origin.longitude}',
      'destination': '${destinations.latitude},${destinations.longitude}',
      'key':googleAPIKey,
    });

    if(response.statusCode == 200){
      return Directions.formMap(response.data);
    }
    return null;
  }
}