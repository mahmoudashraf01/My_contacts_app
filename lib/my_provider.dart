
import 'package:flutter/material.dart';

class ActionsIconProvider extends ChangeNotifier{
  String? _myPlatform;
  Uri? _myUrl;

  void setMyPlatform(value)
  {
    _myPlatform = value;
    notifyListeners();
  }
  void setMyUrl(value)
  {
    _myUrl = value;
    notifyListeners();
  }
  String getMyPlatform () => _myPlatform ?? 'github';
  Uri getMyUrl () => _myUrl ?? Uri.parse('https://github.com/mahmoudashraf01');
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }

}
class SocialIconProvider extends ChangeNotifier{
  double? padding;
  @override
  void notifyListeners() {
    // TODO: implement notifyListeners
    super.notifyListeners();
  }

}