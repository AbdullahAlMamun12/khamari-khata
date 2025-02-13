import 'package:get_storage/get_storage.dart';

class LocalStorage {

  static final LocalStorage _instance = LocalStorage._internal();
  factory LocalStorage() => _instance;
  LocalStorage._internal();

  final _userProfileName = ''.val('userProfileName');
  final _userProfilePhoto = ''.val('userProfilePhoto');
  final _login = false.val('login');
  final _remember = false.val('remember');
  final _token = ''.val('token');
  final _cookie = ''.val('cookie');
  final _userRole = ''.val('userRole');
  final _userId = ''.val('user_id');
  final _userEmail = ''.val('userEmail');
  final _languageCode = 'en'.val('languageCode');
  final _countryCode = 'UK'.val('DU');

  get userName => _userProfileName.val;
  set userNameValue(String value) => _userProfileName.val = value;

  get userPhoto => _userProfilePhoto.val;
  set userPhotoValue(String value) => _userProfilePhoto.val = value;

  get isLogin => _login.val;
  set isLoginValue(bool value) => _login.val = value;

  get isRemember => _remember.val;
  set isRememberValue(bool value) => _remember.val = value;

  get userId => _userId.val;
  set userIdValue(String value) => _userId.val = value;

  get cookie => _cookie.val;
  set cookieValue(String value) => _cookie.val = value;

  get userRole => _userRole.val;
  set userRoleValue(String value) => _userRole.val = value;

  get userEmail => _userEmail.val;
  set userEmailValue(String value) => _userEmail.val = value;

  get languageCode => _languageCode.val;
  set languageCodeValue(String value) => _languageCode.val = value;

  get countryCode => _countryCode.val;
  set countryCodeValue(String value) => _countryCode.val = value;
}