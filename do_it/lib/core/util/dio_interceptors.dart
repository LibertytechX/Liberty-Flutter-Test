import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  final String apiKey;

  DioInterceptor({required this.apiKey});
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> newHeaders = Map.from(options.headers);
    newHeaders['Authorization'] = 'Api_key $apiKey';
    
    return super.onRequest(
      options.copyWith(headers: newHeaders), 
      handler
    );
  }
}