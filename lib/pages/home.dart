import 'package:flutter/material.dart';
import 'package:police/pages/company.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: const Text(
          'Company List',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: ListView.builder(
        itemCount: 17,
        itemBuilder: (BuildContext context, int index) {
          final adjustedIndex = index + 1;
          return Card(
            color: Colors.lightBlue.shade200,
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Company(
                              n: index,
                            )));
              },
              leading: const Icon(Icons.group),
              title: Text(
                'CAPF कम्पनी P$adjustedIndex',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          );
        },
      ),
    );
  }
}
