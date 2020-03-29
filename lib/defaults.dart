import 'package:flutter/material.dart';

///=======================================
///             ENDPOINTS
///=======================================

const BASE_URL = "https://corona.lmao.ninja";
const NJ_MOBILE_URL = "https://maps.arcgis.com/apps/opsdashboard/index.html#/bc7b32237fa04d288dfed89e305e4892";
const NJ_WEB_URL = "https://maps.arcgis.com/apps/opsdashboard/index.html#/ec4bffd48f7e495182226eee7962b422";
const JHU_MOBILE_URL = "https://arcgis.com/apps/opsdashboard/index.html#/85320e2ea5424dfaaa75ae62e5c06e61";
const JHU_WEB_URL = "https://arcgis.com/apps/opsdashboard/index.html#/bda7594740fd40299423467b48e9ecf6";

///=======================================
///             APP LAYOUT
///=======================================

bool isMobile(BuildContext context) {
  return MediaQuery.of(context).size.width <= 768;
}

bool isWeb(BuildContext context) {
  return MediaQuery.of(context).size.width > 768;
}