import 'package:get_storage/get_storage.dart';

class AppPref{
  static final AppPref _instance = AppPref._internal();

  factory AppPref() => _instance;

  AppPref._internal();

  final _preferences = GetStorage();

  String get userLogin => _preferences.read('userLogin') ?? '';

  String get introScr => _preferences.read('intro') ?? '';

  set userLoginData(String value) => _preferences.write('userLogin', value);

  set introScrData(String value) => _preferences.write('intro',value) ;

  removeUser()=> _preferences.remove('userLogin');

}