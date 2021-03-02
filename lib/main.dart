import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Dio dio;
  String firstPostTile;
  bool isLoading;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    firstPostTile = 'Press the button 👇';
    isLoading = false;

//    dio.interceptors.add(
//      RetryOnConnectionChangeInterceptor(
//        requestRetrier: DioConnectivityRequestRetrier(
//          dio: dio,
//          connectivity: Connectivity(),
//        ),
//      ),
//    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(isLoading)
              CircularProgressIndicator()
            else
              Text(firstPostTile,
              style: TextStyle(
                fontSize: 24
              ),
              textAlign: TextAlign.center,
              ),

            RaisedButton(
                onPressed: () async{
                  setState(() {
                    isLoading = true;
                  });

                  final responce = await dio.get("https://jsonplaceholder.typicode.com/posts");
                  setState(() {
                    firstPostTile = responce.data[0]["title"] as String;
                    isLoading = false;
                  });
                },
              child: Text("REQUEST DATA"),
            ),

          ],
        ),
      ),
    );
  }
}


