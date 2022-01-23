import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_fetch_getx/home_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Location"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "My Locations info",
            style: TextStyle(color: Colors.amberAccent, fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => Text("${controller.latitude.value}")),
          Obx(() => Text("${controller.longitude.value}")),
          Obx(() => Text("${controller.address.value}"))
        ],
      ),
    );
  }
}
