import 'package:nyoba/services/base_woo_api.dart';

String appId = '1590795778';
String url = "https://ahlypay.com";
String consumerKey = "ck_d2e5f15694dd2da5238b8dd32012ed273173c8ea";
String consumerSecret = "cs_b5cff500119f1fd415e1b15e65bebd18ccb4a70d";

// String version = '2.5.6';

// baseAPI for WooCommerce
BaseWooAPI baseAPI = BaseWooAPI(url, consumerKey, consumerSecret);

const debugNetworkProxy = false;
