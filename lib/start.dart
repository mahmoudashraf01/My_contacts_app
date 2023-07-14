import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StartSocialMedia extends StatelessWidget {
  String socialMediaLinks;
  StartSocialMedia({
    super.key,
    required this.socialMediaLinks,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 34, 43, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.teal),
          ),
          onPressed: () {
            launchUrl(Uri.parse(socialMediaLinks),
                mode: LaunchMode.externalApplication);
          },
          child: Text('Start social media'),
        ),
      ),
    );
  }
}
