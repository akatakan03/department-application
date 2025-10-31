import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, String>> instructors = [
  {
    "name": "Dr. Öğr. Üyesi Murat ÖZTÜRK",
    "mail": "murat.ozturk@eskisehir.edu.tr",
    //"gsm": "0505 412 87 36",
    "gsm": "0555 555 55 55",
    "image": "",
  },
  {
    "name": "Doç. Dr. Emre KARAHAN",
    "mail": "emre.karahan@eskisehir.edu.tr",
    "gsm": "0532 684 29 15",
    "image": "",
  },
  {
    "name": "Dr. Öğr. Üyesi Hakan YILDIZ",
    "mail": "hakan.yildiz@eskisehir.edu.tr",
    "gsm": "0541 297 63 82",
    "image": "",
  },
  {
    "name": "Prof. Dr. Serkan DEMİRCİ",
    "mail": "serkan.demirci@eskisehir.edu.tr",
    "gsm": "0554 318 40 27",
    "image": "",
  },
];

class KisilerPage extends StatelessWidget {
  const KisilerPage({super.key});

  Future<void> _makeCall(String gsm) async {
    final Uri url = Uri(scheme: 'tel', path: gsm.replaceAll(' ', '')); // Boşlukları kaldır

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Arama başlatılamadı: $url';
    }
  }

  void _showCallDialog(BuildContext context, String name, String gsm) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Dial a Number'),
          content: Text('Would you like to call $name?\nGSM: $gsm'),
          actions: [
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                Navigator.pop(context);
                _makeCall(gsm);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: instructors.length,
      padding: const EdgeInsets.all(8.0),

      itemBuilder: (BuildContext context, int index) {
        final instructor = instructors[index];

        return _InstructorCard(
          name: instructor['name']!,
          mail: instructor['mail']!,
          gsm: instructor['gsm']!,
          onCallPressed: () {
            _showCallDialog(context, instructor['name']!, instructor['gsm']!);
          },
        );
      },
    );
  }
}

class _InstructorCard extends StatelessWidget {
  final String name;
  final String mail;
  final String gsm;
  final VoidCallback onCallPressed;

  const _InstructorCard({
    required this.name,
    required this.mail,
    required this.gsm,
    required this.onCallPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 30),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Mail
                      Text(
                        'Mail: $mail',
                        style: const TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      // GSM
                      Text(
                        'GSM: $gsm',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onCallPressed,
                child: const Text('CALL'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}