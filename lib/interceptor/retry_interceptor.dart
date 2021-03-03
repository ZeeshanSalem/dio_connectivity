import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_connectivity/interceptor/dio_connectivity_request_retrier.dart';
import 'package:flutter/material.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor{
  final DioConnectivityRequestRetrier requestRetrier;
  RetryOnConnectionChangeInterceptor({@required this.requestRetrier});
  @override
  Future onError(DioError err) async{
    // TODO: implement onError
    if(_shouldRetry(err)){
      try{
        return requestRetrier.scheduleResponseRetry(err.request);
      } catch(e){
        return e;
      }
    }
    return err;
  }

  bool _shouldRetry(DioError err){
    return err.type == DioErrorType.DEFAULT
        && err.error != null
        && err.error is SocketException;
  }
}