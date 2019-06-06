import 'package:flutter/material.dart';

const String defaultAppDataFilename = 'userdata.json';

class LangCode {
  // code must match S.of(context).language in every .arb file
  static const String chs = 'chs';
  static const String cht = 'cht';
  static const String jpn = 'jpn';
  static const String eng = 'eng';
  static const _allLanguage = {
    chs: ['简体中文', const Locale('zh', '')],
    cht: ['繁體中文', const Locale('zh', 'TW')],
    jpn: ['日本語', const Locale('ja', '')],
    eng: ['English', const Locale('en', '')],
  };

  static String getName(String code) =>
      codes.contains(code) ? _allLanguage[code][0] as String : null;

  static Locale getLocale(String code) =>
      codes.contains(code) ? _allLanguage[code][1] as Locale : null;

  static List<String> get codes => _allLanguage.keys.toList();

  static List<String> get names =>
      _allLanguage.values.map((v) => v[0] as String).toList();
}

class GameServer {
  static const jp = 'jp';
  static const cn = 'cn';
}

class MyColors {
  static const Color setting_bg = Color(0xFFF9F9F9);
  static const Color setting_tile = Colors.white;
}

class GalleryItem {
  static const String servant = 'servant';
  static const String item = 'item';
  static const String event = 'event';
  static const String plan = 'plan';
  static const String craft = 'craft';
  static const String cmd_code = 'cmd_code';
  static const String gacha = 'gacha';
  static const String calculator = 'calculator';
  static const String master_equip = 'master_equip';
  static const String backup = 'backup';
  static const String more = 'more';
  static Map<String, GalleryItem> allItems;

  // instant part
  final String title;
  final IconData icon;
  final String routeName;
  final WidgetBuilder builder;
  final bool isInitialRoute;

  GalleryItem(
      {@required this.title,
      @required this.icon,
      @required this.routeName,
      @required this.builder,
      this.isInitialRoute})
      : assert(title != null),
        assert(icon != null),
        assert(routeName != null),
        assert(builder != null);

  @override
  String toString() {
    // TODO: implement toString
    return '$runtimeType($title $routeName)';
  }
}

class StringFilter {
  List<String> patterns;

  StringFilter(filterString) {
    patterns = filterString.split(RegExp(r'\s+'));
    patterns.removeWhere((item) => item == '');
  }

  bool match(String string, {bool matchCase = false}) {
    if (patterns.length == 0){
      print('filter is empty');
      return true;
    };
    if (!matchCase) {
      string = string.toLowerCase();
      patterns = patterns.map((p) => p.toLowerCase()).toList();
    }
    bool matched = false;
    for (String pattern in patterns) {
      pattern = pattern.toLowerCase();
      if (pattern[0] == '-' && pattern.length > 1) {
        if (string.contains(pattern.substring(1))) {
          matched = false;
          break;
        }
      } else if (pattern[0] == '+' && pattern.length > 1) {
        if (string.contains(pattern.substring(1))) {
          matched = true;
        } else {
          matched = false;
          break;
        }
      } else {
        if (string.contains(pattern)) {
          matched = true;
        }
      }
    }
    return matched;
  }
}
