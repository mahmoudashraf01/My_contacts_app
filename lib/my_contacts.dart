import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'widgets/social_media_icon.dart';

class MyContacts extends StatelessWidget {
  MyContacts({super.key});

  Map<String, String> socialMedia = {
    'whatsapp.png': 'https://wa.me/+201064903389',
    'linkedin.png': 'https://www.linkedin.com/in/mahmoud-dahma-16622b229',
    'github.png': 'https://github.com/mahmoudashraf01',
    'facebook.png': 'https://www.facebook.com/mahmoud.eldahma.98',
    'instagram.png': 'https://www.instagram.com/ma7moud_eldahma/',
    'twitter.png': 'https://mobile.twitter.com/MahmoudDahma1',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(1, 34, 43, 1),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('assets/me.jpg'),
                radius: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Mahmoud Ashraf',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 1,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '+201064903389',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.phone,
                      size: 30,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse('tel:+201064903389'));
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                itemCount: socialMedia.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return SocialMediaIcon(
                    socialMedia: socialMedia.keys.toList()[index],
                    socialMediaLinks: socialMedia.values.toList()[index],
                  );
                },
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
