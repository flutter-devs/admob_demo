import 'dart:io';

class AdMobService {
  String getADMobAppId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5062555353360915~9266088806';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5062555353360915~6448353772';
    }

    return null;
  }

  String getBannerAdId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-5062555353360915/2237646028';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-5062555353360915/5135272104';
    }

    return null;
  }
}
