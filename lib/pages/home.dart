// import 'package:flutter/material.dart';

// import 'package:police/datas/data.dart';
// import 'package:police/main.dart';
// import 'package:police/pages/company.dart';
// import 'package:url_launcher/url_launcher.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final Info info = Info();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 68, 120, 225),
//         title: const Text(
//           'Company List',
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: 18,
//               itemBuilder: (BuildContext context, int index) {
//                 if (index == 0) {
//                   return Container(
//                     padding: const EdgeInsets.symmetric(vertical: 8),
//                     width: mq.width,
//                     color: const Color.fromARGB(255, 89, 139, 237),
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         const Text(
//                           'नोडल अधिकारी सीएपीएफ व्यवस्थापन',
//                           style: TextStyle(
//                               fontSize: 20, fontWeight: FontWeight.bold),
//                           textAlign: TextAlign.center,
//                         ),
//                         const Text('श्री कालू सिंह अपर पुलिस अधीक्षक',
//                             style: TextStyle(
//                                 fontSize: 20, fontWeight: FontWeight.bold)),
//                         GestureDetector(
//                           onTap: () async {
//                             var dial = Uri(scheme: 'tel', path: '9454401110');
//                             await launchUrl(dial);
//                           },
//                           child: const Text(
//                             '9454401110',
//                             style: TextStyle(
//                               color: Color.fromARGB(255, 1, 81, 255),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               decoration: TextDecoration
//                                   .underline, // This adds the underline
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//                 return Card(
//                   color: Colors.lightBlue.shade200,
//                   child: ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => Company(
//                             n: index - 1,
//                           ),
//                         ),
//                       );
//                     },
//                     leading: const Icon(Icons.group),
//                     title: Text(
//                       'CAPF कम्पनी ${info.stay[index - 1]['company']}',
//                       style: const TextStyle(fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:police/main.dart';
import 'package:police/pages/company.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Map<String, String>>> _companyData;

  @override
  void initState() {
    super.initState();
    _companyData = fetchCompanyData();
  }

  Future<List<Map<String, String>>> fetchCompanyData() async {
    try {
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('companies').get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return data.map((key, value) => MapEntry(key, value.toString()));
      }).toList();
    } catch (e) {
      log('Error fetching data: $e');
      return [];
    }
  }

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
      body: FutureBuilder<List<Map<String, String>>>(
        future: _companyData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          } else {
            final companyData = snapshot.data!;
            return ListView.builder(
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
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                final company = companyData[index - 1];
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
                      'CAPF कम्पनी ${company['company']}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
