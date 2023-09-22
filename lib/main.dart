import 'package:flutter/material.dart';
import 'package:flutter_insights/flutter_insights.dart';
import 'package:flutter_insights/models/response.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var result = "Result here";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    result = "loading...";
                  });
                  PericulumResponse? response =
                      await FlutterPericulum.generateMobileInsightV2(
                          publicKey: 'inputKey',
                          // overviewkey: "2",
                          phoneNumber: '111',
                          bvn: '1111');
                  setState(() {
                    result = response.toString();
                  });
                },
                child: const Text('Click'),
              ),
              Text(result),
            ],
          ),
        )),
      ),
    );
  }
}
