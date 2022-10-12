import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:customer_io/customer_io.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _customerIoPlugin = CustomerIo();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Customer.io SDK integration example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                  onPressed: _initialize, child: const Text("initialize")),
              TextButton(onPressed: _identify, child: const Text("identify")),
              TextButton(onPressed: _screen, child: const Text("screen")),
              TextButton(onPressed: _track, child: const Text("track")),
            ],
          ),
        ),
      ),
    );
  }

  void _initialize() async {
    await _customerIoPlugin.initialize(
      siteId: "",
      apiKey: "",
    );
    await _customerIoPlugin.initMessagingInApp(
      organizationId: "",
    );
  }

  void _identify() async {
    await _customerIoPlugin.identify(
        identifier: "",
        data: {'email': "email@example.com"});
  }

  void _screen() async {
    await _customerIoPlugin.screen(name: "TestScreen");
  }

  void _track() async {
    await _customerIoPlugin.track(name: "submit_dream_analyzed");
  }
}
