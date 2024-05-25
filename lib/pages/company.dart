// import 'package:flutter/material.dart';
// import 'package:maps_launcher/maps_launcher.dart';
// import 'package:police/datas/data.dart';
// import 'package:police/main.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Company extends StatefulWidget {
//   const Company({super.key, required this.n});
//   final int n;

//   @override
//   State<Company> createState() => _CompanyState();
// }

// class _CompanyState extends State<Company> {
//   final Info info = Info();

//   void launchMap(double latitude, double longitude) {
//     MapsLauncher.launchCoordinates(latitude, longitude);
//   }

//   @override
//   Widget build(BuildContext context) {
//     Uri dial;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 68, 120, 225),
//         title: const Text(
//           'COMPANY',
//           style: TextStyle(
//               fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: mq.height * 0.1,
//             width: mq.width,
//             color: Colors.blue,
//             child: Center(
//               child: Text(
//                 '${info.stay[widget.n]['company']}',
//                 style: const TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//           const Expanded(child: SizedBox()),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
//             child: Card(
//               color: Colors.lightBlue.shade100,
//               child: Column(
//                 children: [
//                   const Text(
//                     'लाईजन अधिकारी',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.brown),
//                   ),
//                   Container(
//                     height: 2,
//                     color: Colors.black,
//                   ),
//                   Column(
//                     children: [
//                       Text(
//                         info.stay[widget.n]['name']!,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.w700,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       GestureDetector(
//                           onTap: () async {
//                             dial = Uri(
//                                 scheme: 'tel',
//                                 path: info.stay[widget.n]['number']!);
//                             await launchUrl(dial);
//                           },
//                           child: Text(
//                             info.stay[widget.n]['number']!,
//                             style: const TextStyle(
//                               color: Color.fromARGB(255, 1, 81, 255),
//                               fontSize: 18,
//                               fontWeight: FontWeight.w700,
//                               decoration: TextDecoration
//                                   .underline, // This adds the underline
//                             ),
//                             textAlign: TextAlign.center,
//                           )),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: mq.height * 0.1),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
//             child: Card(
//               color: Colors.lightBlue.shade100,
//               child: Column(
//                 children: [
//                   const Text(
//                     'CAPF के चिह्नित रूकने के स्थल',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.brown),
//                   ),
//                   Container(
//                     height: 2,
//                     color: Colors.black,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(
//                         width: mq.width * 0.02,
//                       ),
//                       Expanded(
//                         child: Text(
//                           info.stay[widget.n]['location']!,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           launchMap(
//                               double.parse(info.stay[widget.n]['latitude']!),
//                               double.parse(info.stay[widget.n]['longitude']!));
//                         },
//                         icon: const Icon(Icons.location_on,
//                             color: Color.fromARGB(255, 0, 140, 255)),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: mq.height * 0.1,
//           ),
//           Card(
//             color: Colors.lightBlue.shade100,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const Text(
//                     'Duty (Deployment)',
//                     style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.brown),
//                   ),
//                   Container(
//                     height: 2,
//                     color: Colors.black,
//                   ),
//                   SizedBox(
//                     height: mq.height * 0.2,
//                     child: ListView.builder(
//                       itemCount: info.deploy[widget.n].length,
//                       itemBuilder: (context, index) {
//                         return Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SizedBox(
//                               width: mq.width * 0.02,
//                             ),
//                             Expanded(
//                               child: Text(
//                                 info.deploy[widget.n][index]['location']!,
//                                 style: const TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             IconButton(
//                                 onPressed: () {
//                                   launchMap(
//                                       double.parse(info.deploy[widget.n][index]
//                                           ['latitude']!),
//                                       double.parse(info.deploy[widget.n][index]
//                                           ['longitude']!));
//                                 },
//                                 icon: const Icon(
//                                   Icons.location_on,
//                                   color: Color.fromARGB(255, 0, 140, 255),
//                                 ))
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const Expanded(child: SizedBox()),
//           RichText(
//             text: const TextSpan(
//               text: '* ',
//               style: TextStyle(color: Colors.red),
//               children: [
//                 TextSpan(
//                     text: 'Note : ',
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.black)),
//                 TextSpan(
//                   text:
//                       'स्थानों को मानचित्र पर देखने के लिए Location पर क्लिक करें',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ],
//             ),
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class Company extends StatefulWidget {
  const Company({super.key, required this.n});
  final int n;

  @override
  State<Company> createState() => _CompanyState();
}

class _CompanyState extends State<Company> {
  late Future<List<Map<String, dynamic>>> _companyData;

  @override
  void initState() {
    super.initState();
    _companyData = fetchCompanyData();
  }

  Future<List<Map<String, dynamic>>> fetchCompanyData() async {
    try {
      // Fetching all documents in the collection
      QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('companies').get();

      // Converting documents to a list of maps
      List<Map<String, dynamic>> companyDataList = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();

      return companyDataList;
    } catch (e) {
      throw e;
    }
  }

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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _companyData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error fetching data: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            final data = snapshot.data![widget.n];
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      '${data['company']}',
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
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
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
                              data['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            GestureDetector(
                                onTap: () async {
                                  dial =
                                      Uri(scheme: 'tel', path: data['number']);
                                  await launchUrl(dial);
                                },
                                child: Text(
                                  data['number'],
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 1, 81, 255),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.underline,
                                  ),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.1),
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
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            Expanded(
                              child: Text(
                                data['location'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                launchMap(double.parse(data['latitude']),
                                    double.parse(data['longitude']));
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Visibility(
                  visible: data['isShow'] as bool,
                  child: Card(
                    color: Colors.lightBlue.shade100,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Duty (Deployment)',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.brown),
                          ),
                          Container(
                            height: 2,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.2,
                            child: ListView.builder(
                              itemCount: data['deploy'].length,
                              itemBuilder: (context, index) {
                                final deployData = data['deploy'][index];
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Expanded(
                                      child: Text(
                                        deployData['location'],
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
                                              double.parse(
                                                  deployData['latitude']),
                                              double.parse(
                                                  deployData['longitude']));
                                        },
                                        icon: const Icon(
                                          Icons.location_on,
                                          color:
                                              Color.fromARGB(255, 0, 140, 255),
                                        ))
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
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
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
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
            );
          }
        },
      ),
    );
  }
}
