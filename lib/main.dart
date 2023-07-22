import 'package:flutter/material.dart';
import 'package:mynetwork1/my_provider.dart';
import 'package:provider/provider.dart';
import 'my_contacts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ActionsIconProvider()),
        ChangeNotifierProvider(create: (context) => SocialIconProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyContacts(),
      ),
    );
  }
}
