import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

String getCountryName(String countryCode, BuildContext context) {
  return CountryLocalizations.of(context)?.countryName(countryCode: countryCode)??countryCode;
}

// Locale _getLocaleFromCountryCode(String countryCode) {
//   return Locale.fromSubtags(languageCode: 'en', countryCode: countryCode);
// }
