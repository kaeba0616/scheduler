// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:scheduler/screens/calendar.dart';
import 'package:scheduler/widgets/map_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '🙌 Event Search App 🙌',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  String region = "서울";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🙌 Event Search App 🙌'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // const NaverMapApp(),
            Container(
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Region", style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            // const DropDownButton(),

            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your region',
              ),
              onSubmitted: (value) {
                setState(() {
                  region = value;
                  print(region);
                });
              },
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              child: const Text('Events'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CalendarScreen(
                    regionStr: region,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
