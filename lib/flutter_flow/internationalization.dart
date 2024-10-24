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

  static List<String> languages() => ['en', 'ar', 'ms'];

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
    String? arText = '',
    String? msText = '',
  }) =>
      [enText, arText, msText][languageIndex] ?? '';

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
  // Search
  {
    'n2uz9xy0': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    'unyszpsa': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'm0ltebkw': {
      'en': 'Find Jobs',
      'ar': '',
      'ms': '',
    },
    '8io2e8w9': {
      'en': 'Find Jobs',
      'ar': '',
      'ms': '',
    },
    'bp9qhsay': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // Home
  {
    'ni7z9ncj': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    'xbd582cz': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'rzxsbge0': {
      'en': 'Popular Searches',
      'ar': '',
      'ms': '',
    },
    '5golomjp': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'hlbv5yo4': {
      'en': 'Software',
      'ar': '',
      'ms': '',
    },
    'n5bylpag': {
      'en': 'Singer',
      'ar': '',
      'ms': '',
    },
    'n2g5qogh': {
      'en': 'Co-Pilot',
      'ar': '',
      'ms': '',
    },
    '30xju67h': {
      'en': 'Engineer',
      'ar': '',
      'ms': '',
    },
    'dkovg2l0': {
      'en': 'Flutter Developer',
      'ar': '',
      'ms': '',
    },
    'o0hji1kk': {
      'en': 'Fullstack Dev',
      'ar': '',
      'ms': '',
    },
    'jwnxouu4': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'hheb12zi': {
      'en': 'Crew',
      'ar': '',
      'ms': '',
    },
    't0drujtg': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'ad1lctux': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '5fwhls73': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // Settings
  {
    'cm46g5vg': {
      'en': 'Find the perfect job for you',
      'ar': '',
      'ms': '',
    },
    'c389cgaw': {
      'en': 'Search your career opportunity through 12,800 jobs',
      'ar': '',
      'ms': '',
    },
    'gcl9fo4f': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    '0ofk7gwu': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'jkw1on2q': {
      'en': 'Popular Searches',
      'ar': '',
      'ms': '',
    },
    'rlr029wy': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'oq49i18e': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'y1x4v6ve': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'shw0aauy': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'oz7g8wrb': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '6a7j7mw9': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'i57zjkb8': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '1dqh16zd': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '858wfl06': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '3456khz5': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'y38sw1ol': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'ee9xufoc': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'e14aaut3': {
      'en': 'Popular Today',
      'ar': '',
      'ms': '',
    },
    'z3gbsar4': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'ar': '',
      'ms': '',
    },
    'ejokc4hx': {
      'en': 'Jackson Hewiit',
      'ar': '',
      'ms': '',
    },
    'v6si2hgp': {
      'en': '24',
      'ar': '',
      'ms': '',
    },
    '2ms10547': {
      'en': '12h',
      'ar': '',
      'ms': '',
    },
    'hf63fh6t': {
      'en': 'Read Now',
      'ar': '',
      'ms': '',
    },
    'v1jm0r5i': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'ar': '',
      'ms': '',
    },
    '7vncsz4l': {
      'en': 'Jackson Hewiit',
      'ar': '',
      'ms': '',
    },
    'jscwzy0b': {
      'en': '24',
      'ar': '',
      'ms': '',
    },
    'll7j8py3': {
      'en': '12h',
      'ar': '',
      'ms': '',
    },
    'yk9h96id': {
      'en': 'Read Now',
      'ar': '',
      'ms': '',
    },
    'khz01xgq': {
      'en':
          'HSBC is getting back into consumer lending in the us according to...',
      'ar': '',
      'ms': '',
    },
    'b0ji3tfy': {
      'en': 'Jackson Hewiit',
      'ar': '',
      'ms': '',
    },
    'ewppnkiq': {
      'en': '24',
      'ar': '',
      'ms': '',
    },
    'ch6jidbe': {
      'en': '12h',
      'ar': '',
      'ms': '',
    },
    'zsl8v67t': {
      'en': 'Read Now',
      'ar': '',
      'ms': '',
    },
    'eenlus7r': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // Category
  {
    'jxhmwu4n': {
      'en': 'Find the perfect job for you',
      'ar': '',
      'ms': '',
    },
    '5b387kwh': {
      'en': 'Search your career opportunity through 12,800 jobs',
      'ar': '',
      'ms': '',
    },
    'hy5rkpsk': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    '1pdk357c': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'pzww898w': {
      'en': 'Option 1',
      'ar': '',
      'ms': '',
    },
    'xvodtlaj': {
      'en': 'Option 2',
      'ar': '',
      'ms': '',
    },
    'wt9b9v88': {
      'en': 'Option 3',
      'ar': '',
      'ms': '',
    },
    'hsras2rk': {
      'en': ' Select Category...',
      'ar': '',
      'ms': '',
    },
    '3t555ay4': {
      'en': 'Search...',
      'ar': '',
      'ms': '',
    },
    'unjk5ods': {
      'en': 'Category',
      'ar': '',
      'ms': '',
    },
    '9mx5wify': {
      'en': 'All Categories',
      'ar': '',
      'ms': '',
    },
    '3al4a7t1': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '9t0n1o8a': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'o78oqmvy': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'n7fdth82': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '46a3cco9': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'np0vviz9': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'jd4jf2fo': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'to1o7sle': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'al6by9q4': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'ydcr87mb': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'eu4s0pvf': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'ew2t2z60': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'v0yh62na': {
      'en': 'Category',
      'ar': '',
      'ms': '',
    },
  },
  // HomeSidebar
  {
    'e99e9r9k': {
      'en': 'Find the perfect job for you',
      'ar': '',
      'ms': '',
    },
    '8pykxn68': {
      'en': 'Search your career opportunity through 12,800 jobs',
      'ar': '',
      'ms': '',
    },
    '7odvgacx': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    'kxrzs4sq': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'q9kcing3': {
      'en': 'Menu',
      'ar': '',
      'ms': '',
    },
    '8oyuemrz': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
    'wk8tx06u': {
      'en': 'Search Jobs',
      'ar': '',
      'ms': '',
    },
    '9slv8gue': {
      'en': 'Saved Jobs',
      'ar': '',
      'ms': '',
    },
    '17ew5tic': {
      'en': 'Profile',
      'ar': '',
      'ms': '',
    },
    'ugyzkbzp': {
      'en': 'Settings',
      'ar': '',
      'ms': '',
    },
    'th4z0ngg': {
      'en': 'Log Out',
      'ar': '',
      'ms': '',
    },
    '6zer583m': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // HomeDash
  {
    'zzghgwlb': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    'kouivnzd': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'c5aflg3c': {
      'en': 'Popular Searches',
      'ar': '',
      'ms': '',
    },
    'rbkz3u6o': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'qrcv5sox': {
      'en': 'Software',
      'ar': '',
      'ms': '',
    },
    '8rmr3xbl': {
      'en': 'Singer',
      'ar': '',
      'ms': '',
    },
    'ucowcezf': {
      'en': 'Co-Pilot',
      'ar': '',
      'ms': '',
    },
    'n5f286w1': {
      'en': 'Engineer',
      'ar': '',
      'ms': '',
    },
    'qnoojagu': {
      'en': 'Flutter Developer',
      'ar': '',
      'ms': '',
    },
    '9x6evnop': {
      'en': 'Fullstack Dev',
      'ar': '',
      'ms': '',
    },
    'xuz3pr68': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'c5y7nlgb': {
      'en': 'Crew',
      'ar': '',
      'ms': '',
    },
    'pumaf2ef': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    'sjpk4g11': {
      'en': 'Fullstack',
      'ar': '',
      'ms': '',
    },
    '0gafk1l7': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // Login
  {
    'uet9796o': {
      'en': 'Welcome back!',
      'ar': '',
      'ms': '',
    },
    '7aulfn6r': {
      'en': 'Email address',
      'ar': '',
      'ms': '',
    },
    'il66xo7m': {
      'en': 'Password',
      'ar': '',
      'ms': '',
    },
    'u0rcn4vj': {
      'en': 'Continue',
      'ar': '',
      'ms': '',
    },
    'qfds0tph': {
      'en': 'Forgot password',
      'ar': '',
      'ms': '',
    },
    '1jr3ykkj': {
      'en': 'New to Explore Jobs? ',
      'ar': '',
      'ms': '',
    },
    '3lc8sigb': {
      'en': ' Create an account',
      'ar': '',
      'ms': '',
    },
    '5js55lvw': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // Signup
  {
    'znywu7er': {
      'en': 'Create an account',
      'ar': '',
      'ms': '',
    },
    'n0mdrfsf': {
      'en': 'I am candidate',
      'ar': '',
      'ms': '',
    },
    'etg3z29r': {
      'en': 'I am company',
      'ar': '',
      'ms': '',
    },
    '7h71oh42': {
      'en': 'First name',
      'ar': '',
      'ms': '',
    },
    'kw2sxlv4': {
      'en': 'Last name',
      'ar': '',
      'ms': '',
    },
    'jst7sq2g': {
      'en': 'Email address',
      'ar': '',
      'ms': '',
    },
    '6cfx6ory': {
      'en': 'Create password',
      'ar': '',
      'ms': '',
    },
    'oro4pfu8': {
      'en': 'I agree with ',
      'ar': '',
      'ms': '',
    },
    '4pwlwvuj': {
      'en': 'Terms and Conditions',
      'ar': '',
      'ms': '',
    },
    'mkycdojh': {
      'en': 'Continue',
      'ar': '',
      'ms': '',
    },
    '2g920zan': {
      'en': 'Already have an account?',
      'ar': '',
      'ms': '',
    },
    'weilazqy': {
      'en': 'Sign in',
      'ar': '',
      'ms': '',
    },
    'gv9slgzp': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // Signupcompany
  {
    'dc075yzp': {
      'en': 'Create an account',
      'ar': '',
      'ms': '',
    },
    '55rmv0j3': {
      'en': 'I am candidate',
      'ar': '',
      'ms': '',
    },
    'mbld9kzv': {
      'en': 'I am company',
      'ar': '',
      'ms': '',
    },
    'b5rsquzh': {
      'en': 'First name',
      'ar': '',
      'ms': '',
    },
    'a1nimg1v': {
      'en': 'Last name',
      'ar': '',
      'ms': '',
    },
    'myl4es5y': {
      'en': 'Email address',
      'ar': '',
      'ms': '',
    },
    '5d3wjr8k': {
      'en': 'Create password',
      'ar': '',
      'ms': '',
    },
    'x2p1efjg': {
      'en': 'I agree with ',
      'ar': '',
      'ms': '',
    },
    '43em25u4': {
      'en': 'Terms and Conditions',
      'ar': '',
      'ms': '',
    },
    'vg2luoj0': {
      'en': 'Continue',
      'ar': '',
      'ms': '',
    },
    'ykhozoqv': {
      'en': 'Already have an account?',
      'ar': '',
      'ms': '',
    },
    'rz2t166k': {
      'en': 'Sign in',
      'ar': '',
      'ms': '',
    },
    '6nsolhjb': {
      'en': 'Home',
      'ar': '',
      'ms': '',
    },
  },
  // MainWidget
  {
    '7zldgoa8': {
      'en': 'Job Title and Keyword',
      'ar': '',
      'ms': '',
    },
    '0ps63ddh': {
      'en': 'Location',
      'ar': '',
      'ms': '',
    },
    'sdsaaw6g': {
      'en': 'All Categories',
      'ar': '',
      'ms': '',
    },
  },
  // SideNav
  {
    'ml1oirxz': {
      'en': 'check.io',
      'ar': '',
      'ms': '',
    },
    '2c5i3eem': {
      'en': 'Search',
      'ar': '',
      'ms': '',
    },
    'j08ii8qw': {
      'en': 'Dashboard',
      'ar': '',
      'ms': '',
    },
    'i7fdxgzp': {
      'en': 'Customers',
      'ar': '',
      'ms': '',
    },
    '5ccqjvwz': {
      'en': 'Contracts',
      'ar': '',
      'ms': '',
    },
    'c9abts2c': {
      'en': 'My Team',
      'ar': '',
      'ms': '',
    },
    'i9ki4kh3': {
      'en': 'Profile',
      'ar': '',
      'ms': '',
    },
    '3ortdhl2': {
      'en': 'Andrew D.',
      'ar': '',
      'ms': '',
    },
    'tu6e9ho4': {
      'en': 'admin@gmail.com',
      'ar': '',
      'ms': '',
    },
    'rf2n9m9m': {
      'en': 'View Profile',
      'ar': '',
      'ms': '',
    },
  },
  // Filter
  {
    '7z75kfmv': {
      'en': 'Filter Jobs',
      'ar': '',
      'ms': '',
    },
    '6ye4lmkw': {
      'en': 'Type of Employment',
      'ar': '',
      'ms': '',
    },
    'n2tvtuno': {
      'en': 'Contract',
      'ar': '',
      'ms': '',
    },
    '41c2ngen': {
      'en': '1',
      'ar': '',
      'ms': '',
    },
    'h9k9wnv2': {
      'en': 'Full Time',
      'ar': '',
      'ms': '',
    },
    '8gworghe': {
      'en': '5',
      'ar': '',
      'ms': '',
    },
    'bgds2dbi': {
      'en': 'Internship',
      'ar': '',
      'ms': '',
    },
    'p0wxgn8q': {
      'en': '1',
      'ar': '',
      'ms': '',
    },
    '2q2aibkz': {
      'en': 'Part Time',
      'ar': '',
      'ms': '',
    },
    'sr36nq1w': {
      'en': '2',
      'ar': '',
      'ms': '',
    },
    'dp337jqu': {
      'en': 'Remote',
      'ar': '',
      'ms': '',
    },
    '6ix5icxn': {
      'en': '2',
      'ar': '',
      'ms': '',
    },
    'vuzts6kl': {
      'en': 'Training',
      'ar': '',
      'ms': '',
    },
    '1oipfil2': {
      'en': '0',
      'ar': '',
      'ms': '',
    },
    '0oofg38x': {
      'en': 'Experience Level',
      'ar': '',
      'ms': '',
    },
    '9zggo0wu': {
      'en': 'Entry-Level',
      'ar': '',
      'ms': '',
    },
    'n3ab1l4z': {
      'en': '2',
      'ar': '',
      'ms': '',
    },
    '3kaj1wqg': {
      'en': 'Manager / Executive',
      'ar': '',
      'ms': '',
    },
    'eldm6cwj': {
      'en': '1',
      'ar': '',
      'ms': '',
    },
    '8t3h03wm': {
      'en': 'Mid-Level',
      'ar': '',
      'ms': '',
    },
    'u2fn5e5o': {
      'en': '3',
      'ar': '',
      'ms': '',
    },
    'gc500yfa': {
      'en': 'No Experience',
      'ar': '',
      'ms': '',
    },
    '6a3hnkgq': {
      'en': '1',
      'ar': '',
      'ms': '',
    },
    'suvk69cr': {
      'en': 'Senior-Level',
      'ar': '',
      'ms': '',
    },
    'xz0ol748': {
      'en': '3',
      'ar': '',
      'ms': '',
    },
  },
  // t1
  {
    'zoq3bbjq': {
      'en': 'Filter Jobs',
      'ar': '',
      'ms': '',
    },
    'sqf2uy3h': {
      'en': 'Types of Employment',
      'ar': '',
      'ms': '',
    },
    'tir09l8m': {
      'en': 'Full-time',
      'ar': '',
      'ms': '',
    },
    'ljf6yqjd': {
      'en': 'Part-time',
      'ar': '',
      'ms': '',
    },
    '0dt8x87u': {
      'en': 'Contract',
      'ar': '',
      'ms': '',
    },
    'iengifc5': {
      'en': 'Internship',
      'ar': '',
      'ms': '',
    },
    'fj57bili': {
      'en': 'Experience Level',
      'ar': '',
      'ms': '',
    },
    '7trz8p05': {
      'en': 'Entry Level',
      'ar': '',
      'ms': '',
    },
    'yyi0wlfv': {
      'en': 'Mid Level',
      'ar': '',
      'ms': '',
    },
    'hcohmlnm': {
      'en': 'Senior Level',
      'ar': '',
      'ms': '',
    },
    'grhgj31p': {
      'en': 'Executive',
      'ar': '',
      'ms': '',
    },
  },
  // FilterHead
  {
    '7bpiw8bi': {
      'en': 'Filter Jobs',
      'ar': '',
      'ms': '',
    },
  },
  // listCompany
  {
    'rk6c12p6': {
      'en': 'Technology-Software',
      'ar': '',
      'ms': '',
    },
    'yomyr2rs': {
      'en': 'Fullstack Web Developer',
      'ar': '',
      'ms': '',
    },
    '5gwqosnb': {
      'en': 'Kuantan',
      'ar': '',
      'ms': '',
    },
    'w0jbhrv7': {
      'en': 'Internship',
      'ar': '',
      'ms': '',
    },
    'w7gymy73': {
      'en': 'June 8, 2022 by',
      'ar': '',
      'ms': '',
    },
    'nkfnelgu': {
      'en': 'Traveloka',
      'ar': '',
      'ms': '',
    },
  },
  // categogryList
  {
    'a3b9v12n': {
      'en': 'Construction',
      'ar': '',
      'ms': '',
    },
    'fnqcry38': {
      'en': '0 open positions',
      'ar': '',
      'ms': '',
    },
  },
  // lay
  {
    'kp12dqli': {
      'en': 'Business Development',
      'ar': '',
      'ms': '',
    },
    'qrqvd1vo': {
      'en': '1 open positions',
      'ar': '',
      'ms': '',
    },
  },
  // loginauth
  {
    '2t5ubp14': {
      'en': 'Welcome back!',
      'ar': '',
      'ms': '',
    },
    'wywy3utl': {
      'en': 'Email address',
      'ar': '',
      'ms': '',
    },
    'w1co0fm4': {
      'en': 'Password',
      'ar': '',
      'ms': '',
    },
    '343rx4dc': {
      'en': 'Continue',
      'ar': '',
      'ms': '',
    },
    'tc8pg425': {
      'en': 'Forgot password',
      'ar': '',
      'ms': '',
    },
    'td1u2xdn': {
      'en': 'New to Explore Jobs? ',
      'ar': '',
      'ms': '',
    },
    'n9fm3zqe': {
      'en': ' Create an account',
      'ar': '',
      'ms': '',
    },
  },
  // signauth
  {
    'cg9qr6i0': {
      'en': 'Create an account',
      'ar': '',
      'ms': '',
    },
    '0x7iq3ga': {
      'en': 'I am candidate\" | person \\ \"I am company\" | busines',
      'ar': '',
      'ms': '',
    },
    '9fel290k': {
      'en': 'First name',
      'ar': '',
      'ms': '',
    },
    'babpqu15': {
      'en': 'Last name',
      'ar': '',
      'ms': '',
    },
    'df8s1y8x': {
      'en': 'Email address',
      'ar': '',
      'ms': '',
    },
    'wbwygfef': {
      'en': 'Create password',
      'ar': '',
      'ms': '',
    },
    '5csgoxpj': {
      'en': 'I agree with ',
      'ar': '',
      'ms': '',
    },
    'x5wcm3g5': {
      'en': 'Terms and Conditions',
      'ar': '',
      'ms': '',
    },
    'f4hojoth': {
      'en': 'Continue',
      'ar': '',
      'ms': '',
    },
    'iwnda0bw': {
      'en': 'Already have an account?',
      'ar': '',
      'ms': '',
    },
    'ma79zo7s': {
      'en': 'Sign in',
      'ar': '',
      'ms': '',
    },
  },
  // Miscellaneous
  {
    '0wpbafs5': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'udfssm55': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'yjiqghzv': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'ofbmiano': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'x7ghhhfl': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'phlp0xft': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'p79ulpm3': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    '79rli7hz': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'jup8s7ya': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    '9zm9gegw': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    '8qwkdqdi': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'cgm9ivtz': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'owyzg6ow': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'eo41ofhf': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'ay8yuxj6': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'ab9q2atp': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    't6xmr22z': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'ic2pfoku': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'gslz6hch': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'nmrn4qmn': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'z5qj9ill': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    '6hl6d1h9': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'z15wr3w8': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'kg248n3a': {
      'en': '',
      'ar': '',
      'ms': '',
    },
    'ry5wvp5o': {
      'en': '',
      'ar': '',
      'ms': '',
    },
  },
].reduce((a, b) => a..addAll(b));
