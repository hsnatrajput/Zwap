
import 'package:dio/dio.dart';
import 'package:zwap_test/utils/dio_interceptor.dart';

class ImageUploadService {
  late final Dio _dio;
  late final String apiUrl = "https://zwap.codeshar.com/api";
  ImageUploadService() {
    _dio = Dio();
    _dio.interceptors.add(DioInterceptor());
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
    )); // Add LogInterceptor with logging enabled
  }

  // function upload image to the server using multipart request in dio
  Future<String> uploadImage(String imagePath) async {
    try {
      String fileName = imagePath.split('/').last;
      FormData formData = FormData.fromMap({
        "file": await MultipartFile.fromFile(imagePath, filename: fileName),
      });
      Response response = await _dio.post(
        "$apiUrl/upload",
        data: formData,
      );
      return response.data['data']['url'];
    } catch (e) {
      print(e);
      return "";
    }
  }
}
