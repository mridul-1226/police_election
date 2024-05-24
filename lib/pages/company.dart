import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:maps_launcher/maps_launcher.dart';
import 'package:police/datas/data.dart';
import 'package:police/main.dart';
import 'package:url_launcher/url_launcher.dart';

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
    Uri dial;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: const Text(
          'COMPANY',
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: mq.height * 0.1,
            width: mq.width,
            color: Colors.blue,
            child: Center(
              child: Text(
                '${info.stay[widget.n]['company']}',
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
            child: Card(
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
                      GestureDetector(
                          onTap: () async {
                            dial = Uri(
                                scheme: 'tel',
                                path: info.stay[widget.n]['number']!);
                            await launchUrl(dial);
                          },
                          child: Text(
                            info.stay[widget.n]['number']!,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 1, 81, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration
                                  .underline, // This adds the underline
                            ),
                            textAlign: TextAlign.center,
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: mq.height * 0.1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
            child: Card(
              color: Colors.lightBlue.shade100,
              child: Column(
                children: [
                  const Text(
                    'CAPF के चिह्नित रूकने के स्थल',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.brown),
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: mq.width * 0.02,
                      ),
                      Expanded(
                        child: Text(
                          info.stay[widget.n]['location']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          launchMap(
                              double.parse(info.stay[widget.n]['latitude']!),
                              double.parse(info.stay[widget.n]['longitude']!));
                        },
                        icon: const Icon(Icons.location_on,
                            color: Color.fromARGB(255, 0, 140, 255)),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // SizedBox(
          //   height: mq.height * 0.1,
          // ),
          // Card(
          //   color: Colors.lightBlue.shade100,
          //   child: SingleChildScrollView(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         const Text(
          //           'Duty (Deployment)',
          //           style: TextStyle(
          //               fontSize: 20,
          //               fontWeight: FontWeight.w700,
          //               color: Colors.brown),
          //         ),
          //         Container(
          //           height: 2,
          //           color: Colors.black,
          //         ),
          //         SizedBox(
          //           height: mq.height * 0.2,
          //           child: ListView.builder(
          //             itemCount: info.deploy[widget.n].length,
          //             itemBuilder: (context, index) {
          //               return Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                 children: [
          //                   SizedBox(
          //                     width: mq.width * 0.02,
          //                   ),
          //                   Text(
          //                     info.deploy[widget.n][index]['location']!,
          //                     style: const TextStyle(
          //                       fontSize: 18,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                     textAlign: TextAlign.center,
          //                   ),
          //                   IconButton(
          //                       onPressed: () {
          //                         launchMap(
          //                             double.parse(info.deploy[widget.n]
          //                                 [index]['latitude']!),
          //                             double.parse(info.deploy[widget.n]
          //                                 [index]['longitude']!));
          //                       },
          //                       icon: const Icon(
          //                         Icons.location_on,
          //                         color: Color.fromARGB(255, 0, 140, 255),
          //                       ))
          //                 ],
          //               );
          //             },
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
                      'स्थानों को मानचित्र पर देखने के लिए Location पर क्लिक करें',
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
    );
  }
}
