import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SHO extends StatelessWidget {
  const SHO(
      {super.key,
      required this.pos,
      required this.name,
      required this.contact});
  final String pos;
  final String name;
  final String contact;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlue.shade100,
      child: Column(
        children: [
          const Text(
            'SHO',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.brown),
          ),
          Container(
            height: 2,
            color: Colors.black,
          ),
          Column(
            children: [
              Text(
                pos,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: Color.fromARGB(255, 1, 81, 255),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const Text(
                'Contact',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              GestureDetector(
                  onTap: () async {
                    var dial = Uri(scheme: 'tel', path: contact);
                    await launchUrl(dial);
                  },
                  child: Text(
                    contact,
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
    );
  }
}
