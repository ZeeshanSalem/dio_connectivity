import 'dart:io';

import 'package:dio/dio.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor{
  @override
  Future onError(DioError err) async{
    // TODO: implement onError
    if(_shouldRetry(err)){

    }
    return err;
  }

  bool _shouldRetry(DioError err){
    return err.type == DioErrorType.DEFAULT
        && err.error != null
        && err.error is SocketException;
  }
}