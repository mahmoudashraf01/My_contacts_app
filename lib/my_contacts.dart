import 'package:flutter/material.dart';
import 'package:mynetwork1/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tuple/tuple.dart';
import 'widgets/social_media_icon.dart';

class MyContacts extends StatelessWidget {
  MyContacts({super.key});

  final Uri phoneNumber = Uri.parse('tel:+201064903389');

  final Map socialMedia = {
    'whatsapp': Uri.parse('https://wa.me/+201064903389'),
    'linkedin':
        Uri.parse('https://www.linkedin.com/in/mahmoud-dahma-16622b229'),
    'github': Uri.parse('https://github.com/mahmoudashraf01'),
    'facebook': Uri.parse('https://www.facebook.com/mahmoud.eldahma.98'),
    'instagram': Uri.parse('https://www.instagram.com/ma7moud_eldahma/'),
    'twitter': Uri.parse('https://mobile.twitter.com/MahmoudDahma1'),
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      left: true,
      top: true,
      right: true,
      maintainBottomViewPadding: true,
      minimum: EdgeInsets.zero,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('My Contacts Screan'),
          leading: InkWell(
            child: Icon(Icons.home),
            onTap: () {
              print('icon is pressed');
            },
          ),
          actions: [
            Selector<ActionsIconProvider, Tuple2<String?,Uri?>>(
              selector: (p0, p1) => Tuple2(p1.getMyPlatform(), p1.getMyUrl()),
              builder: (context, value, child) => IconButton(
                onPressed: () {
                  value.item2 == null
                      ? launchUrl(phoneNumber)
                      : launchUrl(value.item2!, mode: LaunchMode.externalApplication);
                },
                icon: value.item1 == null
                    ? Icon(
                        Icons.phone,
                        size: 25,
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/${value.item1}.png'),
                        radius: 40,
                      ),
              ),
            ),
          ],
        ),
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
                      onPressed: () {
                        launchUrl(phoneNumber);
                      },
                      icon: Icon(
                        Icons.phone,
                        size: 30,
                        color: Colors.grey,
                      ),
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
      ),
    );
  }
}
