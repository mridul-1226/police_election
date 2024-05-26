import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:police/main.dart';
import 'package:url_launcher/url_launcher.dart';

class CenterDetails extends StatelessWidget {
  const CenterDetails({
    super.key,
    required this.location,
    required this.psname,
    required this.psnum,
    required this.sname,
    required this.snum,
    required this.zone,
    required this.zonenum,
    required this.zonename,
    required this.sector,
  });
  final String location;
  final String psname;
  final String psnum;
  final String sname;
  final String snum;
  final String zone;
  final String zonenum;
  final String zonename;
  final String sector;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: Text(
          location,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.lightBlue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'P.S. Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      Container(
                        height: mq.height * 0.005,
                        color: Colors.black,
                      ),
                      const Text(
                        'Center Name : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'PS Number : ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        psnum,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'PS Name : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        psname,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.lightBlue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Sector Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      Container(
                        height: mq.height * 0.005,
                        color: Colors.black,
                      ),
                      const Text(
                        'Sector Number : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        sector,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text('Sector Magistrate Name : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center),
                      Text(
                        sname,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Sector Magistrate Contact : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var dial = Uri(scheme: 'tel', path: snum);
                          await launchUrl(dial);
                        },
                        child: Text(
                          snum,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 1, 81, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  color: Colors.lightBlue.shade100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Zone Details',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      Container(
                        height: mq.height * 0.005,
                        color: Colors.black,
                      ),
                      const Text(
                        'Zone Number : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        zone,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text('Zone Magistrate Name : ',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center),
                      Text(
                        zonename,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 1, 81, 255),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        'Zone Magistrate Contact : ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      GestureDetector(
                        onTap: () async {
                          var dial = Uri(scheme: 'tel', path: zonenum);
                          await launchUrl(dial);
                        },
                        child: Text(
                          zonenum,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 1, 81, 255),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DutyPointDeatils extends StatelessWidget {
  const DutyPointDeatils(
      {super.key, required this.location, required this.psname});

  final String location;
  final String psname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: Text(
          location,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * 0.05),
          child: Card(
            color: Colors.lightBlue.shade100,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'P.S. Details',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: mq.height * 0.005,
                  color: Colors.black,
                ),
                const Text(
                  'Duty Point : ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                Text(
                  location,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 1, 81, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text('PS Name : ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center),
                Text(
                  psname,
                  style: const TextStyle(
                    color: Color.fromARGB(255, 1, 81, 255),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
