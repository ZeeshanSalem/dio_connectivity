import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioConnectivityRequestRetrier{
 final Dio dio;
 final Connectivity connectivity;

 DioConnectivityRequestRetrier({@required this.dio, @required  this.connectivity});
}