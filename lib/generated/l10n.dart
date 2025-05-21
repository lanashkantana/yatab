// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get ContactUs {
    return Intl.message('Contact Us', name: 'ContactUs', desc: '', args: []);
  }

  /// `Chat with App`
  String get ChatwithApp {
    return Intl.message(
      'Chat with App',
      name: 'ChatwithApp',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message('Logout', name: 'Logout', desc: '', args: []);
  }

  /// `Are You Sure you want to logout`
  String get Are_You_Sure_you_want_to_logout {
    return Intl.message(
      'Are You Sure you want to logout',
      name: 'Are_You_Sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `lana shkantana`
  String get name {
    return Intl.message('lana shkantana', name: 'name', desc: '', args: []);
  }

  /// `lanaqitt@gmail.com`
  String get email {
    return Intl.message(
      'lanaqitt@gmail.com',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Chat with App`
  String get appBar_chat {
    return Intl.message(
      'Chat with App',
      name: 'appBar_chat',
      desc: '',
      args: [],
    );
  }

  /// `write a message`
  String get write_message {
    return Intl.message(
      'write a message',
      name: 'write_message',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get Contact_Us {
    return Intl.message('Contact Us', name: 'Contact_Us', desc: '', args: []);
  }

  /// `Life is short and the world is `
  String get Life_is_short_and_the_world_is {
    return Intl.message(
      'Life is short and the world is ',
      name: 'Life_is_short_and_the_world_is',
      desc: '',
      args: [],
    );
  }

  /// `It's a big world out there go`
  String get It_big_world_out_there_go {
    return Intl.message(
      'It\'s a big world out there go',
      name: 'It_big_world_out_there_go',
      desc: '',
      args: [],
    );
  }

  /// `Your dream holiday is `
  String get Your_dream_holiday_is {
    return Intl.message(
      'Your dream holiday is ',
      name: 'Your_dream_holiday_is',
      desc: '',
      args: [],
    );
  }

  /// `wide`
  String get wide {
    return Intl.message('wide', name: 'wide', desc: '', args: []);
  }

  /// `explore`
  String get explore {
    return Intl.message('explore', name: 'explore', desc: '', args: []);
  }

  /// `waiting`
  String get waiting {
    return Intl.message('waiting', name: 'waiting', desc: '', args: []);
  }

  /// `At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations`
  String get desc_onbarding1 {
    return Intl.message(
      'At Friends tours and travel, we customize reliable and trutworthy educational tours to destinations',
      name: 'desc_onbarding1',
      desc: '',
      args: [],
    );
  }

  /// `To get the best of your adventure you just need to leave and go where you like. we are waiting for you`
  String get desc_onbarding2 {
    return Intl.message(
      'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
      name: 'desc_onbarding2',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get get_Started {
    return Intl.message('Get Started', name: 'get_Started', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Pay`
  String get pay {
    return Intl.message('Pay', name: 'pay', desc: '', args: []);
  }

  /// `Payment`
  String get Payment {
    return Intl.message('Payment', name: 'Payment', desc: '', args: []);
  }

  /// `Continue`
  String get continuee {
    return Intl.message('Continue', name: 'continuee', desc: '', args: []);
  }

  /// `Thank You`
  String get Thank_You {
    return Intl.message('Thank You', name: 'Thank_You', desc: '', args: []);
  }

  /// `Your transaction was successful`
  String get successful {
    return Intl.message(
      'Your transaction was successful',
      name: 'successful',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get Date {
    return Intl.message('Date', name: 'Date', desc: '', args: []);
  }

  /// `Time`
  String get Time {
    return Intl.message('Time', name: 'Time', desc: '', args: []);
  }

  /// `From`
  String get From {
    return Intl.message('From', name: 'From', desc: '', args: []);
  }

  /// `Total`
  String get Total {
    return Intl.message('Total', name: 'Total', desc: '', args: []);
  }

  /// `Per night`
  String get Per_night {
    return Intl.message('Per night', name: 'Per_night', desc: '', args: []);
  }

  /// `Description`
  String get Description {
    return Intl.message('Description', name: 'Description', desc: '', args: []);
  }

  /// `Booking Hotel`
  String get Booking_Hotel {
    return Intl.message(
      'Booking Hotel',
      name: 'Booking_Hotel',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get Choose_Date {
    return Intl.message('Choose Date', name: 'Choose_Date', desc: '', args: []);
  }

  /// `Number of Rooms`
  String get Number_of_Rooms {
    return Intl.message(
      'Number of Rooms',
      name: 'Number_of_Rooms',
      desc: '',
      args: [],
    );
  }

  /// `1 Room - 2 Adults`
  String get Room_Adults {
    return Intl.message(
      '1 Room - 2 Adults',
      name: 'Room_Adults',
      desc: '',
      args: [],
    );
  }

  /// `Select Province`
  String get Select_Province {
    return Intl.message(
      'Select Province',
      name: 'Select_Province',
      desc: '',
      args: [],
    );
  }

  /// `Damascus`
  String get Damascus {
    return Intl.message('Damascus', name: 'Damascus', desc: '', args: []);
  }

  /// `Aleppo`
  String get Aleppo {
    return Intl.message('Aleppo', name: 'Aleppo', desc: '', args: []);
  }

  /// `Homs`
  String get Homs {
    return Intl.message('Homs', name: 'Homs', desc: '', args: []);
  }

  /// `Latakia`
  String get Latakia {
    return Intl.message('Latakia', name: 'Latakia', desc: '', args: []);
  }

  /// `Search for Hotel`
  String get Search_for_Hotel {
    return Intl.message(
      'Search for Hotel',
      name: 'Search_for_Hotel',
      desc: '',
      args: [],
    );
  }

  /// `Hotel Page`
  String get Hotel_Page {
    return Intl.message('Hotel Page', name: 'Hotel_Page', desc: '', args: []);
  }

  /// `Change language`
  String get Change_language {
    return Intl.message(
      'Change language',
      name: 'Change_language',
      desc: '',
      args: [],
    );
  }

  /// `ChooseLanguage`
  String get Choose_Language {
    return Intl.message(
      'ChooseLanguage',
      name: 'Choose_Language',
      desc: '',
      args: [],
    );
  }

  /// `Select Language`
  String get Select_Language {
    return Intl.message(
      'Select Language',
      name: 'Select_Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message('English', name: 'English', desc: '', args: []);
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message('Arabic', name: 'Arabic', desc: '', args: []);
  }

  /// `France`
  String get France {
    return Intl.message('France', name: 'France', desc: '', args: []);
  }

  /// `Italy`
  String get Italy {
    return Intl.message('Italy', name: 'Italy', desc: '', args: []);
  }

  /// `cancel`
  String get cancel {
    return Intl.message('cancel', name: 'cancel', desc: '', args: []);
  }

  /// `ok`
  String get ok {
    return Intl.message('ok', name: 'ok', desc: '', args: []);
  }

  /// `Time To Start To Create Your Accounnt`
  String get Time_To_Start_To_Create_Your_Accounnt {
    return Intl.message(
      'Time To Start To Create Your Accounnt',
      name: 'Time_To_Start_To_Create_Your_Accounnt',
      desc: '',
      args: [],
    );
  }

  /// `choose you'r Catagory`
  String get choose_you_Catagory {
    return Intl.message(
      'choose you\'r Catagory',
      name: 'choose_you_Catagory',
      desc: '',
      args: [],
    );
  }

  /// `guide`
  String get Guide {
    return Intl.message('guide', name: 'Guide', desc: '', args: []);
  }

  /// `Tourist`
  String get Tourist {
    return Intl.message('Tourist', name: 'Tourist', desc: '', args: []);
  }

  /// `Don't Have an Account`
  String get Dont_Have_an_Account {
    return Intl.message(
      'Don\'t Have an Account',
      name: 'Dont_Have_an_Account',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get Register {
    return Intl.message('Register', name: 'Register', desc: '', args: []);
  }

  /// `Login`
  String get Login {
    return Intl.message('Login', name: 'Login', desc: '', args: []);
  }

  /// `Do You have an account`
  String get Do_You_have_an_account {
    return Intl.message(
      'Do You have an account',
      name: 'Do_You_have_an_account',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
