import 'package:flutter/material.dart';
import 'package:mynetwork1/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class SocialMediaIcon extends StatelessWidget {
  String socialMedia;
  Uri socialMediaLinks;
  SocialMediaIcon({
    required this.socialMedia,
    required this.socialMediaLinks,
    super.key,
  });

  double? myPadding;

  @override
  Widget build(BuildContext context) {
    return Consumer2<ActionsIconProvider,SocialIconProvider>(
      builder: (context, value,iconData ,child) => Padding(
        padding: EdgeInsets.all(myPadding == null ? 15 : myPadding!),
        child: InkWell(
          onDoubleTap: () {
            value.setMyPlatform(socialMedia);
            value.setMyUrl(socialMediaLinks);
          },
          onTap: () {
            iconData.padding == 15
                ? {
                    iconData.padding = 25,
                    iconData.notifyListeners(),
                    myPadding = iconData.padding
                  }
                : {
                    iconData.padding = 15,
                    iconData.notifyListeners(),
                    myPadding = iconData.padding
                  };
            // launchUrl(widget.socialMediaLinks,
            //     mode: LaunchMode.externalApplication);
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/$socialMedia.png'),
          ),
        ),
      ),
    );
  }
}


  

