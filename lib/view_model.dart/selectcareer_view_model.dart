import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/model/select_careers_modal.dart';

class SelectboxViewModel extends ChangeNotifier {
  final TextEditingController _selectCareer = TextEditingController();
  TextEditingController get careerController => _selectCareer;
  int selectedButtonIndex = -1;
  List<Selectcareers> careers = []; // Add a list to store careers

  updateCareerController(String value) {
    careerController.text = value;
    notifyListeners();
  }

  void selectButton(int index) {
    selectedButtonIndex = index;
    notifyListeners();
  }

  void clearSelection() {
    selectedButtonIndex = -1;
    notifyListeners();
  }

  int _index = 0;
  int get getindex => _index;

  void setIndex(int newIndex) {
    _index = newIndex;
  }

  Dio _dio = Dio();

  final Dio _dio = Dio();


  Future<List<Selectcareers>> getData() async {
    try {
      // Make the API request
      Response response = await _dio.get(
        'https://loksewa.cb-ashik.me/sewaservice',
      );

      // Check if the response status is successful
      if (response.statusCode == 200 || response.statusCode == 201) {

        // print(response.data);

        if (kDebugMode) {
          print(response.data);
        }

        // Map the JSON data to your model
        careers = (response.data as List<dynamic>)
            .map((item) => Selectcareers.fromJson(item))
            .toList();


        return careers;
      } else {
        // Handle other response status codes
        // print(
        //     'Failed to fetch data: Status Code: ${response.statusCode}, Response: ${response.data}');
        throw DioError(

        // Do something with the mapped data, or notify listeners
        if (kDebugMode) {
          print('Data are displayed: $careers');
        }

        // Return the list of Selectcareers
        return careers;
      } else {
        // Handle other response status codes
        if (kDebugMode) {
          print(
              'Failed to fetch data: Status Code: ${response.statusCode}, Response: ${response.data}');
        }
        throw DioException(

          requestOptions: RequestOptions(path: ''),
          response: response,
        );
      }
    } catch (e) {

      print('Error during API request: $e');

      if (e is DioError) {
        print('DioError: ${e.response?.statusMessage}');

      // Handle Dio errors or other exceptions
      if (kDebugMode) {
        print('Error during API request: $e');
      }
      if (e is DioException) {
        if (kDebugMode) {
          print('DioException: ${e.response?.statusMessage}');
        }

      }

      return [];
    }
  }

  Future<void> updateAndPatchData({
    required SubService subService,
    required Selectcareers sewaService,
  }) async {
    try {
      // Make the API request to patch SubService
      Response subServiceResponse = await _dio.patch(
        'https://loksewa.cb-ashik.me/subservice/${subService.id}',
        data: subService.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // Make the API request to patch SewaService
      Response sewaServiceResponse = await _dio.patch(
        'https://loksewa.cb-ashik.me/sewaservice/${sewaService.id}',
        data: sewaService.toJson(),
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      // Check if both responses are successful
      if ((subServiceResponse.statusCode == 200 ||
              subServiceResponse.statusCode == 201) &&
          (sewaServiceResponse.statusCode == 200 ||
              sewaServiceResponse.statusCode == 201)) {
        print('Data successfully patched');
      } else {
        // Handle other response status codes
        print('Failed to patch data');
      }
    } catch (e) {
      print('Error during PATCH request: $e');
      throw e;
    }
  }

  Selectcareers getSelectedCareer() {
    if (selectedButtonIndex != -1 && selectedButtonIndex < careers.length) {
      return careers[selectedButtonIndex];
    } else {
      return Selectcareers(id: "5", title: 'No Career Selected');
    }
  }
}
