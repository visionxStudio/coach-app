import 'package:digicoach/src/features/auth/new_auth/mobile_number_page/model/country_codes.dart';

class CountryCodeModel {
  final String countryName;
  final String dialCode;
  final String isoCode;

  final List<CountryCodeModel> countryCodes = [];

  CountryCodeModel({
    required this.countryName,
    required this.dialCode,
    required this.isoCode,
  });

  List<CountryCodeModel> getCountryCode() {
    for (int i = 0; i < countries.length; i++) {
      countryCodes.addAll(
        [
          CountryCodeModel(
            countryName: countries[i]["name"],
            dialCode: countries[i]["dialCode"],
            isoCode: countries[i]["isoCode"],
          ),
        ],
      );
    }
    return countryCodes;
  }
}
