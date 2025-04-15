import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetWeatherCall {
  static Future<ApiCallResponse> call({
    String? city = 'Tunis',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get weather',
      apiUrl: 'https://api.openweathermap.org/data/2.5/weather',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': city,
        'appid': "080331ae9475ecf2a052e4fff26121c9",
        'lang': "fr",
        'cnt': "1",
        'units': "metric",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? label(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].description''',
      ));
  static String? icon(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.weather[:].icon''',
      ));
  static String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.name''',
      ));
  static double? temperateur(dynamic response) =>
      castToType<double>(getJsonField(
        response,
        r'''$.main.temp''',
      ));
}

class ExerciceapiCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? type = '',
    String? muscle = '',
    String? equipement = '',
    String? difficulty = '',
    String? instructions = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Exerciceapi',
      apiUrl: 'https://api.api-ninjas.com/v1/exercises?muscle=chest',
      callType: ApiCallType.GET,
      headers: {
        'X-Api-Key': '+pKApU0zor+kT1QvxyYv8A==bOn4IP9AVWRNpN2Y',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadimageToimgBBCall {
  static Future<ApiCallResponse> call({
    FFUploadedFile? image,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'uploadimageToimgBB',
      apiUrl:
          'https://api.imgbb.com/1/upload?key=6f12100c9a5d032b30947b8a8860052a',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'image': image,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? imageURL(dynamic response) => getJsonField(
        response,
        r'''$.data.url''',
      );
}

class MealRecipesCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'mealRecipes',
      apiUrl:
          'https://api.spoonacular.com/mealplanner/generate?timeFrame=week&targetCalories=2000&diet=vegetarian&apiKey=09323f724c614bfeac10deba6ffed4c2',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'apiKey': "09323f724c614bfeac10deba6ffed4c2",
        'timeFrame': "week",
        'targetcALORIES': 2000,
        'diet': "vegetarian",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BmiCalcCall {
  static Future<ApiCallResponse> call({
    double? height,
    double? weight,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'bmiCalc',
      apiUrl:
          'https://body-mass-index-bmi-calculator.p.rapidapi.com/metric?weight={weight}&height={height}',
      callType: ApiCallType.GET,
      headers: {
        'x-rapidapi-host': 'body-mass-index-bmi-calculator.p.rapidapi.com',
        'x-rapidapi-key': '018bb25b49msh3f906471e59f723p127ed7jsn1a48fa586cf7',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRandomRecipeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'GetRandomRecipe',
      apiUrl:
          'https://api.spoonacular.com/recipes/random?number=3&apiKey=09323f724c614bfeac10deba6ffed4c2',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
