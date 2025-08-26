import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ms'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? msText = '',
  }) =>
      [enText, msText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // MainMenu
  {
    'wuxl8rjt': {
      'en': 'CIPHER HUNT ',
      'ms': '',
    },
    'tm2tqw0c': {
      'en': 'PLAY',
      'ms': '',
    },
    '9hu4ryen': {
      'en': 'INFO',
      'ms': '',
    },
    'crojzapi': {
      'en': 'EXIT\n',
      'ms': '',
    },
    'ye1aioly': {
      'en': 'Home',
      'ms': '',
    },
  },
  // cclevel1
  {
    'arn2kzmd': {
      'en': 'WELCOME TO FIRST CHALLENGE!!',
      'ms': '',
    },
    'yt9ydanu': {
      'en': 'Try decoding this message: ZHOFRPH',
      'ms': '',
    },
    'kuydkbu7': {
      'en': ' CKRIUSK',
      'ms': '',
    },
    'ks7o580k': {
      'en': 'WELCOME',
      'ms': '',
    },
    '9rkshuaw': {
      'en': 'WELDONE',
      'ms': '',
    },
    'pxxl54z6': {
      'en': 'MELCOME',
      'ms': '',
    },
    'l7pewy4b': {
      'en': 'Home',
      'ms': '',
    },
  },
  // caesercipherlevel
  {
    '5y09n0ya': {
      'en': 'LEVEL 1',
      'ms': '',
    },
    '19uhtrt4': {
      'en': 'LEVEL 2',
      'ms': '',
    },
    '906post2': {
      'en': 'LEVEL 3',
      'ms': '',
    },
    '84n9v1u3': {
      'en': 'LEVEL 4',
      'ms': '',
    },
    'ck5eis1c': {
      'en': 'LEVEL 5',
      'ms': '',
    },
    's7mjket6': {
      'en': 'Choose Level',
      'ms': '',
    },
    'zf5aybki': {
      'en': 'Home',
      'ms': '',
    },
  },
  // CategoriesPages
  {
    '3bnfzlr1': {
      'en': 'CIPHER CATEGORIES ',
      'ms': '',
    },
    '0arl3qrp': {
      'en': 'Caeser Cipher',
      'ms': '',
    },
    'y8ekgllu': {
      'en': 'Atbash Cipher',
      'ms': '',
    },
    '1fqwlqhy': {
      'en': 'Vigenère Cipher',
      'ms': '',
    },
    'zckkhs8b': {
      'en': 'Morse code Cipher',
      'ms': '',
    },
    '118k8ifv': {
      'en': 'Home',
      'ms': '',
    },
  },
  // info
  {
    '0mr94djm': {
      'en': 'ABOUT',
      'ms': '',
    },
    'ni7upzub': {
      'en':
          '🕵️‍♀️ Welcome to Cipher Hunt!\nGet ready to crack codes, outsmart puzzles, and become a true cipher master!\nIn this game, you\'ll face hidden messages that can only be unlocked with logic, pattern recognition, and a little help from classic encryption techniques.\n\nThink you\'re just playing a game?\nThink again — you\'re training like a cryptographer! 🧠🔐\n\n🧩 What’s This Game About?\nCipher Hunt is a brain-boosting puzzle game where each level challenges you to encrypt or decrypt secret messages using different types of ciphers.\nThe more you play, the smarter you get — seriously.\n\nUse the tables, read the hints, and decode like a pro.\nOh, and don’t worry — it starts easy and gets trickier as you go. 😉',
      'ms': '',
    },
    'hip8ny1b': {
      'en': 'TYPE OF CIPHER',
      'ms': '',
    },
    'vkb9zrtu': {
      'en':
          '1️⃣ Caesar Cipher\nThe OG secret code.\nNamed after Julius Caesar, who used it to send private military messages! 🏛️\nEach letter in your message is shifted forward (or backward) a fixed number of places in the alphabet.\n\nSo, with a shift of 3:\nA → D, B → E, C → F…\nSimple? Yes. Easy to break? Only if you\'re not clever. 😏\n\n🧠 Great for beginners — fast to learn, tricky to master when the shift changes!',
      'ms': '',
    },
    'wft9r21e': {
      'en':
          '2️⃣ Atbash Cipher\nFlip it and reverse it. 🔄\nAtbash doesn’t shift — it mirrors the alphabet!\nThink of A as Z, B as Y, C as X… all the way across.\n\nSo if you write “HELLO,” it becomes something like “SVOOL.”\nYup — it’s like the alphabet looking in the mirror. 🪞\n\n🔐  One of the oldest ciphers ever used — and still very sneaky.\n\n',
      'ms': '',
    },
    'o3v12l0x': {
      'en':
          '3️⃣ Vigenère Cipher\nNow we’re getting serious.\nThe Vigenère cipher uses a keyword to scramble each letter differently.\n\nFor example:\nMessage: HELLO\nKey: KEYKE\nEncrypt each letter based on its matching key — like Caesar, but with multiple shifts! 🤯\n\nSo every letter is dancing to its own rhythm — no two are alike.\n\n💡 Pro tip: Patterns are everything. Break the keyword rhythm, and the whole code falls apart!',
      'ms': '',
    },
    'e144eyeu': {
      'en':
          '4️⃣ Morse Code\nDot. Dash. Decode.\nMorse code turns letters and numbers into beeps and clicks — or in our case, dots (.) and dashes (-).\n\nFor example:\nA = .-, B = -..., C = -.-.\nWords are separated with a / — just like this:\n.... . .-.. .-.. --- / .-- --- .-. .-.. -..\n\n🕵️‍♂️ From telegraphs to secret agents — Morse has a rich history. Now it’s your turn to master it!',
      'ms': '',
    },
    'qp25dtde': {
      'en': 'HOW?',
      'ms': '',
    },
    'kh8x74we': {
      'en':
          '🎮 How to Play Cipher Hunt\nReady to break some codes? Here\'s how Cipher Hunt works — simple, smart, and seriously fun:\n\n🔑 Step 1: Choose a Cipher\nPick one of the 4 cipher categories:\nCaesar, Atbash, Vigenère, or Morse Code.\nEach has its own unique rules — but don’t worry, we give you the tools to win.\n\n🧠 Step 2: Play Through 5 Levels\nEach cipher has 5 handcrafted levels that get a little trickier as you go.\nStart with simple words, then move on to longer phrases and sentence puzzles.\nCan you complete all 5? Only true codebreakers can. 🧩\n\n🛠️ Step 3: Use Your Cipher Table & Hints\nStuck? No problem.\nYou have access to a cipher table for each level.\nTap the hint button for a helpful clue — but we won’t spoil the fun too much. 😉\n\n✅ Step 4: Submit Your Answer\nOnce you think you’ve cracked it, type your answer and press submit.\nIf it’s correct — congrats! 🎉\nIf not — don’t give up! Try again, rethink your approach, and use your tools.\n\n🌟 Can You Master All 5 Levels?\nEach level you beat proves you\'re smarter, sharper, and sneakier than before.\nComplete them all and become a true Cipher Hunt Champion. 🏆🔐',
      'ms': '',
    },
    'vg5culeg': {
      'en': 'INFO',
      'ms': '',
    },
    'necxl9l3': {
      'en': 'Home',
      'ms': '',
    },
  },
  // AtbashCipherLevel
  {
    'mq0x1jgo': {
      'en': 'LEVEL 1',
      'ms': '',
    },
    'm988dd21': {
      'en': 'LEVEL 2',
      'ms': '',
    },
    '7ueczav6': {
      'en': 'LEVEL 3',
      'ms': '',
    },
    'pugjch2y': {
      'en': 'LEVEL 4',
      'ms': '',
    },
    'sfvvete4': {
      'en': 'LEVEL 5',
      'ms': '',
    },
    'wid1huqz': {
      'en': 'Choose Level',
      'ms': '',
    },
    'wvj3cwta': {
      'en': 'Home',
      'ms': '',
    },
  },
  // VIGENEREcipherlevel
  {
    'qtz3nyns': {
      'en': 'LEVEL 1',
      'ms': '',
    },
    '5a7meapm': {
      'en': 'LEVEL 2',
      'ms': '',
    },
    '7m8w5ryd': {
      'en': 'LEVEL 3',
      'ms': '',
    },
    'sisu7p2i': {
      'en': 'LEVEL 4',
      'ms': '',
    },
    'dmyhrso7': {
      'en': 'LEVEL 5',
      'ms': '',
    },
    'xe5uuoks': {
      'en': 'Choose Level',
      'ms': '',
    },
    'iyxapq7x': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPagecc1
  {
    'dpacge05': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'rlxkw42c': {
      'en': 'Level 1: Caesar Cipher Solved',
      'ms': '',
    },
    '4wztlem2': {
      'en': 'ZHOFRPH ➝ WELCOME\nYou used a Caesar Cipher with a shift of -3.',
      'ms': '',
    },
    'b0qg4czt': {
      'en':
          '💡 Did You Know? Julius Caesar used this cipher over 2,000 years ago in war messages!',
      'ms': '',
    },
    'a4nuukg3': {
      'en': 'Replay Level',
      'ms': '',
    },
    'xe0gf213': {
      'en': 'Main Menu',
      'ms': '',
    },
    'zswwlcu2': {
      'en': 'Next Level',
      'ms': '',
    },
    'iht8uaru': {
      'en': 'Home',
      'ms': '',
    },
  },
  // atbashlevel1
  {
    'y3kyg6w4': {
      'en': 'WELCOME TO FIRST CHALLENGE!!',
      'ms': '',
    },
    'zg7v68iu': {
      'en': 'Try Encrypt this message: HELLO',
      'ms': '',
    },
    'malcayzr': {
      'en': ' RUNNK',
      'ms': '',
    },
    'adpzhkyx': {
      'en': 'TWPPM',
      'ms': '',
    },
    'kd2bpfd7': {
      'en': 'SVOOL',
      'ms': '',
    },
    'bbcxadz7': {
      'en': 'ZVRRN',
      'ms': '',
    },
    'a673qies': {
      'en': 'Home',
      'ms': '',
    },
  },
  // cclevel2
  {
    '8an6j7qi': {
      'en': 'LEVEL 2 !',
      'ms': '',
    },
    'rtthdrxm': {
      'en': 'Try ENCYPT this message:\n DECRYPT',
      'ms': '',
    },
    '7ajnwx1z': {
      'en': 'KLVYFWA ',
      'ms': '',
    },
    '2pbipmmq': {
      'en': 'GWLAPXB',
      'ms': '',
    },
    'ra246ddv': {
      'en': 'HVLBQYG',
      'ms': '',
    },
    'taad5mg3': {
      'en': 'XYQGBTO',
      'ms': '',
    },
    '3g75i4wq': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageab1
  {
    'sq9j1lho': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '5jtrd6ox': {
      'en': 'Level 1 : Atbash Cipher Solved',
      'ms': '',
    },
    'j4tuvqfk': {
      'en': 'HELLO ➝ SVOOL\nYou used a Atbash Cipher.',
      'ms': '',
    },
    'q2g09ebn': {
      'en':
          '🔄 Mirror Code! Atbash flips the alphabet — A becomes Z, B becomes Y, and so on. It’s like looking in a mirror!\n\n',
      'ms': '',
    },
    '7dmhltrw': {
      'en': 'Replay Level',
      'ms': '',
    },
    'cf4pgx02': {
      'en': 'Main Menu',
      'ms': '',
    },
    '22f7fgt6': {
      'en': 'Next Level',
      'ms': '',
    },
    '0vkd3oy7': {
      'en': 'Home',
      'ms': '',
    },
  },
  // cclevel3
  {
    'x71x7bcw': {
      'en': 'LEVEL 3 !',
      'ms': '',
    },
    'cgiodnw8': {
      'en': 'Try ENCRYPT this message:\n INFORMATION',
      'ms': '',
    },
    'o8drww31': {
      'en': 'BZVVGBZRBVZ',
      'ms': '',
    },
    's9cau7mc': {
      'en': 'VZCGRQEAVGZ',
      'ms': '',
    },
    'zpf28d7l': {
      'en': 'AFNYYBQRJYF',
      'ms': '',
    },
    '7a56tf95': {
      'en': 'VASBEZNGVBA ',
      'ms': '',
    },
    'vjmtj3vb': {
      'en': 'Home',
      'ms': '',
    },
  },
  // cclevel4
  {
    'vtrpa5g6': {
      'en': 'LEVEL 4 !',
      'ms': '',
    },
    'ktnyg1ba': {
      'en': 'Try ENCYPT this message:\n DATA SECURITY',
      'ms': '',
    },
    '5mehj1gm': {
      'en': 'ZLVL APLKTLJ',
      'ms': '',
    },
    '03d8mb2r': {
      'en': 'HFIF QLDRZBD',
      'ms': '',
    },
    'asne7yig': {
      'en': 'IFYF XJFWYD',
      'ms': '',
    },
    'ex6cumis': {
      'en': 'JYPY CZQVMKM',
      'ms': '',
    },
    'z7mlhjz0': {
      'en': 'Home',
      'ms': '',
    },
  },
  // cclevel5
  {
    '22tbp678': {
      'en': 'LEVEL 5 !',
      'ms': '',
    },
    'c0cf6dr5': {
      'en': 'Try ENCYPT this message:\nWOOD WO DYWYBBYG',
      'ms': '',
    },
    '3wr5yal6': {
      'en': 'HELO MY FRIENDS',
      'ms': '',
    },
    '2hyh4sqj': {
      'en': 'MEET ME ANYWHERE',
      'ms': '',
    },
    'iz0pue1g': {
      'en': 'TELL ME RIGHTNOW',
      'ms': '',
    },
    '1uy25ggs': {
      'en': 'MEET ME TOMORROW',
      'ms': '',
    },
    'y4gdnhao': {
      'en': 'Home',
      'ms': '',
    },
  },
  // atbashlevel2
  {
    'ln0on448': {
      'en': 'LEVEL 2 !',
      'ms': '',
    },
    'l9cv49mi': {
      'en': 'Try decoding this message: \nXSVXP BLFI VNZRO',
      'ms': '',
    },
    '57dk72qu': {
      'en': ' CHECK YOUR MAILS',
      'ms': '',
    },
    'g5a505yh': {
      'en': 'BLOCK YOUR EMAIL',
      'ms': '',
    },
    'tvv2o2j6': {
      'en': 'CHECK YOUR HOUSE',
      'ms': '',
    },
    'ub35tlx1': {
      'en': 'CHECK YOUR EMAIL',
      'ms': '',
    },
    'k7jaqk05': {
      'en': 'Home',
      'ms': '',
    },
  },
  // atbashlevel3
  {
    'gmbb08a8': {
      'en': 'LEVEL 3 !!',
      'ms': '',
    },
    '1jgw14xs': {
      'en': 'Try Encrypt this message: \nMEET ME THERE SOON ',
      'ms': '',
    },
    '5wmtohla': {
      'en': ' NVVG NV GSVIV HLLM',
      'ms': '',
    },
    '6tz4x5ew': {
      'en': 'OWWH OW HTWJW IMML',
      'ms': '',
    },
    'emm1mbkt': {
      'en': 'LTTE LT HQTGT FJJK',
      'ms': '',
    },
    'em5gkfhn': {
      'en': 'PXXI PX IUXKX JNNO',
      'ms': '',
    },
    'thm3pc7n': {
      'en': 'Home',
      'ms': '',
    },
  },
  // atbashlevel4
  {
    'mu05b68f': {
      'en': 'LEVEL 4 !',
      'ms': '',
    },
    'sup5suyv': {
      'en': 'Try decoding this message:\n STAY STRONG MY FRIENDS',
      'ms': '',
    },
    'mk92jcko': {
      'en': ' HGYA HGILMH NA UIJVMWH',
      'ms': '',
    },
    'fg9sh9k3': {
      'en': 'FEXA FEGJKR LA SGPTKUF',
      'ms': '',
    },
    'i6jijws8': {
      'en': 'HGZB HGILMT NB UIRVMWH',
      'ms': '',
    },
    'w394065a': {
      'en': 'HGZB GFHKLS MA THQULVG',
      'ms': '',
    },
    '3634gcun': {
      'en': 'Home',
      'ms': '',
    },
  },
  // atbashlevel5
  {
    '4401cmdz': {
      'en': 'LEVEL 5 !',
      'ms': '',
    },
    'tub5mfpc': {
      'en': 'Try decoding this message: \nGSV JFRXP YILDM ULC',
      'ms': '',
    },
    'wvb0lnrv': {
      'en': ' THE ROADS BEING CUT',
      'ms': '',
    },
    '8msj5xlq': {
      'en': 'THE QUICK BROWN FOX',
      'ms': '',
    },
    'xmsevtvh': {
      'en': 'THE APPLES GROW RED',
      'ms': '',
    },
    'nu2ai8c0': {
      'en': 'THE WHITE CLEAN DOG',
      'ms': '',
    },
    '90hmlizv': {
      'en': 'Home',
      'ms': '',
    },
  },
  // vigenerelevel1
  {
    '73684m3g': {
      'en': 'WELCOME TO FIRST CHALLENGE!!',
      'ms': '',
    },
    'dkkqcere': {
      'en': 'Try Encrypt this message: \nCOMPUTER \nKEY : KEY',
      'ms': '',
    },
    'srbnexyv': {
      'en': ' MSKZYROU',
      'ms': '',
    },
    'm6whn81j': {
      'en': 'MSKZYROV',
      'ms': '',
    },
    '9kofism5': {
      'en': ' MSKZYRQV',
      'ms': '',
    },
    '4ci8ere0': {
      'en': 'MSKZYRWL',
      'ms': '',
    },
    'djds4rc3': {
      'en': 'Home',
      'ms': '',
    },
  },
  // vigenerelevel2
  {
    'nh23empw': {
      'en': 'LEVEL 2 !',
      'ms': '',
    },
    'zjq9wdus': {
      'en': 'Try ENCYPT this message:\nBLACK SMOKE \nKEY : SECURITY',
      'ms': '',
    },
    '3h89649h': {
      'en': ' TPCWB AFMCI ',
      'ms': '',
    },
    'er0qsdlf': {
      'en': 'TQCWB AFMCI',
      'ms': '',
    },
    '5e7w0y2e': {
      'en': 'TPCWB AFMCC',
      'ms': '',
    },
    'us0uvui8': {
      'en': 'TPCWZ AFMCI',
      'ms': '',
    },
    '0s1nbuh5': {
      'en': 'Home',
      'ms': '',
    },
  },
  // vigenerelevel3
  {
    'cfnb6237': {
      'en': 'LEVEL 3 !',
      'ms': '',
    },
    'oz2mxtwx': {
      'en': 'Try ENCYPT this message:\nFOOD DELIVERY SERVICE\nKEY : LUNCH',
      'ms': '',
    },
    'jia88y5e': {
      'en': 'QSBF KPFVXLCS FGYGCPH',
      'ms': '',
    },
    'ai7v7se0': {
      'en': 'QSBF KPFVXLCR FGYGCPS',
      'ms': '',
    },
    '3ybd8mim': {
      'en': 'QSBF KPFVXLCR FGYGCPG',
      'ms': '',
    },
    'xmvbdu8t': {
      'en': 'QSBF KPFVXLCS FGYGCPG ',
      'ms': '',
    },
    'grhzydzc': {
      'en': 'Home',
      'ms': '',
    },
  },
  // vigenerelevel4
  {
    '3gnmt40z': {
      'en': 'LEVEL 4 !',
      'ms': '',
    },
    '07fd9fj8': {
      'en':
          'Try ENCYPT this message:\n MACHINE LEARNING SYSTEM\nKEY : ARTIFICIAL',
      'ms': '',
    },
    'qs04qb4r': {
      'en': 'MRVPNVG TELREBUL AAATPM',
      'ms': '',
    },
    'c8cbhdfp': {
      'en': 'MRVPNVG TELREBVL AAATPM ',
      'ms': '',
    },
    't3rwb7hf': {
      'en': 'MRVPNVG TELREBVL AAATPOF',
      'ms': '',
    },
    'je5oeuhh': {
      'en': 'MRVONVG TELREBVL AAATPM',
      'ms': '',
    },
    'dbjzuusv': {
      'en': 'Home',
      'ms': '',
    },
  },
  // vigenerelevel5
  {
    'rc1r52xg': {
      'en': 'LEVEL 5 !',
      'ms': '',
    },
    'h8p4xra2': {
      'en': 'Try ENCYPT this message:\nNEVER STOP DREAMING\nKEY: MAGIC',
      'ms': '',
    },
    'c8kfl6m1': {
      'en': 'ZEBMT ETUX FDEGUKZG ',
      'ms': '',
    },
    'dwhsv9yt': {
      'en': 'ZEBMU ETUY FDEGUKZF',
      'ms': '',
    },
    'i48cd7sp': {
      'en': 'ZIMIG ELIP XVIZQATN',
      'ms': '',
    },
    'qamw09ii': {
      'en': 'ZIMIG ELIP XVJZQATN',
      'ms': '',
    },
    'wjj8o6rm': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageV1
  {
    'hr1j0bob': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '8mwnyney': {
      'en': 'Level 1 : Vigenère Cipher Solved',
      'ms': '',
    },
    'tgi97ybp': {
      'en':
          'COMPUTER ➝ MSKZYROV\nYou used a Vigenère Cipher with a key of - KEY .',
      'ms': '',
    },
    'jcw38a1j': {
      'en':
          '🔐 Stronger than Caesar! The Vigenère Cipher uses a keyword to mix multiple Caesar shifts.',
      'ms': '',
    },
    'pallxo2f': {
      'en': 'Replay Level',
      'ms': '',
    },
    'zaikko03': {
      'en': 'Main Menu',
      'ms': '',
    },
    'ey9a8sp2': {
      'en': 'Next Level',
      'ms': '',
    },
    '03z5z8bt': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageCC5
  {
    'w1qzp80v': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '70pr8reu': {
      'en': 'Level 5 : Caesar Cipher Solved',
      'ms': '',
    },
    'vm4bwgvd': {
      'en':
          'WOOD WO DYWYBBYG  ➝ MEET ME TOMORROW\nYou used a Caesar Cipher with a shift of - 10.',
      'ms': '',
    },
    '3vu4vf5a': {
      'en':
          '🎉 The Caesar Cipher is everywhere! Some modern websites still use it for puzzle games and escape rooms.',
      'ms': '',
    },
    'w1fy3e5j': {
      'en': 'Replay Level',
      'ms': '',
    },
    'n8ffdz1h': {
      'en': 'Main Menu',
      'ms': '',
    },
    'dnpy212y': {
      'en': 'Next Level',
      'ms': '',
    },
    '71v9k5x8': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageCC4
  {
    '54n3nzhp': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'grfccwh9': {
      'en': 'Level 4 : Caesar Cipher Solved',
      'ms': '',
    },
    'gqdi4xrh': {
      'en':
          'DATA SECURITY ➝ IFYF XJFWYD\nYou used a Caesar Cipher with a shift of - 5.',
      'ms': '',
    },
    'qens5665': {
      'en':
          '📜 Wrap Around! The Caesar Cipher wraps from Z back to A. That’s how “XYZ” can become “ABC”!',
      'ms': '',
    },
    'rhfcqcvu': {
      'en': 'Replay Level',
      'ms': '',
    },
    '46rcwc9p': {
      'en': 'Main Menu',
      'ms': '',
    },
    '18wg1xtk': {
      'en': 'Next Level',
      'ms': '',
    },
    '21l3zvlc': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageCC3
  {
    'gxmhbztg': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'mqlnt32h': {
      'en': 'Level 3 : Caesar Cipher Solved',
      'ms': '',
    },
    '4h9f0urh': {
      'en':
          'INFORMATION ➝VASBEZNGVBA\nYou used a Caesar Cipher with a shift of - 13.',
      'ms': '',
    },
    'w324a2zb': {
      'en':
          '🔒 Historical Hackers? Caesar\'s enemies eventually figured out his cipher… it’s one of the oldest crackable codes!',
      'ms': '',
    },
    'qq89jjwx': {
      'en': 'Replay Level',
      'ms': '',
    },
    'llkzwtuv': {
      'en': 'Main Menu',
      'ms': '',
    },
    'kweyulkk': {
      'en': 'Next Level',
      'ms': '',
    },
    '1tycpigz': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageaCC2
  {
    '0fhbblbg': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '1vp02s7g': {
      'en': 'Level 2 : Caesar Cipher Solved',
      'ms': '',
    },
    'yot9bfla': {
      'en': 'DECRYPT ➝ KLVFWA\nYou used a Caesar Cipher with a shift of - 7.',
      'ms': '',
    },
    'ubso9q9s': {
      'en':
          '🔁 Shift Happens! Caesar Cipher just shifts letters. A shift of 1 turns A into B, and so on!',
      'ms': '',
    },
    'cne5ch27': {
      'en': 'Replay Level',
      'ms': '',
    },
    '1gaog87i': {
      'en': 'Main Menu',
      'ms': '',
    },
    'v984n17q': {
      'en': 'Next Level',
      'ms': '',
    },
    'ald9rd0f': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageab5
  {
    'sf9e8nd9': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'rqyj7ewk': {
      'en': 'Level 5 : Atbash Cipher Solved',
      'ms': '',
    },
    'bjj25x65': {
      'en': 'GSV JFRXP  YILDM ULC➝ THE QUICK BROWN FOX\n',
      'ms': '',
    },
    'rjc8j0rc': {
      'en':
          '🧩 Simple Yet Cool! Though simple, Atbash is often used in puzzle games to throw players off.',
      'ms': '',
    },
    'x9ev2e5e': {
      'en': 'Replay Level',
      'ms': '',
    },
    '9oszoqg7': {
      'en': 'Main Menu',
      'ms': '',
    },
    'r98zbn7j': {
      'en': 'Next Level',
      'ms': '',
    },
    '1ee5l4o3': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageab4
  {
    '3blztvnx': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '394yawwq': {
      'en': 'Level 4 : Atbash Cipher Solved',
      'ms': '',
    },
    '4a3pvcpq': {
      'en': 'STAY STRONG MY FRIENDS  ➝ HGZB HGILMT NB UIRVMWH\nGOOD JOB!!',
      'ms': '',
    },
    '05r0un03': {
      'en':
          '🔁 Self-Inverse! If you encode a message twice with Atbash, you get the original message back!\n\n',
      'ms': '',
    },
    'ajvssduq': {
      'en': 'Replay Level',
      'ms': '',
    },
    '7vu0c1ei': {
      'en': 'Main Menu',
      'ms': '',
    },
    '0pbmhtmk': {
      'en': 'Next Level',
      'ms': '',
    },
    'awl8fxv9': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageab3
  {
    's64ckzvt': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'y9sdzhaf': {
      'en': 'Level 3 : Atbash Cipher Solved',
      'ms': '',
    },
    's9x4no4m': {
      'en': 'MEET ME THERE SOON ➝ NVVG NV GSVIV HLLM\n Looking Great huh!! ',
      'ms': '',
    },
    'dqq8pous': {
      'en':
          '📖 Ancient Puzzle! Atbash was used in old secret messages by replacing each letter with its opposite in the alphabet — it’s one of the earliest known cipher systems!\n\n',
      'ms': '',
    },
    'v670gcic': {
      'en': 'Replay Level',
      'ms': '',
    },
    'fe1qv0bu': {
      'en': 'Main Menu',
      'ms': '',
    },
    'kse3xojh': {
      'en': 'Next Level',
      'ms': '',
    },
    'eygyf38n': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageab2
  {
    'q3on5jeh': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '5w20aguj': {
      'en': 'Level 2 : Atbash Cipher Solved',
      'ms': '',
    },
    'yl9lfxfh': {
      'en': 'XSVXP BLFI VNZRO  ➝  CHECK YOUR EMAIL\n',
      'ms': '',
    },
    'c3ud9ro6': {
      'en':
          '🕍 Ancient Origins! This cipher was used in ancient Hebrew texts to hide names and meanings.\n\n',
      'ms': '',
    },
    'h4aog5u8': {
      'en': 'Replay Level',
      'ms': '',
    },
    '3nqpud7m': {
      'en': 'Main Menu',
      'ms': '',
    },
    'ejxwlbjn': {
      'en': 'Next Level',
      'ms': '',
    },
    '7836fsgp': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageV3
  {
    'dadfuwie': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'vc73t24d': {
      'en': 'Level 3 : Vigenère Cipher Solved',
      'ms': '',
    },
    '76i9hlgx': {
      'en':
          'FOOD DELIVERY SERVICE ➝ QSBF KPFVXLCS FGYGCPG\nYou used a Vigenère Cipher with a key of - LUNCH.',
      'ms': '',
    },
    '4sxvkfor': {
      'en':
          '📅 Keyword Power! A longer keyword makes it way harder to crack without a computer.',
      'ms': '',
    },
    '0gq9t2c0': {
      'en': 'Replay Level',
      'ms': '',
    },
    'ulbskwzc': {
      'en': 'Main Menu',
      'ms': '',
    },
    'm8fd79le': {
      'en': 'Next Level',
      'ms': '',
    },
    'fd8n14s0': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageV5
  {
    '66cgptfi': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'vh1k61b9': {
      'en': 'Level 5 : Vigenère Cipher Solved',
      'ms': '',
    },
    '3g19irn1': {
      'en':
          'NEVER STOP DREAMING ➝ ZEBMT ETUX FDEGUKZG \nYou used a Vigenère Cipher with a key of - MAGIC.',
      'ms': '',
    },
    'gftfve27': {
      'en':
          '💡 Beat by Brains! It stayed unbroken for 300 years before a human finally cracked it in the 1800s.',
      'ms': '',
    },
    'yknijj68': {
      'en': 'Replay Level',
      'ms': '',
    },
    'hor5rye3': {
      'en': 'Main Menu',
      'ms': '',
    },
    '6y4l0zs5': {
      'en': 'Next Level',
      'ms': '',
    },
    'zy3xq34u': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageV4
  {
    'uudrrnw0': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'y9t3cz64': {
      'en': 'Level 4 : Vigenère Cipher Solved',
      'ms': '',
    },
    'gh9vgsdb': {
      'en':
          'MACHINE LEARNING SYSTEM\n ➝ MRVPNVG TELREBVL AAATPM \nYou used a Vigenère Cipher with a key of - ARTIFICIAL.',
      'ms': '',
    },
    't36746nf': {
      'en':
          '📜 Was “unbreakable!” The Vigenère Cipher was once called \"le chiffre indéchiffrable\" (the indecipherable cipher).',
      'ms': '',
    },
    'a7ra9piz': {
      'en': 'Replay Level',
      'ms': '',
    },
    'p41vn6iu': {
      'en': 'Main Menu',
      'ms': '',
    },
    'z410n474': {
      'en': 'Next Level',
      'ms': '',
    },
    '34ytnvq0': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageV2
  {
    't9stsqdj': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    '5zxas6jf': {
      'en': 'Level 2 : Vigenère Cipher Solved',
      'ms': '',
    },
    'tcvriiuk': {
      'en':
          'BLACK SMOKE ➝ TPCWB AFMCI\nYou used a Vigenère Cipher with a key of - SECURITY.',
      'ms': '',
    },
    'uykap7sk': {
      'en':
          '🗝️ Polyalphabetic Magic! Each letter in the keyword changes how the letters are shifted. Sneaky!',
      'ms': '',
    },
    'knudhe2b': {
      'en': 'Replay Level',
      'ms': '',
    },
    'gyia08qo': {
      'en': 'Main Menu',
      'ms': '',
    },
    'l4moe4o0': {
      'en': 'Next Level',
      'ms': '',
    },
    's46sq2re': {
      'en': 'Home',
      'ms': '',
    },
  },
  // morsecode4
  {
    'v7r11col': {
      'en': 'LEVEL 4 !',
      'ms': '',
    },
    'v6l664wo': {
      'en': 'Choose the correct Morse code:\n“YOU DID YOUR BEST”',
      'ms': '',
    },
    'emxu4173': {
      'en': '-.-- --- ..- / -.. .. -.. / -.-- --- ..- .-. / -... . ... -.',
      'ms': '',
    },
    'kd5uw2hh': {
      'en': '-.-- --- ..- / -.. .. -.. / -.-- --- ..- .-. / -... . ...',
      'ms': '',
    },
    'mixlt2sp': {
      'en': '-.-- --- .. / -.. .. -.. / -.-- --- ..- .-. / -... . ... -',
      'ms': '',
    },
    'fa42jxq8': {
      'en': '-.-- --- ..- / -.. .. -.. / -.-- --- ..- .-. / -... . ... - ',
      'ms': '',
    },
    'tcfi7zrx': {
      'en': 'Home',
      'ms': '',
    },
  },
  // morsecode5
  {
    'uyyritxz': {
      'en': 'LEVEL 5 !',
      'ms': '',
    },
    'av8m67t7': {
      'en':
          'Choose the correct sentence:\n- .... . / ...- .. ... .. - --- .-. / .. ... / .... . .-. .',
      'ms': '',
    },
    'pzyvlltq': {
      'en': 'THE VISITORS ARE HERE',
      'ms': '',
    },
    'dcysr28i': {
      'en': 'THE VISITOR IS HERE',
      'ms': '',
    },
    'nffraosu': {
      'en': 'THE VISITOR IS NEAR',
      'ms': '',
    },
    '5828nd2b': {
      'en': 'THAT VISITOR IS HERE',
      'ms': '',
    },
    'n41sx8ro': {
      'en': 'Home',
      'ms': '',
    },
  },
  // morsecode3
  {
    '2yrmcdi7': {
      'en': 'LEVEL 3 !',
      'ms': '',
    },
    's187mh4l': {
      'en': ' Choose the correct Morse code for:\n“STAY AT HOME”',
      'ms': '',
    },
    '1ao72f16': {
      'en': '... - .- -.-- / .- - / .... --- --\n\n',
      'ms': '',
    },
    'odjs6lcn': {
      'en': '... - .- -.-- / .- - / .... --- -- .-',
      'ms': '',
    },
    '8v6gf06j': {
      'en': '... - .- -.-- / .- - / .... --- -- .',
      'ms': '',
    },
    '3id4056q': {
      'en': '... - .- -.-- / .- - / .... --- -- ..',
      'ms': '',
    },
    'nj3pzdsc': {
      'en': 'Home',
      'ms': '',
    },
  },
  // morsecode2
  {
    'xze96opk': {
      'en': 'LEVEL 2 !',
      'ms': '',
    },
    'zi6xjxqg': {
      'en': 'What is the correct translation?\n.. / .- -- / .... . .-. .',
      'ms': '',
    },
    'z4es4noi': {
      'en': 'I AM HERE',
      'ms': '',
    },
    'nrzqf7f7': {
      'en': 'I AM GONE',
      'ms': '',
    },
    'hi3ial02': {
      'en': 'I AM HOME',
      'ms': '',
    },
    '9cydc4v9': {
      'en': 'I AM NEAR',
      'ms': '',
    },
    'yincfz4k': {
      'en': 'Home',
      'ms': '',
    },
  },
  // morsecode1
  {
    'kn10rh90': {
      'en': 'WELCOME TO FIRST CHALLENGE!!',
      'ms': '',
    },
    's6hwq659': {
      'en': 'Translate this Morse code:\n--. --- --- -..',
      'ms': '',
    },
    'nwjwrjra': {
      'en': 'FOOD',
      'ms': '',
    },
    'p0v6jg1k': {
      'en': 'GOOD',
      'ms': '',
    },
    'h9akmmgo': {
      'en': 'MOOD',
      'ms': '',
    },
    'xs7m47sx': {
      'en': 'LOOP',
      'ms': '',
    },
    'pmqm5exm': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageMC1
  {
    '8oufjytz': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'yk4tw255': {
      'en': 'Level 1 : Morse Code Solved',
      'ms': '',
    },
    '0af91bhd': {
      'en': '--. ---- ---- -.. ➝ GOOD\nGood work let\'s play next level!!',
      'ms': '',
    },
    'y5z8w04d': {
      'en':
          '📻 Beep Beep! Morse code was first used in 1844 over telegraph wires. The first message? \"What hath God wrought?\"',
      'ms': '',
    },
    '7tnwtojb': {
      'en': 'Replay Level',
      'ms': '',
    },
    'h9nymx7o': {
      'en': 'Main Menu',
      'ms': '',
    },
    'onscb9do': {
      'en': 'Next Level',
      'ms': '',
    },
    '259649tw': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageMC2
  {
    'eb8iq8uq': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    's8mgixf2': {
      'en': 'Level 2 : Morse Code Solved',
      'ms': '',
    },
    't9r3okab': {
      'en': '.. / .- -- /.... . .-. .  ➝ I AM HERE\nNice work!!!',
      'ms': '',
    },
    'jxk49sbs': {
      'en':
          '⚓ SOS is not an acronym! It’s just the easiest pattern: \"... --- ...\" (3 dots, 3 dashes, 3 dots).',
      'ms': '',
    },
    '8u4rw6ck': {
      'en': 'Replay Level',
      'ms': '',
    },
    'dyu55pmb': {
      'en': 'Main Menu',
      'ms': '',
    },
    'kpfcoy86': {
      'en': 'Next Level',
      'ms': '',
    },
    'oz6eok4p': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageMC3
  {
    'lm1i72gr': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'lksncvc2': {
      'en': 'Level 3 : Morse Code Solved',
      'ms': '',
    },
    'faz0z4aj': {
      'en':
          'STAY AT HOME ➝ ... -.- -.-- / .- - / .... --- -- . \nYeayyy You Did It!!!!',
      'ms': '',
    },
    '35vmso4j': {
      'en':
          '🚀 Space Talk! Astronauts have used Morse code to signal when systems failed.',
      'ms': '',
    },
    'yt9jaqh7': {
      'en': 'Replay Level',
      'ms': '',
    },
    '5wxeptb2': {
      'en': 'Main Menu',
      'ms': '',
    },
    'gzhxan1j': {
      'en': 'Next Level',
      'ms': '',
    },
    'wd85g2wq': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageMC4
  {
    '455jgptm': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'jb6xqgqw': {
      'en': 'Level 4 : Morse Code Solved',
      'ms': '',
    },
    'cyfr2by3': {
      'en':
          'YOU DID YOUR BEST ➝ \n-.-- --- .-- / -.. .. -.. / -.-- --- ..- .-. / -... . ... - \n',
      'ms': '',
    },
    '9bhm85zx': {
      'en':
          '🧠 Blink Morse! One war prisoner blinked Morse code with his eyes to send a message during an interview!',
      'ms': '',
    },
    'caclzfwp': {
      'en': 'Replay Level',
      'ms': '',
    },
    '6ohv42r8': {
      'en': 'Main Menu',
      'ms': '',
    },
    '13hol3mx': {
      'en': 'Next Level',
      'ms': '',
    },
    'sw88l7z3': {
      'en': 'Home',
      'ms': '',
    },
  },
  // ConfettiWinnerPageMC5
  {
    'g0m5vjth': {
      'en': 'YOU CRACKED THE CODE!',
      'ms': '',
    },
    'k9pl0l20': {
      'en': 'Level 5 : Morse Code Solved',
      'ms': '',
    },
    'q4xipxc5': {
      'en':
          ' - .... . / ...- .. ... .. - --- .-. / .. ... / .... . .-. . ➝ THE VISITOR IS HERE\n',
      'ms': '',
    },
    '8xfdvjft': {
      'en':
          '🖐️ Morse with Anything! You can tap, blink, flashlight, or knock to send Morse – it\'s that flexible!',
      'ms': '',
    },
    'vl1axmm3': {
      'en': 'Replay Level',
      'ms': '',
    },
    '72zi8gq4': {
      'en': 'Main Menu',
      'ms': '',
    },
    'ngvwfgq6': {
      'en': 'Next Level',
      'ms': '',
    },
    '3jljjcjr': {
      'en': 'Home',
      'ms': '',
    },
  },
  // msCipherlevel
  {
    '5ilhxwfp': {
      'en': 'LEVEL 1',
      'ms': '',
    },
    '4lvz2h6v': {
      'en': 'LEVEL 2',
      'ms': '',
    },
    'nb5su4c2': {
      'en': 'LEVEL 3',
      'ms': '',
    },
    'psftsknx': {
      'en': 'LEVEL 4',
      'ms': '',
    },
    '7dh0548x': {
      'en': 'LEVEL 5',
      'ms': '',
    },
    'r9f9zseb': {
      'en': 'Choose Level',
      'ms': '',
    },
    'b31vzryb': {
      'en': 'Home',
      'ms': '',
    },
  },
  // CreateAccount3
  {
    'ur9s13m7': {
      'en': 'CipherHunt',
      'ms': '',
    },
    'dt1c2qt1': {
      'en': 'Get Started',
      'ms': '',
    },
    '4uy5mntc': {
      'en': 'Let\'s get started by filling out the form below.',
      'ms': '',
    },
    'ofi13uhi': {
      'en': 'Email',
      'ms': '',
    },
    'sgn11j6f': {
      'en': 'Password',
      'ms': '',
    },
    '63sgur11': {
      'en': 'Create Account',
      'ms': '',
    },
    'obfrthta': {
      'en': 'Or sign up with',
      'ms': '',
    },
    'dk3zmq85': {
      'en': 'Continue with Google',
      'ms': '',
    },
    'er664nue': {
      'en': 'Continue with Apple',
      'ms': '',
    },
    'i63ybj0m': {
      'en': ' have an account?  ',
      'ms': '',
    },
    '9c1xclo8': {
      'en': 'Sign in here',
      'ms': '',
    },
    '6x38juo3': {
      'en': 'Home',
      'ms': '',
    },
  },
  // Login3
  {
    'wstdqpa6': {
      'en': 'CipherHunt',
      'ms': '',
    },
    'er5yom0u': {
      'en': 'Welcome Back',
      'ms': '',
    },
    'if3naoy6': {
      'en': 'Fill out the information below in order to access your account.',
      'ms': '',
    },
    'fa78bcy5': {
      'en': 'Email',
      'ms': '',
    },
    'h430bsvl': {
      'en': 'Password',
      'ms': '',
    },
    '3i94fc2j': {
      'en': 'Sign In',
      'ms': '',
    },
    'fhripd9v': {
      'en': 'Or sign in with',
      'ms': '',
    },
    'yhjf4dzd': {
      'en': 'Continue with Google',
      'ms': '',
    },
    'j334fju8': {
      'en': 'Continue with Apple',
      'ms': '',
    },
    '53x52sel': {
      'en': 'Don\'t have an account?  ',
      'ms': '',
    },
    'j627qujn': {
      'en': 'Sign Up here',
      'ms': '',
    },
    'vawy4ot6': {
      'en': 'Home',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    '3meehr2u': {
      'en': 'to gave you the notifications',
      'ms': '',
    },
    '447n5i0s': {
      'en': '',
      'ms': '',
    },
    'wf81vjyg': {
      'en': '',
      'ms': '',
    },
    '20xzhbaw': {
      'en': '',
      'ms': '',
    },
    'wttjwb6c': {
      'en': '',
      'ms': '',
    },
    'wf87tqgt': {
      'en': '',
      'ms': '',
    },
    's826fqly': {
      'en': '',
      'ms': '',
    },
    'janxuiq3': {
      'en': '',
      'ms': '',
    },
    'avxp1kn8': {
      'en': '',
      'ms': '',
    },
    'sngdockr': {
      'en': '',
      'ms': '',
    },
    'd40uji3o': {
      'en': '',
      'ms': '',
    },
    'nvitzpf7': {
      'en': '',
      'ms': '',
    },
    'l12xkubj': {
      'en': '',
      'ms': '',
    },
    'wsscxnol': {
      'en': '',
      'ms': '',
    },
    't961jbcl': {
      'en': '',
      'ms': '',
    },
    'cimzeoko': {
      'en': '',
      'ms': '',
    },
    'nhst7xmn': {
      'en': '',
      'ms': '',
    },
    's01a3mpo': {
      'en': '',
      'ms': '',
    },
    '6r8v8n33': {
      'en': '',
      'ms': '',
    },
    'px4ljni7': {
      'en': '',
      'ms': '',
    },
    'f3lpi4qf': {
      'en': '',
      'ms': '',
    },
    'lbxadrss': {
      'en': '',
      'ms': '',
    },
    'lj5kz7et': {
      'en': '',
      'ms': '',
    },
    'lea899mz': {
      'en': '',
      'ms': '',
    },
    '8ksxn3jh': {
      'en': '',
      'ms': '',
    },
    'wcld57ng': {
      'en': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
