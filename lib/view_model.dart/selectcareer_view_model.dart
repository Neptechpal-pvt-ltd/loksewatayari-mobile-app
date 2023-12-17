
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




  Future<void> makeApiRequest() async {
    Dio dio = Dio();
    const maxRetries = 3;
    const retryDelay = Duration(seconds: 5);

    for (var attempt = 1; attempt <= maxRetries; attempt++) {
      try {
        var response = await dio.get("your_api_endpoint");

        // Check if the response is successful
        if (response.statusCode == 200) {
          // Process the successful response here
          break; // Exit the loop if successful
        } else if (response.statusCode == 429) {
          print('Rate limited. Retrying after delay...');
          await Future.delayed(retryDelay);
        } else {
          print('Request failed with status code ${response.statusCode}');
          break; // Exit the loop for other non-retryable errors
        }
      } catch (e) {
        print('Error during request: $e');
        // You might want to handle other types of errors here
        break; // Exit the loop for other non-retryable errors
      }
    }
  }

// ...

Dio _dio = Dio();

Future<void> getData(Selectcareers selectcareers
  // Selectcareers selectcareer
  ) async {
  try {
     final Map<String, dynamic> requestData = {'title': selectcareers.title};
    // final Map<String, dynamic> requestData = selectcareer.toJson(); // Assuming SelectCareer has a `toJson` method

    // Use jsonEncode to convert the object to a JSON string
    Response response = await _dio.get(
      'https://loksewa.cb-ashik.me/sewaservice',
      queryParameters: requestData, // Use queryParameters for GET requests
      options: Options(
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Handle the response status
    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Data are displayed: ${response.data}');
      notifyListeners();
    } else {
      print('Failed to fetch data: Status Code: ${response.statusCode}, Response: ${response.data}');
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
    throw e;
  }
}


}
