import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpService {
  static Dio? _dioInstance;
  static Dio getDioInstance(){
    if(_dioInstance == null){
      // 基本配置
      var options = BaseOptions(
          baseUrl: "http://192.168.4.22:4000",
          sendTimeout: Duration(seconds: 5),
          receiveTimeout: Duration(seconds: 5),
          connectTimeout: Duration(seconds: 5),
          headers: <String,dynamic>{
            "Content-Type":"application/x-www-form-urlencoded",
          }
      );
      _dioInstance = Dio(options);
      // 全局拦截器
      _dioInstance!.interceptors.add(InterceptorsWrapper(
        onRequest: (options,handler){
          EasyLoading.show(status: "loading");
          return handler.next(options);
        },
        onResponse: (Response<dynamic> response,handler){
          EasyLoading.dismiss();
          Map<String,dynamic> responseData = response.data;
          print("get---${responseData['data']}");
          if(responseData['success'] == false){
            print(1);
            return handler.reject(
              DioException(requestOptions: RequestOptions(data: responseData['message'])),
            );
          } else {
            print(2);
            return handler.next(response);
          }
        },
        onError: (e,handler) {
          return handler.next(e);
        }
      ));
    }
    return _dioInstance as Dio;
  }

  // 请求方法封装
  static Future senderRequest(HttpMethod method,String url,{Map<String,dynamic>? queryParams,dynamic data}) async {
    try {
      switch(method){
        case HttpMethod.GET :
          return await HttpService.getDioInstance().get(url,queryParameters: queryParams);
        case HttpMethod.POST:
          return await HttpService.getDioInstance().post(url,data: data);
        default:
          return new Exception("请求方式不完善，请补充");
      }
    } on DioException catch(e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.requestOptions.data);
      throw new Exception("请求异常1 ---- ${e}");
    } on Exception catch(e) {
      throw new Exception("请求异常2 ---- ${e}");
    }
  }

  // get 请求
  static Future get(String url,{Map<String,dynamic>? queryParams}) async {
    return await senderRequest(HttpMethod.GET,url,queryParams: queryParams);
  }

  // post 请求
  static Future post(String url,{dynamic data}) async {
    return await senderRequest(HttpMethod.POST,url,data: data);
  }

  // 请求头设置
  static void setHeaderKey(String token) async {
    HttpService._dioInstance!.options.headers['token'] = token;
  }
}

enum HttpMethod {
  GET,
  POST
}