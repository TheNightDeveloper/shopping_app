import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:shopping_app/common/services/storage_service.dart';

//////////////// UI CONSTANTS ///////////////
const kBgColor = Color(0xffffffff);
const kBottomColor = Color(0xff284b63);
const kFirstColor = Color(0xffd9d9d9);
const kSecondColor = Color(0xff3c6e71);
const kThirdColor = Color(0xff353535);

TextStyle kLargeTextStyle = TextStyle(
  fontSize: 30.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'yekan',
);
TextStyle kmediumTextStyle = TextStyle(
  color: kSecondColor,
  fontSize: 16.sp,
  fontWeight: FontWeight.w500,
  fontFamily: 'yekan',
);

const CrossAxisAlignment RcrossAxisAlignment = CrossAxisAlignment.end;
const CrossAxisAlignment LcrossAxisAlignment = CrossAxisAlignment.start;
const MainAxisAlignment RmainAxisAlignment = MainAxisAlignment.end;
const MainAxisAlignment LmainAxisAlignment = MainAxisAlignment.start;



////////////////////// SERVICES CONSTANTS  ////////////////////////////
const _keyApplicationId = '9AJHEJVLMQRGuWBT24C1meVCYLmK2ghQG2RyUFdI';
const _keyClientKey = '3RiiFBRDjmdcHPzMfd9ORxQSorW0Ak7YcFOB56rv';
const _keyParseServerUrl = 'https://parseapi.back4app.com';
late final StorageService storageService;
const storageDeviceOpenFirstTime = 'app_first_open';
const storageUserTokenkey = 'user_token_key';
const storageProfilekey = 'user_profile_key';

/////////////////////  FUNCTIONS CONSTANTS ////////////////////////////

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Parse().initialize(_keyApplicationId, _keyParseServerUrl,
      clientKey: _keyClientKey, autoSendSessionId: true);
  storageService = await StorageService().init();

  // await Firebase.initializeApp();
}
