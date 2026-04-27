import 'package:flutter/material.dart';

void main() {
  runApp(const ATMApp());
}

class ATMApp extends StatelessWidget {
  const ATMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATM GRG System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  String result = "";

  final Map<String, String> data = {
    "101": "Power Failure - Check power supply",
    "202": "Card Reader Error - Clean reader",
    "303": "Network Error - Check connection",
    "404": "Cash Jam - Remove jammed notes",
    "505": "Printer Error - Check paper tray",
    "606": "ATM Door Open - Secure machine",
    "707": "Sensor Error - Check sensors",
  };

  void search() {
    setState(() {
      result = data[controller.text.trim()] ?? "Error code not found";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ATM GRG Error System")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: "Enter Error Code",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: search,
              child: const Text("Search"),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}