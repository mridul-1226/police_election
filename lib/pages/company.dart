import 'package:flutter/material.dart';

import 'package:maps_launcher/maps_launcher.dart';
import 'package:police/data.dart';
import 'package:police/main.dart';

class Company extends StatefulWidget {
  const Company({super.key, required this.n});
  final int n;

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  final Info info = Info();

  void launchMap(double latitude, double longitude) {
    MapsLauncher.launchCoordinates(latitude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: Text(
          'COMPANY ${widget.n + 1}',
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Card(
              color: Colors.lightBlue.shade100,
              child: Column(
                children: [
                  const Text(
                    'लाईजन अधिकारी',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.brown),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  Column(
                    children: [
                      Text(
                        info.stay[widget.n]['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        info.stay[widget.n]['number']!,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: mq.height * 0.1),
            Card(
              color: Colors.lightBlue.shade100,
              child: Column(
                children: [
                  const Text(
                    'CAPF के चिह्नित रूकने के स्थल',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  TextButton(
                    onPressed: () {
                      launchMap(double.parse(info.stay[widget.n]['latitude']!),
                          double.parse(info.stay[widget.n]['longitude']!));
                    },
                    child: Text(
                      info.stay[widget.n]['location']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mq.height * 0.1,
            ),
            Card(
              color: Colors.lightBlue.shade100,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Duty (Deployment)',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: mq.height * 0.2,
                      child: ListView.builder(
                        itemCount: info.deploy[widget.n].length,
                        itemBuilder: (context, index) {
                          return TextButton(
                            onPressed: () {
                              launchMap(
                                  double.parse(info.deploy[widget.n][index]
                                      ['latitude']!),
                                  double.parse(info.deploy[widget.n][index]
                                      ['longitude']!));
                            },
                            child: Text(
                              info.deploy[widget.n][index]['location']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            RichText(
              text: const TextSpan(
                text: '* ',
                style: TextStyle(color: Colors.red),
                children: [
                  TextSpan(
                      text: 'Note : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black)),
                  TextSpan(
                    text:
                        'स्थानों को मानचित्र पर देखने के लिए उन पर क्लिक करें',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
