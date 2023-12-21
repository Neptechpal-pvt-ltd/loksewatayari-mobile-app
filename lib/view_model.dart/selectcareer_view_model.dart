import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loksewa/model/select_careers_modal.dart';

class SelectboxViewModel extends ChangeNotifier {
  final TextEditingController _selectCareer = TextEditingController();
  TextEditingController get careerController => _selectCareer;
  int selectedButtonIndex = -1;

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

  Future<List<Selectcareers>> getData() async {
    try {
      // Make the API request
      Response response = await _dio.get(
        'https://loksewa.cb-ashik.me/sewaservice',
      );

      // Check if the response status is successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // Map the JSON data to your model
        List<Selectcareers> careers = (response.data as List<dynamic>)
            .map((item) => Selectcareers.fromJson(item))
            .toList();

       
        return careers;
      } else {
        // Handle other response status codes
        print(
            'Failed to fetch data: Status Code: ${response.statusCode}, Response: ${response.data}');
        throw DioError(
          requestOptions: RequestOptions(path: ''),
          response: response,
        );
      }
    } catch (e) {
    
      print('Error during API request: $e');
    
      if (e is DioError) {
        print('DioError: ${e.response?.statusMessage}');
      }

      return [];
    }
  }
}
