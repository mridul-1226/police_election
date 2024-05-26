import 'package:flutter/material.dart';
import 'package:police/datas/sho.dart';
import 'package:police/main.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 68, 120, 225),
        title: const Text(
          'SHO Information',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: mq.width * 0.1),
            child: const Column(
              children: [
                SHO(
                  name: 'डा0 यशवीर सिंह',
                  contact: '9454400304',
                  pos: 'पुलिस अधीक्षक ',
                ),
                SHO(
                  name: 'श्री कालू सिंह',
                  contact: '9454401110',
                  pos: 'अपर पुलिस अधीक्षक मुख्यालय',
                ),
                SHO(
                  name: 'श्री त्रिभुवन नाथ त्रिपाठी',
                  contact: '9454401111',
                  pos: 'अपर पुलिस अधीक्षक आपरेशन',
                ),
                SHO(
                  name: 'श्री राहुल पाण्डेय',
                  contact: '9454401595',
                  pos: 'क्षेत्राधिकारी नगर',
                ),
                SHO(
                  name: 'श्री संजीव कटियार',
                  contact: '9454401599',
                  pos: 'क्षेत्राधिकारी सदर',
                ),
                SHO(
                  name: 'श्री हर्ष पाण्डेय',
                  contact: '9454404303',
                  pos: 'क्षेत्राधिकारी घोरावल',
                ),
                SHO(
                  name: 'डा0 चारू द्विवेदी',
                  contact: '9454401596',
                  pos: 'क्षेत्राधिकारी ओबरा',
                ),
                SHO(
                  name: 'श्री अमित कुमार',
                  contact: '9454401597',
                  pos: 'क्षेत्राधिकारी पिपरी',
                ),
                SHO(
                  name: 'श्री प्रदीप सिंह चन्देल',
                  contact: '9454401598',
                  pos: 'क्षेत्राधिकारी दुद्धी',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
