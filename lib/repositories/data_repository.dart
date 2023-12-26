
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:loksewa/core/const/host_url.dart';
import 'package:loksewa/model/syllabus_structure.dart';
import '../network/dio_helper.dart';
import 'user_repository.dart';

class DataRepository extends SyllabusStructures {
  List<SyllabusStructure> syllabusStructure = [];

  @override
  Future<List<SyllabusStructure>?> getSyllabusStructure(String id) async{
    // try {
    //   syllabusStructure.clear();
    //   String endPoint = HostUrl.syllabusStructureEndpoint;
    //   final response=await DioHelper.dio.get(endPoint).then((value) => {
    //         value.data.forEach((itemJson) {
    //           syllabusStructure.add(SyllabusStructure.fromJson(itemJson));
    //         })
    //       });

    //     if(response.=)
    //   return syllabusStructure;
      
    // // ignore: deprecated_member_use
    // } on DioError catch (e) {
    
    //   if (e.response != null) {
    //     debugPrint(e.response?.data);
    //     debugPrint(e.response?.headers.toString());
    //     debugPrint(e.response?.requestOptions.toString());
    //   } else {
    //     debugPrint(e.requestOptions.toString());
    //     debugPrint(e.message);
    //   }
    //   return null;
    // }
    try {
      // Make the API request
      String endPoint = HostUrl.syllabusStructureEndpoint+"/$id";

      Response response = await DioHelper.dio.get(
        endPoint,
      );

      // Check if the response status is successful
      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.data);
        // Map the JSON data to your model
        List<SyllabusStructure> careers = (response.data as List<dynamic>)
            .map((item) => SyllabusStructure.fromJson(item))
            .toList();

        // Do something with the mapped data, or notify listeners
        print('Data are displayed: $careers');

        // Return the list of Selectcareers
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
      // Handle Dio errors or other exceptions
      print('Error during API request: $e');
      if (e is DioError) {
        print('DioError: ${e.response?.statusMessage}');
      }
      // If an error occurs, you can choose to return an empty list or throw an exception
      return [];
    }
  }
  }

