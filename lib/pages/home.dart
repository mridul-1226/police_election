import 'package:flutter/material.dart';

import 'package:police/datas/data.dart';
import 'package:police/main.dart';
import 'package:police/pages/company.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Info info = Info();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: const Text(
          'Company List',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 18,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    width: mq.width,
                    color: const Color.fromARGB(255, 89, 139, 237),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'नोडल अधिकारी सीएपीएफ व्यवस्थापन',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const Text('श्री कालू सिंह अपर पुलिस अधीक्षक',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        GestureDetector(
                          onTap: () async {
                            var dial = Uri(scheme: 'tel', path: '9454401110');
                            await launchUrl(dial);
                          },
                          child: const Text(
                            '9454401110',
                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 81, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration
                                  .underline, // This adds the underline
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Card(
                  color: Colors.lightBlue.shade200,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Company(
                            n: index - 1,
                          ),
                        ),
                      );
                    },
                    leading: const Icon(Icons.group),
                    title: Text(
                      'CAPF कम्पनी ${info.stay[index - 1]['company']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
